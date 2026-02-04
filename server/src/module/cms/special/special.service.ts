import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, Like } from 'typeorm';
import { SpecialEntity } from './entities/special.entity';
import { CreateSpecialDto, UpdateSpecialDto, SpecialListDto } from './dto/special.dto';

@Injectable()
export class SpecialService {
  constructor(
    @InjectRepository(SpecialEntity)
    private specialRepository: Repository<SpecialEntity>,
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
}
