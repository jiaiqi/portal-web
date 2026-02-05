import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn, UpdateDateColumn } from 'typeorm';

@Entity('cms_notice')
export class NoticeEntity {
  @PrimaryGeneratedColumn({ name: 'notice_id' })
  noticeId: number;

  @Column({ name: 'title', length: 200, comment: '公告标题' })
  title: string;

  @Column({ name: 'content', type: 'text', nullable: true, comment: '公告内容' })
  content: string;

  @Column({ name: 'notice_type', length: 20, default: 'notice', comment: '公告类型：notice公告 announcement公示' })
  noticeType: string;

  @Column({ name: 'status', length: 1, default: '0', comment: '状态：0正常 1关闭' })
  status: string;

  @Column({ name: 'is_top', length: 1, default: '0', comment: '是否置顶：0否 1是' })
  isTop: string;

  @Column({ name: 'sort_order', type: 'int', default: 0, comment: '排序' })
  sortOrder: number;

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
