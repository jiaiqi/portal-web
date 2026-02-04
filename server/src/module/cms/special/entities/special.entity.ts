import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity('cms_special')
export class SpecialEntity {
  @PrimaryGeneratedColumn({ name: 'special_id' })
  specialId: number;

  @Column({ name: 'title', length: 200, comment: '专题标题' })
  title: string;

  @Column({ name: 'cover_image', length: 255, nullable: true, comment: '封面图' })
  coverImage: string;

  @Column({ name: 'description', length: 500, nullable: true, comment: '专题描述' })
  description: string;

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
