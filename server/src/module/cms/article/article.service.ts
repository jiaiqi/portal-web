import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, Like } from 'typeorm';
import { ArticleEntity } from './entities/article.entity';
import { CategoryEntity } from '../category/entities/category.entity';
import { CreateArticleDto, UpdateArticleDto, ArticleListDto } from './dto/article.dto';
import { ResultData } from 'src/common/utils/result';

@Injectable()
export class ArticleService {
  constructor(
    @InjectRepository(ArticleEntity)
    private articleRepository: Repository<ArticleEntity>,
    @InjectRepository(CategoryEntity)
    private categoryRepository: Repository<CategoryEntity>,
  ) {}

  async create(createDto: CreateArticleDto, userName: string): Promise<ResultData> {
    try {
      console.log('Creating article with DTO:', JSON.stringify(createDto, null, 2));
      const article = this.articleRepository.create({
        ...createDto,
        createBy: userName,
        publishTime: createDto.publishTime || new Date(),
      });
      console.log('Article entity created:', JSON.stringify(article, null, 2));
      const result = await this.articleRepository.save(article);
      console.log('Article saved successfully:', result.articleId);
      return ResultData.ok(result);
    } catch (error) {
      console.error('Error creating article:', error);
      throw error;
    }
  }

  async update(updateDto: UpdateArticleDto, userName: string): Promise<ResultData> {
    const article = await this.articleRepository.findOne({
      where: { articleId: updateDto.articleId, delFlag: '0' },
    });
    if (!article) {
      throw new Error('文章不存在');
    }
    Object.assign(article, updateDto, { updateBy: userName });
    const result = await this.articleRepository.save(article);
    return ResultData.ok(result);
  }

  async delete(articleId: number, userName: string): Promise<ResultData> {
    await this.articleRepository.update(
      { articleId },
      { delFlag: '1', updateBy: userName },
    );
    return ResultData.ok();
  }

  async findOne(articleId: number): Promise<ResultData> {
    const article = await this.articleRepository.findOne({
      where: { articleId, delFlag: '0' },
      relations: ['category'],
    });
    return ResultData.ok(article);
  }

  async findList(query: ArticleListDto): Promise<ResultData> {
    const { pageNum = 1, pageSize = 10, categoryId, categoryCode, subCategoryId, title, status } = query;

    const where: any = { delFlag: '0' };
    if (categoryId) where.categoryId = categoryId;
    if (subCategoryId) where.subCategoryId = subCategoryId;
    if (title) where.title = Like(`%${title}%`);
    if (status) where.status = status;

    // 如果提供了分类编码，先查询分类ID
    if (categoryCode) {
      const category = await this.categoryRepository.findOne({
        where: { categoryCode, status: '1', delFlag: '0' }
      });
      if (category) {
        where.categoryId = category.categoryId;
      }
    }

    const [list, total] = await this.articleRepository.findAndCount({
      where,
      relations: ['category'],
      order: { isTop: 'DESC', publishTime: 'DESC' },
      skip: (pageNum - 1) * pageSize,
      take: pageSize,
    });

    return ResultData.ok({ list, total, pageNum, pageSize });
  }

  async updateStatus(articleId: number, status: string, userName: string): Promise<ResultData> {
    await this.articleRepository.update(
      { articleId },
      { status, updateBy: userName },
    );
    return ResultData.ok();
  }

  async incrementViewCount(articleId: number): Promise<void> {
    await this.articleRepository.increment({ articleId }, 'viewCount', 1);
  }
}
