import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity('cms_navigation')
export class NavigationEntity {
  @PrimaryGeneratedColumn({ name: 'nav_id' })
  navId: number;

  @Column({ name: 'nav_name', length: 50, comment: '导航名称' })
  navName: string;

  @Column({ name: 'nav_path', length: 200, comment: '导航路径/路由' })
  navPath: string;

  @Column({ name: 'nav_type', length: 20, default: 'internal', comment: '导航类型：internal内部 external外部' })
  navType: string;

  @Column({ name: 'nav_target', length: 20, default: '_self', comment: '打开方式：_self当前页 _blank新标签页' })
  navTarget: string;

  @Column({ name: 'is_fixed', length: 1, default: '0', comment: '是否固定：0否 1是（不可编辑删除）' })
  isFixed: string;

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
