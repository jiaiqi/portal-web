import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, Like } from 'typeorm';
import { CategoryEntity } from './entities/category.entity';
import { CreateCategoryDto, UpdateCategoryDto, CategoryListDto } from './dto/category.dto';

@Injectable()
export class CategoryService {
  constructor(
    @InjectRepository(CategoryEntity)
    private categoryRepository: Repository<CategoryEntity>,
  ) {}

  async create(createDto: CreateCategoryDto, userName: string): Promise<CategoryEntity> {
    const category = this.categoryRepository.create({
      ...createDto,
      createBy: userName,
    });
    return this.categoryRepository.save(category);
  }

  async update(updateDto: UpdateCategoryDto, userName: string): Promise<CategoryEntity> {
    const category = await this.categoryRepository.findOne({
      where: { categoryId: updateDto.categoryId, delFlag: '0' },
    });
    if (!category) {
      throw new Error('分类不存在');
    }
    Object.assign(category, updateDto, { updateBy: userName });
    return this.categoryRepository.save(category);
  }

  async delete(categoryId: number, userName: string): Promise<void> {
    await this.categoryRepository.update(
      { categoryId },
      { delFlag: '1', updateBy: userName },
    );
  }

  async findOne(categoryId: number): Promise<CategoryEntity> {
    return this.categoryRepository.findOne({
      where: { categoryId, delFlag: '0' },
    });
  }

  async findList(query: CategoryListDto) {
    const { categoryName, status } = query;
    
    const where: any = { delFlag: '0' };
    if (categoryName) where.categoryName = Like(`%${categoryName}%`);
    if (status) where.status = status;

    return this.categoryRepository.find({
      where,
      order: { sortOrder: 'ASC', createTime: 'DESC' },
    });
  }

  async findAll(): Promise<CategoryEntity[]> {
    return this.categoryRepository.find({
      where: { delFlag: '0', status: '1' },
      order: { sortOrder: 'ASC' },
    });
  }
}
