import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity('cms_about_section')
export class AboutSectionEntity {
  @PrimaryGeneratedColumn({ name: 'section_id' })
  sectionId: number;

  @Column({ name: 'section_key', length: 50, comment: '栏目标识' })
  sectionKey: string;

  @Column({ name: 'section_name', length: 100, comment: '栏目名称' })
  sectionName: string;

  @Column({ name: 'section_type', length: 20, default: 'richText', comment: '栏目类型：richText富文本 list列表' })
  sectionType: string;

  @Column({ name: 'content', type: 'longtext', nullable: true, comment: '富文本内容' })
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
