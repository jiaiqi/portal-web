import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { FocusEntity } from './entities/focus.entity';
import { CreateFocusDto, UpdateFocusDto, FocusListDto } from './dto/focus.dto';
import { ResultData } from 'src/common/utils/result';

@Injectable()
export class FocusService {
  constructor(
    @InjectRepository(FocusEntity)
    private readonly focusRepository: Repository<FocusEntity>,
  ) {}

  async findList(query: FocusListDto) {
    const { pageNum = 1, pageSize = 10, imageType, status } = query;
    const queryBuilder = this.focusRepository
      .createQueryBuilder('focus')
      .where('focus.delFlag = :delFlag', { delFlag: '0' });

    if (imageType) {
      queryBuilder.andWhere('focus.imageType = :imageType', { imageType });
    }

    if (status !== undefined) {
      queryBuilder.andWhere('focus.status = :status', { status });
    }

    queryBuilder
      .orderBy('focus.sortOrder', 'DESC')
      .addOrderBy('focus.createTime', 'DESC')
      .skip((pageNum - 1) * pageSize)
      .take(pageSize);

    const [list, total] = await queryBuilder.getManyAndCount();
    return ResultData.ok({ list, total });
  }

  async getHomeFocus() {
    const bigImages = await this.focusRepository.find({
      where: { imageType: 'big', status: '0', delFlag: '0' },
      order: { sortOrder: 'DESC', createTime: 'DESC' },
      take: 1,
    });

    const smallImages = await this.focusRepository.find({
      where: { imageType: 'small', status: '0', delFlag: '0' },
      order: { sortOrder: 'DESC', createTime: 'DESC' },
      take: 3,
    });

    return ResultData.ok({
      big: bigImages[0]?.imageUrl || '',
      small1: smallImages[0]?.imageUrl || '',
      small2: smallImages[1]?.imageUrl || '',
      small3: smallImages[2]?.imageUrl || '',
    });
  }

  async findOne(id: number) {
    const focus = await this.focusRepository.findOne({
      where: { focusId: id, delFlag: '0' },
    });
    return focus;
  }

  async create(createDto: CreateFocusDto, userName: string) {
    const focus = this.focusRepository.create({
      ...createDto,
      createBy: userName,
    });
    const result = await this.focusRepository.save(focus);
    return ResultData.ok(result);
  }

  async update(updateDto: UpdateFocusDto, userName: string) {
    const { focusId, ...updateData } = updateDto;
    await this.focusRepository.update(
      { focusId },
      {
        ...updateData,
        updateBy: userName,
      },
    );
    return ResultData.ok();
  }

  async delete(id: number, userName: string) {
    await this.focusRepository.update(
      { focusId: id },
      {
        delFlag: '1',
        updateBy: userName,
      },
    );
    return ResultData.ok();
  }
}
