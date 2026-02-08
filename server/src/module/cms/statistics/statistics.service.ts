import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { VisitLogEntity } from './entities/visit-log.entity';
import { StatisticsEntity } from './entities/statistics.entity';
import { RecordVisitDto } from './dto/record-visit.dto';
import dayjs from 'dayjs';

@Injectable()
export class StatisticsService {
  constructor(
    @InjectRepository(VisitLogEntity)
    private readonly visitLogRepository: Repository<VisitLogEntity>,
    @InjectRepository(StatisticsEntity)
    private readonly statisticsRepository: Repository<StatisticsEntity>,
  ) {}

  async recordVisit(recordVisitDto: RecordVisitDto) {
    const { pageUrl, pageType, refTypeId, ipAddress, userAgent } = recordVisitDto;

    const visitLog = this.visitLogRepository.create({
      pageUrl,
      pageType,
      refTypeId,
      ipAddress,
      userAgent,
      visitTime: new Date(),
    });

    await this.visitLogRepository.save(visitLog);

    await this.updateStatistics(pageType);

    return {
      msg: '记录成功',
      code: 200,
      data: null,
    };
  }

  async getTotalVisits() {
    const totalStats = await this.statisticsRepository
      .createQueryBuilder('stats')
      .select('SUM(stats.total_pv)', 'totalPv')
      .addSelect('SUM(stats.total_uv)', 'totalUv')
      .getRawOne();

    return {
      msg: '获取成功',
      code: 200,
      data: {
        totalPv: totalStats.totalPv || 0,
        totalUv: totalStats.totalUv || 0,
      },
    };
  }

  async getTodayVisits() {
    const today = dayjs().format('YYYY-MM-DD');
    const todayStats = await this.statisticsRepository.findOne({
      where: { statDate: today as any },
    });

    return {
      msg: '获取成功',
      code: 200,
      data: {
        totalPv: todayStats?.totalPv || 0,
        totalUv: todayStats?.totalUv || 0,
        articlePv: todayStats?.articlePv || 0,
        articleUv: todayStats?.articleUv || 0,
        homePv: todayStats?.homePv || 0,
        homeUv: todayStats?.homeUv || 0,
        specialPv: todayStats?.specialPv || 0,
        specialUv: todayStats?.specialUv || 0,
        otherPv: todayStats?.otherPv || 0,
        otherUv: todayStats?.otherUv || 0,
      },
    };
  }

  async getVisitTrend(days: number = 7) {
    const endDate = dayjs().format('YYYY-MM-DD');
    const startDate = dayjs().subtract(days - 1, 'day').format('YYYY-MM-DD');

    const trendData = await this.statisticsRepository
      .createQueryBuilder('stats')
      .select('stats.stat_date', 'date')
      .addSelect('stats.total_pv', 'pv')
      .addSelect('stats.total_uv', 'uv')
      .where('stats.stat_date BETWEEN :startDate AND :endDate', { startDate, endDate })
      .orderBy('stats.stat_date', 'ASC')
      .getRawMany();

    return {
      msg: '获取成功',
      code: 200,
      data: trendData.map(item => ({
        date: item.date,
        pv: item.pv || 0,
        uv: item.uv || 0,
      })),
    };
  }

  private async updateStatistics(pageType: string) {
    const today = dayjs().format('YYYY-MM-DD');
    let stats = await this.statisticsRepository.findOne({
      where: { statDate: today as any },
    });

    if (!stats) {
      stats = this.statisticsRepository.create({
        statDate: today as any,
        totalPv: 0,
        totalUv: 0,
        articlePv: 0,
        articleUv: 0,
        homePv: 0,
        homeUv: 0,
        specialPv: 0,
        specialUv: 0,
        otherPv: 0,
        otherUv: 0,
      });
    }

    stats.totalPv += 1;

    switch (pageType) {
      case 'home':
        stats.homePv += 1;
        break;
      case 'article':
        stats.articlePv += 1;
        break;
      case 'special':
        stats.specialPv += 1;
        break;
      default:
        stats.otherPv += 1;
    }

    await this.statisticsRepository.save(stats);
  }
}
