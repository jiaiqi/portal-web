import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { BannerEntity } from './entities/banner.entity';
import { CreateBannerDto, UpdateBannerDto, BannerListDto } from './dto/banner.dto';

@Injectable()
export class BannerService {
  constructor(
    @InjectRepository(BannerEntity)
    private bannerRepository: Repository<BannerEntity>,
  ) {}

  async create(createDto: CreateBannerDto, userName: string): Promise<BannerEntity> {
    const banner = this.bannerRepository.create({ ...createDto, createBy: userName });
    return this.bannerRepository.save(banner);
  }

  async update(updateDto: UpdateBannerDto, userName: string): Promise<BannerEntity> {
    const banner = await this.bannerRepository.findOne({ where: { bannerId: updateDto.bannerId, delFlag: '0' } });
    if (!banner) throw new Error('轮播图不存在');
    Object.assign(banner, updateDto, { updateBy: userName });
    return this.bannerRepository.save(banner);
  }

  async delete(bannerId: number, userName: string): Promise<void> {
    await this.bannerRepository.update({ bannerId }, { delFlag: '1', updateBy: userName });
  }

  async findOne(bannerId: number): Promise<BannerEntity> {
    return this.bannerRepository.findOne({ where: { bannerId, delFlag: '0' } });
  }

  async findList(query: BannerListDto) {
    const where: any = { delFlag: '0' };
    if (query.status) where.status = query.status;
    return this.bannerRepository.find({ where, order: { sortOrder: 'ASC', createTime: 'DESC' } });
  }

  async findAll(): Promise<BannerEntity[]> {
    return this.bannerRepository.find({ where: { delFlag: '0', status: '1' }, order: { sortOrder: 'ASC' } });
  }

  async findByPosition(position: string): Promise<BannerEntity[]> {
    return this.bannerRepository.find({
      where: { delFlag: '0', status: '1', position },
      order: { sortOrder: 'ASC' },
    });
  }
}
