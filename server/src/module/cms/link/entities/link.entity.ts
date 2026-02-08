import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity('cms_link')
export class LinkEntity {
  @PrimaryGeneratedColumn({ name: 'link_id' })
  linkId: number;

  @Column({ name: 'link_name', length: 100, comment: '链接名称' })
  linkName: string;

  @Column({ name: 'link_url', length: 255, comment: '链接地址' })
  linkUrl: string;

  @Column({ name: 'link_logo', length: 255, nullable: true, comment: '链接Logo' })
  linkLogo: string;

  @Column({ name: 'link_logo_source_type', length: 20, default: 'upload', comment: 'Logo图片来源类型：upload上传 link链接' })
  linkLogoSourceType: string;

  @Column({ name: 'link_type', length: 1, default: '0', comment: '链接类型：0普通链接 1全国分会' })
  linkType: string;

  @Column({ name: 'sort_order', default: 0, comment: '排序' })
  sortOrder: number;

  @Column({ name: 'status', length: 1, default: '1', comment: '状态：0禁用 1启用' })
  status: string;

  @Column({ name: 'create_by', length: 64, default: '', comment: '创建者' })
  createBy: string;

  @CreateDateColumn({ name: 'create_time', type: 'datetime', precision: 6, comment: '创建时间' })
  createTime: Date;

  @Column({ name: 'update_by', length: 64, default: '', comment: '更新者' })
  updateBy: string;

  @UpdateDateColumn({ name: 'update_time', type: 'datetime', precision: 6, comment: '更新时间' })
  updateTime: Date;

  @Column({ name: 'del_flag', length: 1, default: '0', comment: '删除标志' })
  delFlag: string;
}
