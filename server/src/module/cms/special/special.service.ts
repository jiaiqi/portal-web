import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, Like, In } from 'typeorm';
import { SpecialEntity } from './entities/special.entity';
import { CreateSpecialDto, UpdateSpecialDto, SpecialListDto, AddSpecialArticleDto } from './dto/special.dto';
import { SpecialArticleEntity } from './entities/special-article.entity';
import { ArticleEntity } from '../article/entities/article.entity';

@Injectable()
export class SpecialService {
  constructor(
    @InjectRepository(SpecialEntity)
    private specialRepository: Repository<SpecialEntity>,
    @InjectRepository(SpecialArticleEntity)
    private specialArticleRepository: Repository<SpecialArticleEntity>,
    @InjectRepository(ArticleEntity)
    private articleRepository: Repository<ArticleEntity>,
  ) {}

  async create(createDto: CreateSpecialDto, userName: string): Promise<SpecialEntity> {
    const special = this.specialRepository.create({
      ...createDto,
      createBy: userName,
    });
    return this.specialRepository.save(special);
  }

  async update(updateDto: UpdateSpecialDto, userName: string): Promise<SpecialEntity> {
    const special = await this.specialRepository.findOne({
      where: { specialId: updateDto.specialId, delFlag: '0' },
    });
    if (!special) {
      throw new Error('专题不存在');
    }
    Object.assign(special, updateDto, { updateBy: userName });
    return this.specialRepository.save(special);
  }

  async delete(specialId: number, userName: string): Promise<void> {
    await this.specialRepository.update(
      { specialId },
      { delFlag: '1', updateBy: userName },
    );
  }

  async findOne(specialId: number): Promise<SpecialEntity> {
    return this.specialRepository.findOne({
      where: { specialId, delFlag: '0' },
    });
  }

  async findList(query: SpecialListDto) {
    const { pageNum = 1, pageSize = 10, title, status } = query;
    
    const where: any = { delFlag: '0' };
    if (title) where.title = Like(`%${title}%`);
    if (status) where.status = status;

    const [list, total] = await this.specialRepository.findAndCount({
      where,
      order: { sortOrder: 'ASC', createTime: 'DESC' },
      skip: (pageNum - 1) * pageSize,
      take: pageSize,
    });

    return { list, total, pageNum, pageSize };
  }

  async addArticle(addDto: AddSpecialArticleDto): Promise<SpecialArticleEntity> {
    const specialArticle = this.specialArticleRepository.create(addDto);
    return this.specialArticleRepository.save(specialArticle);
  }

  async removeArticle(id: number): Promise<void> {
    await this.specialArticleRepository.delete({ id });
  }

  async findArticlesByCategory(specialId: number, categoryId?: number) {
    const where: any = { specialId };
    if (categoryId) where.categoryId = categoryId;

    const specialArticles = await this.specialArticleRepository.find({
      where,
      order: { sortOrder: 'ASC' },
    });

    return specialArticles;
  }

  // 获取专题下的文章列表（带文章详情）
  async findSpecialArticlesWithDetail(specialId: number, pageNum = 1, pageSize = 10) {
    // 先获取专题下的文章关联列表
    const [specialArticles, total] = await this.specialArticleRepository.findAndCount({
      where: { specialId },
      order: { sortOrder: 'ASC' },
      skip: (pageNum - 1) * pageSize,
      take: pageSize,
    });

    if (specialArticles.length === 0) {
      return { list: [], total, pageNum, pageSize };
    }

    // 获取文章ID列表
    const articleIds = specialArticles.map(sa => sa.articleId);

    // 查询文章详情
    const articles = await this.articleRepository.find({
      where: { articleId: In(articleIds), delFlag: '0', status: '1' },
    });

    // 创建文章ID到文章详情的映射
    const articleMap = new Map(articles.map(a => [a.articleId, a]));

    // 合并数据，保持排序
    const list = specialArticles.map(sa => ({
      ...sa,
      article: articleMap.get(sa.articleId) || null,
    })).filter(item => item.article !== null);

    return { list, total, pageNum, pageSize };
  }

  // 获取所有启用的专题列表（用于门户网站）
  async findAllActive() {
    return this.specialRepository.find({
      where: { status: '1', delFlag: '0' },
      order: { sortOrder: 'ASC', createTime: 'DESC' },
    });
  }
}
