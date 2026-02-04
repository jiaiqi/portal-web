import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
} from 'typeorm';

@Entity('cms_special_article')
export class SpecialArticleEntity {
  @PrimaryGeneratedColumn({ name: 'id' })
  id: number;

  @Column({ name: 'special_id', comment: '专题ID' })
  specialId: number;

  @Column({ name: 'article_id', comment: '文章ID' })
  articleId: number;

  @Column({ name: 'sort_order', default: 0, comment: '排序' })
  sortOrder: number;
}
