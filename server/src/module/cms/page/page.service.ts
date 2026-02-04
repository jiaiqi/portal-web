import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, Like } from 'typeorm';
import { PageEntity } from './entities/page.entity';
import { CreatePageDto, UpdatePageDto, PageListDto } from './dto/page.dto';

@Injectable()
export class PageService {
  constructor(
    @InjectRepository(PageEntity)
    private pageRepository: Repository<PageEntity>,
  ) {}

  async create(createDto: CreatePageDto, userName: string): Promise<PageEntity> {
    const page = this.pageRepository.create({
      ...createDto,
      createBy: userName,
    });
    return this.pageRepository.save(page);
  }

  async update(updateDto: UpdatePageDto, userName: string): Promise<PageEntity> {
    const page = await this.pageRepository.findOne({
      where: { pageId: updateDto.pageId },
    });
    if (!page) {
      throw new Error('单页不存在');
    }
    Object.assign(page, updateDto, { updateBy: userName });
    return this.pageRepository.save(page);
  }

  async delete(pageId: number, userName: string): Promise<void> {
    await this.pageRepository.update(
      { pageId },
      { updateBy: userName },
    );
  }

  async findOne(pageId: number): Promise<PageEntity> {
    return this.pageRepository.findOne({
      where: { pageId },
    });
  }

  async findList(query: PageListDto) {
    const { pageNum = 1, pageSize = 10, pageName, pageKey } = query;
    
    const where: any = {};
    if (pageName) where.pageName = Like(`%${pageName}%`);
    if (pageKey) where.pageKey = Like(`%${pageKey}%`);

    const [list, total] = await this.pageRepository.findAndCount({
      where,
      order: { createTime: 'DESC' },
      skip: (pageNum - 1) * pageSize,
      take: pageSize,
    });

    return { list, total, pageNum, pageSize };
  }
}
