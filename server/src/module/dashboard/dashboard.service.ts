import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { ArticleEntity } from '../cms/article/entities/article.entity';
import { NoticeEntity } from '../cms/notice/entities/notice.entity';
import { FocusEntity } from '../cms/focus/entities/focus.entity';
import { CategoryEntity } from '../cms/category/entities/category.entity';

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
  ) {}

  async getStatistics() {
    const [
      totalArticles,
      publishedArticles,
      draftArticles,
      totalNotices,
      totalFocus,
      totalCategory,
    ] = await Promise.all([
      this.articleRepository.count(),
      this.articleRepository.count({ where: { status: '1' } }),
      this.articleRepository.count({ where: { status: '0' } }),
      this.noticeRepository.count(),
      this.focusRepository.count(),
      this.categoryRepository.count(),
    ]);

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
        },
        system: {
          users: 0,
          roles: 0,
          menus: 0,
        },
      },
    };
  }

  async getRecentLogs() {
    const recentArticles = await this.articleRepository.find({
      order: { createTime: 'DESC' },
      take: 5,
      relations: ['category'],
    });

    const logs = recentArticles.map(article => ({
      id: article.articleId,
      title: article.title,
      type: 'article',
      status: article.status === '1' ? 'published' : 'draft',
      createTime: article.createTime,
      author: article.createBy,
    }));

    return {
      msg: '操作成功',
      code: 200,
      data: logs,
    };
  }

  async getTodoList() {
    const todoList = [
      {
        id: 1,
        title: '审核待发布的文章',
        type: 'article',
        count: 0,
        priority: 'high',
        link: '/cms/article',
      },
      {
        id: 2,
        title: '更新焦点图',
        type: 'focus',
        count: 0,
        priority: 'medium',
        link: '/cms/focus',
      },
      {
        id: 3,
        title: '发布公告通知',
        type: 'notice',
        count: 0,
        priority: 'low',
        link: '/cms/notice',
      },
      {
        id: 4,
        title: '检查友情链接',
        type: 'link',
        count: 0,
        priority: 'low',
        link: '/cms/link',
      },
    ];

    return {
      msg: '操作成功',
      code: 200,
      data: todoList,
    };
  }
}
