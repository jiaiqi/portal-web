import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity('cms_about_article')
export class AboutArticleEntity {
  @PrimaryGeneratedColumn({ name: 'article_id' })
  articleId: number;

  @Column({ name: 'section_key', length: 50, comment: '栏目标识' })
  sectionKey: string;

  @Column({ name: 'title', length: 200, comment: '文章标题' })
  title: string;

  @Column({ name: 'content', type: 'longtext', nullable: true, comment: '文章内容' })
  content: string;

  @Column({ name: 'sort_order', default: 0, comment: '排序' })
  sortOrder: number;

  @Column({ name: 'status', length: 1, default: '1', comment: '状态：0禁用 1启用' })
  status: string;

  @Column({ name: 'create_by', length: 64, default: '' })
  createBy: string;

  @CreateDateColumn({ name: 'create_time', type: 'datetime', precision: 6 })
  createTime: Date;

  @Column({ name: 'update_by', length: 64, default: '' })
  updateBy: string;

  @UpdateDateColumn({ name: 'update_time', type: 'datetime', precision: 6 })
  updateTime: Date;

  @Column({ name: 'del_flag', length: 1, default: '0' })
  delFlag: string;
}
