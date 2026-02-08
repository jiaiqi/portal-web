import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository, Between } from 'typeorm';
import { ArticleEntity } from '../cms/article/entities/article.entity';
import { NoticeEntity } from '../cms/notice/entities/notice.entity';
import { FocusEntity } from '../cms/focus/entities/focus.entity';
import { CategoryEntity } from '../cms/category/entities/category.entity';
import { BannerEntity } from '../cms/banner/entities/banner.entity';
import { SysOperlogEntity } from '../monitor/operlog/entities/operlog.entity';
import { Job } from '../monitor/job/entities/job.entity';
import { RedisService } from 'src/module/common/redis/redis.service';
import { CacheEnum } from 'src/common/enum/index';

@Injectable()
export class DashboardService {
  constructor(
    @InjectRepository(ArticleEntity)
    private readonly articleRepository: Repository<ArticleEntity>,
    @InjectRepository(NoticeEntity)
    private readonly noticeRepository: Repository<NoticeEntity>,
    @InjectRepository(FocusEntity)
    private readonly focusRepository: Repository<FocusEntity>,
    @InjectRepository(CategoryEntity)
    private readonly categoryRepository: Repository<CategoryEntity>,
    @InjectRepository(BannerEntity)
    private readonly bannerRepository: Repository<BannerEntity>,
    @InjectRepository(SysOperlogEntity)
    private readonly operLogRepository: Repository<SysOperlogEntity>,
    @InjectRepository(Job)
    private readonly jobRepository: Repository<Job>,
    private readonly redisService: RedisService,
  ) {}

  async getStatistics() {
    const [
      totalArticles,
      publishedArticles,
      draftArticles,
      totalNotices,
      totalFocus,
      totalCategory,
      totalBanner,
      jobCount,
    ] = await Promise.all([
      this.articleRepository.count(),
      this.articleRepository.count({ where: { status: '1' } }),
      this.articleRepository.count({ where: { status: '0' } }),
      this.noticeRepository.count(),
      this.focusRepository.count(),
      this.categoryRepository.count(),
      this.bannerRepository.count(),
      this.jobRepository.count(),
    ]);

    // 从 Redis 获取在线用户数
    const onlineKeys = await this.redisService.keys(`${CacheEnum.LOGIN_TOKEN_KEY}*`);
    const onlineUser = onlineKeys.length;

    return {
      msg: '操作成功',
      code: 200,
      data: {
        article: {
          total: totalArticles,
          published: publishedArticles,
          draft: draftArticles,
        },
        content: {
          notice: totalNotices,
          focus: totalFocus,
          category: totalCategory,
          banner: totalBanner,
        },
        onlineUser,
        jobCount,
      },
    };
  }

  async getRecentLogs(query: { pageSize?: number }) {
    const pageSize = query.pageSize || 10;
    
    const logs = await this.operLogRepository.find({
      order: { operTime: 'DESC' },
      take: pageSize,
    });

    const rows = logs.map(log => ({
      operId: log.operId,
      title: log.title,
      businessType: this.getBusinessType(log.businessType),
      operName: log.operName,
      operTime: log.operTime,
      status: log.status,
    }));

    return {
      msg: '操作成功',
      code: 200,
      rows,
      total: rows.length,
    };
  }

  private getBusinessType(type: number): string {
    const typeMap: Record<number, string> = {
      0: '其他',
      1: '新增',
      2: '修改',
      3: '删除',
    };
    return typeMap[type] || '其他';
  }

  async getArticleTrend(query: { type?: string }) {
    const type = query.type || 'week';
    const now = new Date();
    const data: { date: string; count: number }[] = [];

    if (type === 'week') {
      // 获取最近7天的数据
      for (let i = 6; i >= 0; i--) {
        const date = new Date(now);
        date.setDate(date.getDate() - i);
        const startOfDay = new Date(date.setHours(0, 0, 0, 0));
        const endOfDay = new Date(date.setHours(23, 59, 59, 999));
        
        const count = await this.articleRepository.count({
          where: {
            createTime: Between(startOfDay, endOfDay),
          },
        });
        
        data.push({
          date: `${date.getMonth() + 1}/${date.getDate()}`,
          count,
        });
      }
    } else if (type === 'month') {
      // 获取最近30天的数据，按周聚合
      for (let i = 4; i >= 0; i--) {
        const endDate = new Date(now);
        endDate.setDate(endDate.getDate() - i * 7);
        const startDate = new Date(endDate);
        startDate.setDate(startDate.getDate() - 6);
        
        const count = await this.articleRepository.count({
          where: {
            createTime: Between(startDate, endDate),
          },
        });
        
        data.push({
          date: `${startDate.getMonth() + 1}/${startDate.getDate()}-${endDate.getMonth() + 1}/${endDate.getDate()}`,
          count,
        });
      }
    } else if (type === 'year') {
      // 获取最近12个月的数据
      for (let i = 11; i >= 0; i--) {
        const date = new Date(now);
        date.setMonth(date.getMonth() - i);
        const year = date.getFullYear();
        const month = date.getMonth();
        
        const startOfMonth = new Date(year, month, 1);
        const endOfMonth = new Date(year, month + 1, 0, 23, 59, 59, 999);
        
        const count = await this.articleRepository.count({
          where: {
            createTime: Between(startOfMonth, endOfMonth),
          },
        });
        
        data.push({
          date: `${month + 1}月`,
          count,
        });
      }
    }

    return {
      msg: '操作成功',
      code: 200,
      data,
    };
  }

  async getSystemStatus() {
    // 获取系统状态信息
    // 这里可以根据实际需求获取 CPU、内存等信息
    // 暂时返回模拟数据
    
    return {
      msg: '操作成功',
      code: 200,
      data: {
        cpuUsage: Math.floor(Math.random() * 30) + 20, // 20-50%
        memoryUsage: Math.floor(Math.random() * 40) + 30, // 30-70%
        diskUsage: Math.floor(Math.random() * 20) + 40, // 40-60%
        uptime: '15天 3小时 24分钟',
      },
    };
  }

  async getTodoList() {
    // 获取待办事项
    const [pendingAudit, pendingNotice] = await Promise.all([
      this.articleRepository.count({ where: { status: '2' } }), // 待审核
      this.noticeRepository.count({ where: { status: '0' } }),
    ]);

    const todoList = [
      {
        id: 1,
        title: '审核待发布的文章',
        type: 'article',
        count: pendingAudit,
        priority: pendingAudit > 0 ? 'high' : 'low',
        link: '/cms/article-audit',
      },
      {
        id: 2,
        title: '发布公告通知',
        type: 'notice',
        count: pendingNotice,
        priority: 'low',
        link: '/cms/notice',
      },
    ].filter(item => item.count > 0);

    return {
      msg: '操作成功',
      code: 200,
      data: todoList,
    };
  }
}
