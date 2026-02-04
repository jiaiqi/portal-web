import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn,
  ManyToOne,
  JoinColumn,
} from 'typeorm';
import { CategoryEntity } from '../../category/entities/category.entity';

@Entity('cms_article')
export class ArticleEntity {
  @PrimaryGeneratedColumn({ name: 'article_id' })
  articleId: number;

  @Column({ name: 'title', length: 200, comment: '文章标题' })
  title: string;

  @Column({ name: 'category_id', comment: '分类ID' })
  categoryId: number;

  @ManyToOne(() => CategoryEntity, (category) => category.articles)
  @JoinColumn({ name: 'category_id' })
  category: CategoryEntity;

  @Column({ name: 'summary', length: 500, nullable: true, comment: '文章摘要' })
  summary: string;

  @Column({ name: 'cover_image', length: 255, nullable: true, comment: '封面图' })
  coverImage: string;

  @Column({ name: 'content', type: 'longtext', nullable: true, comment: '文章内容' })
  content: string;

  @Column({ name: 'source', length: 100, nullable: true, comment: '文章来源' })
  source: string;

  @Column({ name: 'author', length: 50, nullable: true, comment: '作者' })
  author: string;

  @Column({ name: 'publish_time', type: 'datetime', nullable: true, comment: '发布时间' })
  publishTime: Date;

  @Column({ name: 'status', length: 1, default: '0', comment: '状态：0草稿 1已发布' })
  status: string;

  @Column({ name: 'is_top', length: 1, default: '0', comment: '是否置顶：0否 1是' })
  isTop: string;

  @Column({ name: 'view_count', type: 'int', default: 0, comment: '浏览量' })
  viewCount: number;

  @Column({ name: 'seo_title', length: 200, nullable: true, comment: 'SEO标题' })
  seoTitle: string;

  @Column({ name: 'seo_keywords', length: 500, nullable: true, comment: 'SEO关键词' })
  seoKeywords: string;

  @Column({ name: 'seo_description', length: 500, nullable: true, comment: 'SEO描述' })
  seoDescription: string;

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
