import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, Like } from 'typeorm';
import { LinkEntity } from './entities/link.entity';
import { CreateLinkDto, UpdateLinkDto, LinkListDto } from './dto/link.dto';

@Injectable()
export class LinkService {
  constructor(
    @InjectRepository(LinkEntity)
    private linkRepository: Repository<LinkEntity>,
  ) {}

  async create(createDto: CreateLinkDto, userName: string): Promise<LinkEntity> {
    const link = this.linkRepository.create({
      ...createDto,
      createBy: userName,
    });
    return this.linkRepository.save(link);
  }

  async update(updateDto: UpdateLinkDto, userName: string): Promise<LinkEntity> {
    const link = await this.linkRepository.findOne({
      where: { linkId: updateDto.linkId, delFlag: '0' },
    });
    if (!link) {
      throw new Error('友情链接不存在');
    }
    Object.assign(link, updateDto, { updateBy: userName });
    return this.linkRepository.save(link);
  }

  async delete(linkId: number, userName: string): Promise<void> {
    await this.linkRepository.update(
      { linkId },
      { delFlag: '1', updateBy: userName },
    );
  }

  async findOne(linkId: number): Promise<LinkEntity> {
    return this.linkRepository.findOne({
      where: { linkId, delFlag: '0' },
    });
  }

  async findList(query: LinkListDto) {
    const { pageNum = 1, pageSize = 10, linkName, status } = query;
    
    const where: any = { delFlag: '0' };
    if (linkName) where.linkName = Like(`%${linkName}%`);
    if (status) where.status = status;

    const [list, total] = await this.linkRepository.findAndCount({
      where,
      order: { sortOrder: 'ASC', createTime: 'DESC' },
      skip: (pageNum - 1) * pageSize,
      take: pageSize,
    });

    return { list, total, pageNum, pageSize };
  }
}
