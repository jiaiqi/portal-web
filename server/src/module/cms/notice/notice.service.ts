import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { NoticeEntity } from './entities/notice.entity';
import { CreateNoticeDto, UpdateNoticeDto, NoticeListDto } from './dto/notice.dto';
import { ResultData } from 'src/common/utils/result';

@Injectable()
export class NoticeService {
  constructor(
    @InjectRepository(NoticeEntity)
    private readonly noticeRepository: Repository<NoticeEntity>,
  ) {}

  async findList(query: NoticeListDto) {
    const { pageNum = 1, pageSize = 10, title, noticeType, status } = query;
    const queryBuilder = this.noticeRepository
      .createQueryBuilder('notice')
      .where('notice.delFlag = :delFlag', { delFlag: '0' });

    if (title) {
      queryBuilder.andWhere('notice.title LIKE :title', { title: `%${title}%` });
    }

    if (noticeType) {
      queryBuilder.andWhere('notice.noticeType = :noticeType', { noticeType });
    }

    if (status !== undefined) {
      queryBuilder.andWhere('notice.status = :status', { status });
    }

    queryBuilder
      .orderBy('notice.sortOrder', 'DESC')
      .addOrderBy('notice.createTime', 'DESC')
      .skip((pageNum - 1) * pageSize)
      .take(pageSize);

    const [list, total] = await queryBuilder.getManyAndCount();
    return ResultData.ok({ list, total });
  }

  async findOne(id: number) {
    const notice = await this.noticeRepository.findOne({
      where: { noticeId: id, delFlag: '0' },
    });
    return ResultData.ok(notice);
  }

  async create(createDto: CreateNoticeDto, userName: string) {
    const notice = this.noticeRepository.create({
      ...createDto,
      createBy: userName,
    });
    const result = await this.noticeRepository.save(notice);
    return ResultData.ok(result);
  }

  async update(updateDto: UpdateNoticeDto, userName: string) {
    const { noticeId, ...updateData } = updateDto;
    await this.noticeRepository.update(
      { noticeId },
      {
        ...updateData,
        updateBy: userName,
      },
    );
    return ResultData.ok();
  }

  async delete(id: number, userName: string) {
    await this.noticeRepository.update(
      { noticeId: id },
      {
        delFlag: '1',
        updateBy: userName,
      },
    );
    return ResultData.ok();
  }
}
