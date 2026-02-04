import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity('cms_page')
export class PageEntity {
  @PrimaryGeneratedColumn({ name: 'page_id' })
  pageId: number;

  @Column({ name: 'page_key', length: 50, unique: true, comment: '页面标识' })
  pageKey: string;

  @Column({ name: 'page_name', length: 100, comment: '页面名称' })
  pageName: string;

  @Column({ name: 'content', type: 'longtext', nullable: true, comment: '内容' })
  content: string;

  @Column({ name: 'create_by', length: 64, default: '', comment: '创建者' })
  createBy: string;

  @CreateDateColumn({ name: 'create_time', type: 'datetime', precision: 6, comment: '创建时间' })
  createTime: Date;

  @Column({ name: 'update_by', length: 64, default: '', comment: '更新者' })
  updateBy: string;

  @UpdateDateColumn({ name: 'update_time', type: 'datetime', precision: 6, comment: '更新时间' })
  updateTime: Date;
}
