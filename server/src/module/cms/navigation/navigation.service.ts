import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, Like } from 'typeorm';
import { NavigationEntity } from './entities/navigation.entity';
import { CreateNavigationDto, UpdateNavigationDto, NavigationListDto } from './dto/navigation.dto';

@Injectable()
export class NavigationService {
  constructor(
    @InjectRepository(NavigationEntity)
    private navigationRepository: Repository<NavigationEntity>,
  ) {}

  async create(createDto: CreateNavigationDto, userName: string): Promise<NavigationEntity> {
    const navigation = this.navigationRepository.create({
      ...createDto,
      createBy: userName,
    });
    return this.navigationRepository.save(navigation);
  }

  async update(updateDto: UpdateNavigationDto, userName: string): Promise<NavigationEntity> {
    const navigation = await this.navigationRepository.findOne({
      where: { navId: updateDto.navId, delFlag: '0' },
    });
    if (!navigation) {
      throw new Error('导航不存在');
    }
    if (navigation.isFixed === '1') {
      throw new Error('固定导航不可编辑');
    }
    Object.assign(navigation, updateDto, { updateBy: userName });
    return this.navigationRepository.save(navigation);
  }

  async delete(navId: number, userName: string): Promise<void> {
    const navigation = await this.navigationRepository.findOne({
      where: { navId, delFlag: '0' },
    });
    if (!navigation) {
      throw new Error('导航不存在');
    }
    if (navigation.isFixed === '1') {
      throw new Error('固定导航不可删除');
    }
    await this.navigationRepository.update(
      { navId },
      { delFlag: '1', updateBy: userName },
    );
  }

  async findOne(navId: number): Promise<NavigationEntity> {
    return this.navigationRepository.findOne({
      where: { navId, delFlag: '0' },
    });
  }

  async findList(query: NavigationListDto) {
    const { pageNum = 1, pageSize = 10, navName, status } = query;

    const where: any = { delFlag: '0' };
    if (navName) where.navName = Like(`%${navName}%`);
    if (status) where.status = status;

    const [list, total] = await this.navigationRepository.findAndCount({
      where,
      order: { sortOrder: 'ASC', createTime: 'DESC' },
      skip: (pageNum - 1) * pageSize,
      take: pageSize,
    });

    return { list, total, pageNum, pageSize };
  }

  async findAll(): Promise<NavigationEntity[]> {
    return this.navigationRepository.find({
      where: { delFlag: '0', status: '1' },
      order: { sortOrder: 'ASC', createTime: 'DESC' },
    });
  }
}
