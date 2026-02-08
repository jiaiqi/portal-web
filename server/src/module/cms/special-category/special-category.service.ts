import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, Like } from 'typeorm';
import { SpecialCategoryEntity } from './entities/special-category.entity';
import { CreateSpecialCategoryDto, UpdateSpecialCategoryDto, SpecialCategoryListDto } from './dto/special-category.dto';

@Injectable()
export class SpecialCategoryService {
  constructor(
    @InjectRepository(SpecialCategoryEntity)
    private specialCategoryRepository: Repository<SpecialCategoryEntity>,
  ) {}

  async create(createDto: CreateSpecialCategoryDto, userName: string): Promise<SpecialCategoryEntity> {
    const specialCategory = this.specialCategoryRepository.create({
      ...createDto,
      createBy: userName,
    });
    return this.specialCategoryRepository.save(specialCategory);
  }

  async update(updateDto: UpdateSpecialCategoryDto, userName: string): Promise<SpecialCategoryEntity> {
    const specialCategory = await this.specialCategoryRepository.findOne({
      where: { categoryId: updateDto.categoryId, delFlag: '0' },
    });
    if (!specialCategory) {
      throw new Error('专题栏目不存在');
    }
    Object.assign(specialCategory, updateDto, { updateBy: userName });
    return this.specialCategoryRepository.save(specialCategory);
  }

  async delete(categoryId: number, userName: string): Promise<void> {
    const specialCategory = await this.specialCategoryRepository.findOne({
      where: { categoryId, delFlag: '0' },
    });
    if (!specialCategory) {
      throw new Error('专题栏目不存在');
    }
    await this.specialCategoryRepository.update(
      { categoryId },
      { delFlag: '1', updateBy: userName },
    );
  }

  async findOne(categoryId: number): Promise<SpecialCategoryEntity> {
    return this.specialCategoryRepository.findOne({
      where: { categoryId, delFlag: '0' },
    });
  }

  async findList(query: SpecialCategoryListDto) {
    const { specialId, categoryName, status } = query;

    const where: any = { delFlag: '0' };
    if (specialId) where.specialId = Number(specialId);
    if (categoryName) where.categoryName = Like(`%${categoryName}%`);
    if (status) where.status = status;

    const list = await this.specialCategoryRepository.find({
      where,
      order: { sortOrder: 'ASC', createTime: 'DESC' },
    });

    return list;
  }

  async findBySpecialId(specialId: number): Promise<SpecialCategoryEntity[]> {
    return this.specialCategoryRepository.find({
      where: { specialId, delFlag: '0', status: '1' },
      order: { sortOrder: 'ASC', createTime: 'DESC' },
    });
  }
}
