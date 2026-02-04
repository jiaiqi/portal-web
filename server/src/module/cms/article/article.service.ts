import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, Like } from 'typeorm';
import { ArticleEntity } from './entities/article.entity';
import { CreateArticleDto, UpdateArticleDto, ArticleListDto } from './dto/article.dto';

@Injectable()
export class ArticleService {
  constructor(
    @InjectRepository(ArticleEntity)
    private articleRepository: Repository<ArticleEntity>,
  ) {}

  async create(createDto: CreateArticleDto, userName: string): Promise<ArticleEntity> {
    const article = this.articleRepository.create({
      ...createDto,
      createBy: userName,
      publishTime: createDto.publishTime || new Date(),
    });
    return this.articleRepository.save(article);
  }

  async update(updateDto: UpdateArticleDto, userName: string): Promise<ArticleEntity> {
    const article = await this.articleRepository.findOne({
      where: { articleId: updateDto.articleId, delFlag: '0' },
    });
    if (!article) {
      throw new Error('文章不存在');
    }
    Object.assign(article, updateDto, { updateBy: userName });
    return this.articleRepository.save(article);
  }

  async delete(articleId: number, userName: string): Promise<void> {
    await this.articleRepository.update(
      { articleId },
      { delFlag: '1', updateBy: userName },
    );
  }

  async findOne(articleId: number): Promise<ArticleEntity> {
    return this.articleRepository.findOne({
      where: { articleId, delFlag: '0' },
      relations: ['category'],
    });
  }

  async findList(query: ArticleListDto) {
    const { pageNum = 1, pageSize = 10, categoryId, title, status } = query;
    
    const where: any = { delFlag: '0' };
    if (categoryId) where.categoryId = categoryId;
    if (title) where.title = Like(`%${title}%`);
    if (status) where.status = status;

    const [list, total] = await this.articleRepository.findAndCount({
      where,
      relations: ['category'],
      order: { isTop: 'DESC', publishTime: 'DESC' },
      skip: (pageNum - 1) * pageSize,
      take: pageSize,
    });

    return { list, total, pageNum, pageSize };
  }

  async updateStatus(articleId: number, status: string, userName: string): Promise<void> {
    await this.articleRepository.update(
      { articleId },
      { status, updateBy: userName },
    );
  }

  async incrementViewCount(articleId: number): Promise<void> {
    await this.articleRepository.increment({ articleId }, 'viewCount', 1);
  }
}
