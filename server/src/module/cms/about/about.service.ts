import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, Like } from 'typeorm';
import { AboutSectionEntity } from './entities/about-section.entity';
import { AboutArticleEntity } from './entities/about-article.entity';
import {
  CreateSectionDto,
  UpdateSectionDto,
  SectionListDto,
  CreateAboutArticleDto,
  UpdateAboutArticleDto,
  AboutArticleListDto,
} from './dto/about.dto';
import { ResultData } from 'src/common/utils/result';

@Injectable()
export class AboutService {
  constructor(
    @InjectRepository(AboutSectionEntity)
    private sectionRepository: Repository<AboutSectionEntity>,
    @InjectRepository(AboutArticleEntity)
    private articleRepository: Repository<AboutArticleEntity>,
  ) {}

  // ==================== 栏目管理 ====================

  async createSection(createDto: CreateSectionDto, userName: string): Promise<ResultData> {
    const section = this.sectionRepository.create({
      ...createDto,
      createBy: userName,
    });
    const result = await this.sectionRepository.save(section);
    return ResultData.ok(result);
  }

  async updateSection(updateDto: UpdateSectionDto, userName: string): Promise<ResultData> {
    const section = await this.sectionRepository.findOne({
      where: { sectionId: updateDto.sectionId, delFlag: '0' },
    });
    if (!section) {
      return ResultData.fail(500, '栏目不存在');
    }
    Object.assign(section, updateDto, { updateBy: userName });
    const result = await this.sectionRepository.save(section);
    return ResultData.ok(result);
  }

  async deleteSection(sectionId: number, userName: string): Promise<ResultData> {
    await this.sectionRepository.update(
      { sectionId },
      { delFlag: '1', updateBy: userName },
    );
    return ResultData.ok();
  }

  async findOneSection(sectionId: number): Promise<ResultData> {
    const section = await this.sectionRepository.findOne({
      where: { sectionId, delFlag: '0' },
    });
    return ResultData.ok(section);
  }

  async findSectionByKey(sectionKey: string): Promise<ResultData> {
    const section = await this.sectionRepository.findOne({
      where: { sectionKey, delFlag: '0', status: '1' },
    });
    return ResultData.ok(section);
  }

  async findSectionList(query: SectionListDto): Promise<ResultData> {
    const { pageNum = 1, pageSize = 10, sectionName, status } = query;

    const where: any = { delFlag: '0' };
    if (sectionName) where.sectionName = Like(`%${sectionName}%`);
    if (status) where.status = status;

    const [list, total] = await this.sectionRepository.findAndCount({
      where,
      order: { sortOrder: 'ASC', createTime: 'DESC' },
      skip: (pageNum - 1) * pageSize,
      take: pageSize,
    });

    return ResultData.ok({ list, total, pageNum, pageSize });
  }

  async findAllSections(): Promise<ResultData> {
    const list = await this.sectionRepository.find({
      where: { delFlag: '0', status: '1' },
      order: { sortOrder: 'ASC' },
    });
    return ResultData.ok(list);
  }

  // ==================== 文章管理 ====================

  async createArticle(createDto: CreateAboutArticleDto, userName: string): Promise<ResultData> {
    const article = this.articleRepository.create({
      ...createDto,
      createBy: userName,
    });
    const result = await this.articleRepository.save(article);
    return ResultData.ok(result);
  }

  async updateArticle(updateDto: UpdateAboutArticleDto, userName: string): Promise<ResultData> {
    const article = await this.articleRepository.findOne({
      where: { articleId: updateDto.articleId, delFlag: '0' },
    });
    if (!article) {
      return ResultData.fail(500, '文章不存在');
    }
    Object.assign(article, updateDto, { updateBy: userName });
    const result = await this.articleRepository.save(article);
    return ResultData.ok(result);
  }

  async deleteArticle(articleId: number, userName: string): Promise<ResultData> {
    await this.articleRepository.update(
      { articleId },
      { delFlag: '1', updateBy: userName },
    );
    return ResultData.ok();
  }

  async findOneArticle(articleId: number): Promise<ResultData> {
    const article = await this.articleRepository.findOne({
      where: { articleId, delFlag: '0' },
    });
    return ResultData.ok(article);
  }

  async findArticleList(query: AboutArticleListDto): Promise<ResultData> {
    const { pageNum = 1, pageSize = 10, sectionKey, title, status } = query;

    const where: any = { delFlag: '0' };
    if (sectionKey) where.sectionKey = sectionKey;
    if (title) where.title = Like(`%${title}%`);
    if (status) where.status = status;

    const [list, total] = await this.articleRepository.findAndCount({
      where,
      order: { sortOrder: 'ASC', createTime: 'DESC' },
      skip: (pageNum - 1) * pageSize,
      take: pageSize,
    });

    return ResultData.ok({ list, total, pageNum, pageSize });
  }

  async findArticlesBySectionKey(sectionKey: string): Promise<ResultData> {
    const list = await this.articleRepository.find({
      where: { sectionKey, delFlag: '0', status: '1' },
      order: { sortOrder: 'ASC', createTime: 'DESC' },
    });
    return ResultData.ok(list);
  }
}
