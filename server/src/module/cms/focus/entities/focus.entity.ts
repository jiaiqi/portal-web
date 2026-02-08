import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn, UpdateDateColumn } from 'typeorm';

/**
 * 焦点图表 - 合并焦点图和轮播图
 * 固定7条数据，不可删除，只能更新
 */
@Entity('cms_focus')
export class FocusEntity {
  @PrimaryGeneratedColumn({ name: 'focus_id' })
  focusId: number;

  @Column({ name: 'focus_key', length: 50, unique: true, comment: '焦点图标识' })
  focusKey: string;

  @Column({ name: 'focus_name', length: 100, comment: '焦点图名称' })
  focusName: string;

  @Column({ name: 'image_url', length: 500, comment: '图片URL' })
  imageUrl: string;

  @Column({ name: 'image_source_type', length: 20, default: 'upload', comment: '图片来源类型：upload上传 link链接' })
  imageSourceType: string;

  @Column({ name: 'link_type', length: 20, default: 'external', comment: '链接类型：internal内部文章 external外部地址' })
  linkType: string;

  @Column({ name: 'link_value', length: 500, nullable: true, comment: '链接值（文章ID或外部URL）' })
  linkValue: string;

  @Column({ name: 'open_type', length: 20, default: 'new', comment: '打开方式：current当前页 new新标签页' })
  openType: string;

  @Column({ name: 'sort_order', type: 'int', default: 0, comment: '排序' })
  sortOrder: number;

  @Column({ name: 'is_fixed', length: 1, default: '1', comment: '是否固定：0否 1是（固定数据不可删除）' })
  isFixed: string;

  @Column({ name: 'create_by', length: 64, default: '', comment: '创建者' })
  createBy: string;

  @CreateDateColumn({ name: 'create_time', type: 'datetime', precision: 6, comment: '创建时间' })
  createTime: Date;

  @Column({ name: 'update_by', length: 64, default: '', comment: '更新者' })
  updateBy: string;

  @UpdateDateColumn({ name: 'update_time', type: 'datetime', precision: 6, comment: '更新时间' })
  updateTime: Date;
}
