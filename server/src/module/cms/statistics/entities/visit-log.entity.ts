import { Entity, Column, PrimaryGeneratedColumn, CreateDateColumn, Index } from 'typeorm';

@Entity('cms_visit_log')
export class VisitLogEntity {
  @PrimaryGeneratedColumn({ name: 'log_id' })
  logId: number;

  @Column({ name: 'page_url', type: 'varchar', length: 255, nullable: true })
  @Index()
  pageUrl: string | null;

  @Column({ name: 'page_type', type: 'varchar', length: 50, nullable: true })
  @Index()
  pageType: string | null;

  @Column({ name: 'ref_type_id', type: 'int', nullable: true })
  @Index()
  refTypeId: number | null;

  @Column({ name: 'ip_address', type: 'varchar', length: 128, nullable: true })
  ipAddress: string | null;

  @Column({ name: 'user_agent', type: 'varchar', length: 500, nullable: true })
  userAgent: string | null;

  @CreateDateColumn({ name: 'visit_time', type: 'datetime', precision: 6 })
  @Index()
  visitTime: Date;
}
