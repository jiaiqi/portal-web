import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn, UpdateDateColumn } from 'typeorm';

@Entity('cms_focus')
export class FocusEntity {
  @PrimaryGeneratedColumn({ name: 'focus_id' })
  focusId: number;

  @Column({ name: 'title', length: 200, nullable: true, comment: '焦点图标题' })
  title: string;

  @Column({ name: 'image_url', length: 500, comment: '图片URL' })
  imageUrl: string;

  @Column({ name: 'image_type', length: 20, default: 'big', comment: '图片类型：big大图 small小图' })
  imageType: string;

  @Column({ name: 'link_url', length: 500, nullable: true, comment: '跳转链接' })
  linkUrl: string;

  @Column({ name: 'sort_order', type: 'int', default: 0, comment: '排序' })
  sortOrder: number;

  @Column({ name: 'status', length: 1, default: '0', comment: '状态：0正常 1停用' })
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
