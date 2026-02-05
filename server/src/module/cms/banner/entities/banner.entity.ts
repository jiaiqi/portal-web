import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity('cms_banner')
export class BannerEntity {
  @PrimaryGeneratedColumn({ name: 'banner_id' })
  bannerId: number;

  @Column({ name: 'title', length: 200, nullable: true, comment: '标题' })
  title: string;

  @Column({ name: 'image', length: 255, comment: '图片' })
  image: string;

  @Column({ name: 'link_url', length: 255, nullable: true, comment: '链接地址' })
  linkUrl: string;

  @Column({ name: 'position', length: 50, default: 'home', comment: '位置：home首页 focus首页焦点 right_top右侧顶部 right_platform右侧平台' })
  position: string;

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
