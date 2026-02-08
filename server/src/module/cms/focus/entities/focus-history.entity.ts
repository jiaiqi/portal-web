import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn } from 'typeorm';

/**
 * 焦点图历史记录表
 * 记录每次修改的历史，支持恢复
 */
@Entity('cms_focus_history')
export class FocusHistoryEntity {
  @PrimaryGeneratedColumn({ name: 'history_id' })
  historyId: number;

  @Column({ name: 'focus_id', type: 'int', comment: '关联的焦点图ID' })
  focusId: number;

  @Column({ name: 'focus_key', length: 50, comment: '焦点图标识' })
  focusKey: string;

  @Column({ name: 'focus_name', length: 100, comment: '焦点图名称' })
  focusName: string;

  @Column({ name: 'image_url', length: 500, comment: '图片URL' })
  imageUrl: string;

  @Column({ name: 'image_source_type', length: 20, default: 'upload', comment: '图片来源类型' })
  imageSourceType: string;

  @Column({ name: 'link_type', length: 20, default: 'external', comment: '链接类型' })
  linkType: string;

  @Column({ name: 'link_value', length: 500, nullable: true, comment: '链接值' })
  linkValue: string;

  @Column({ name: 'open_type', length: 20, default: 'new', comment: '打开方式' })
  openType: string;

  @Column({ name: 'remark', length: 200, nullable: true, comment: '修改备注' })
  remark: string;

  @Column({ name: 'create_by', length: 64, default: '', comment: '修改人' })
  createBy: string;

  @CreateDateColumn({ name: 'create_time', type: 'datetime', precision: 6, comment: '修改时间' })
  createTime: Date;
}
