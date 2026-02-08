import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { SiteConfigEntity } from './entities/site-config.entity';
import {
  CreateSiteConfigDto,
  UpdateSiteConfigDto,
  SiteConfigListDto,
} from './dto/site-config.dto';

@Injectable()
export class SiteConfigService {
  constructor(
    @InjectRepository(SiteConfigEntity)
    private siteConfigRepository: Repository<SiteConfigEntity>,
  ) {}

  async findList(query: SiteConfigListDto) {
    const { pageNum = 1, pageSize = 10, configKey, configName } = query;
    
    const queryBuilder = this.siteConfigRepository.createQueryBuilder('config');
    
    if (configKey) {
      queryBuilder.andWhere('config.configKey LIKE :configKey', { configKey: `%${configKey}%` });
    }
    
    if (configName) {
      queryBuilder.andWhere('config.configName LIKE :configName', { configName: `%${configName}%` });
    }
    
    queryBuilder.orderBy('config.sortOrder', 'ASC');
    
    const [list, total] = await queryBuilder
      .skip((pageNum - 1) * pageSize)
      .take(pageSize)
      .getManyAndCount();
    
    return {
      list,
      total,
      pageNum,
      pageSize,
    };
  }

  async findAll() {
    const configs = await this.siteConfigRepository.find({
      order: { sortOrder: 'ASC' },
    });
    
    const result = {};
    configs.forEach(config => {
      result[config.configKey] = config.configValue;
    });
    
    return result;
  }

  async getValue(key: string) {
    const config = await this.siteConfigRepository.findOne({
      where: { configKey: key },
    });
    
    return config?.configValue || '';
  }

  async findById(id: number) {
    const config = await this.siteConfigRepository.findOne({
      where: { configId: id },
    });
    
    if (!config) {
      throw new NotFoundException('配置不存在');
    }
    
    return config;
  }

  async create(dto: CreateSiteConfigDto) {
    const config = this.siteConfigRepository.create(dto);
    await this.siteConfigRepository.save(config);
    return config;
  }

  async update(dto: UpdateSiteConfigDto) {
    const { configId, ...updateData } = dto;
    
    const config = await this.findById(configId);
    
    Object.assign(config, updateData);
    await this.siteConfigRepository.save(config);
    return config;
  }

  async delete(id: number) {
    const config = await this.findById(id);
    await this.siteConfigRepository.remove(config);
    return { message: '删除成功' };
  }
}
