import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity('cms_site_config')
export class SiteConfigEntity {
  @PrimaryGeneratedColumn({ name: 'config_id' })
  configId: number;

  @Column({ name: 'config_key', length: 100, unique: true, comment: '配置键' })
  configKey: string;

  @Column({ name: 'config_value', type: 'text', nullable: true, comment: '配置值' })
  configValue: string;

  @Column({ name: 'config_name', length: 200, comment: '配置名称' })
  configName: string;

  @Column({ name: 'config_type', length: 20, default: 'text', comment: '配置类型：text文本 textarea多行文本 rich富文本 image图片' })
  configType: string;

  @Column({ name: 'sort_order', default: 0, comment: '排序' })
  sortOrder: number;

  @Column({ name: 'create_by', length: 64, default: '', comment: '创建者' })
  createBy: string;

  @CreateDateColumn({ name: 'create_time', type: 'datetime', precision: 6, comment: '创建时间' })
  createTime: Date;

  @Column({ name: 'update_by', length: 64, default: '', comment: '更新者' })
  updateBy: string;

  @UpdateDateColumn({ name: 'update_time', type: 'datetime', precision: 6, comment: '更新时间' })
  updateTime: Date;
}
