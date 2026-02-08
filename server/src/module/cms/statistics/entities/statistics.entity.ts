import { Entity, Column, PrimaryGeneratedColumn, CreateDateColumn, Index } from 'typeorm';

@Entity('cms_statistics')
export class StatisticsEntity {
  @PrimaryGeneratedColumn({ name: 'stat_id' })
  statId: number;

  @Column({ name: 'stat_date', type: 'date' })
  @Index()
  statDate: Date;

  @Column({ name: 'total_pv', type: 'int', default: 0 })
  totalPv: number;

  @Column({ name: 'total_uv', type: 'int', default: 0 })
  totalUv: number;

  @Column({ name: 'article_pv', type: 'int', default: 0 })
  articlePv: number;

  @Column({ name: 'article_uv', type: 'int', default: 0 })
  articleUv: number;

  @Column({ name: 'home_pv', type: 'int', default: 0 })
  homePv: number;

  @Column({ name: 'home_uv', type: 'int', default: 0 })
  homeUv: number;

  @Column({ name: 'special_pv', type: 'int', default: 0 })
  specialPv: number;

  @Column({ name: 'special_uv', type: 'int', default: 0 })
  specialUv: number;

  @Column({ name: 'other_pv', type: 'int', default: 0 })
  otherPv: number;

  @Column({ name: 'other_uv', type: 'int', default: 0 })
  otherUv: number;
}
