import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, Like } from 'typeorm';
import { QuickLinkEntity } from './entities/quick-link.entity';
import { CreateQuickLinkDto, UpdateQuickLinkDto, QuickLinkListDto } from './dto/quick-link.dto';

@Injectable()
export class QuickLinkService {
  constructor(
    @InjectRepository(QuickLinkEntity)
    private quickLinkRepository: Repository<QuickLinkEntity>,
  ) {}

  async create(createDto: CreateQuickLinkDto, userName: string): Promise<QuickLinkEntity> {
    const quickLink = this.quickLinkRepository.create({
      ...createDto,
      createBy: userName,
    });
    return this.quickLinkRepository.save(quickLink);
  }

  async update(updateDto: UpdateQuickLinkDto, userName: string): Promise<QuickLinkEntity> {
    const quickLink = await this.quickLinkRepository.findOne({
      where: { linkId: updateDto.linkId, delFlag: '0' },
    });
    if (!quickLink) {
      throw new Error('快捷链接不存在');
    }
    Object.assign(quickLink, updateDto, { updateBy: userName });
    return this.quickLinkRepository.save(quickLink);
  }

  async delete(linkId: number, userName: string): Promise<void> {
    await this.quickLinkRepository.update(
      { linkId },
      { delFlag: '1', updateBy: userName },
    );
  }

  async findOne(linkId: number): Promise<QuickLinkEntity> {
    return this.quickLinkRepository.findOne({
      where: { linkId, delFlag: '0' },
    });
  }

  async findList(query: QuickLinkListDto) {
    const { pageNum = 1, pageSize = 10, linkName, status } = query;
    
    const where: any = { delFlag: '0' };
    if (linkName) where.linkName = Like(`%${linkName}%`);
    if (status) where.status = status;

    const [list, total] = await this.quickLinkRepository.findAndCount({
      where,
      order: { sortOrder: 'ASC', createTime: 'DESC' },
      skip: (pageNum - 1) * pageSize,
      take: pageSize,
    });

    return { list, total, pageNum, pageSize };
  }
}
