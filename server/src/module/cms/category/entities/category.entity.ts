import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn,
  OneToMany,
} from 'typeorm';
import { ArticleEntity } from '../../article/entities/article.entity';

@Entity('cms_category')
export class CategoryEntity {
  @PrimaryGeneratedColumn({ name: 'category_id' })
  categoryId: number;

  @Column({ name: 'category_name', length: 50, comment: '分类名称' })
  categoryName: string;

  @Column({ name: 'category_code', length: 50, unique: true, comment: '分类编码' })
  categoryCode: string;

  @Column({ name: 'parent_id', default: 0, comment: '父分类ID' })
  parentId: number;

  @Column({ name: 'sort_order', default: 0, comment: '排序' })
  sortOrder: number;

  @Column({ name: 'status', length: 1, default: '1', comment: '状态：0禁用 1启用' })
  status: string;

  @Column({ name: 'icon', length: 100, nullable: true, comment: '图标' })
  icon: string;

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

  @OneToMany(() => ArticleEntity, (article) => article.category)
  articles: ArticleEntity[];
}
