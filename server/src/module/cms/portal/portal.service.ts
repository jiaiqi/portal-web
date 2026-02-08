import { Injectable } from '@nestjs/common';
import { ArticleService } from '../article/article.service';
import { FocusService } from '../focus/focus.service';
import { NoticeService } from '../notice/notice.service';
import { PageService } from '../page/page.service';
import { ResultData } from 'src/common/utils/result';

@Injectable()
export class PortalService {
  constructor(
    private readonly articleService: ArticleService,
    private readonly focusService: FocusService,
    private readonly noticeService: NoticeService,
    private readonly pageService: PageService,
  ) {}

  async getHomeData() {
    const focusList = await this.focusService.findAll();
    const newsItems = await this.getNewsItems();
    const informationItems = await this.getInformationItems();
    const noticeList = await this.getNoticeList();

    // 将焦点图按key分组
    const focusImages = {
      big: focusList.find(f => f.focusKey === 'focus_big')?.imageUrl || '',
      small1: focusList.find(f => f.focusKey === 'focus_small_1')?.imageUrl || '',
      small2: focusList.find(f => f.focusKey === 'focus_small_2')?.imageUrl || '',
      small3: focusList.find(f => f.focusKey === 'focus_small_3')?.imageUrl || '',
    };

    const focusBanner = focusList.find(f => f.focusKey === 'focus_banner')?.imageUrl || '';

    const rightBanners = {
      top: focusList.find(f => f.focusKey === 'notice_banner')?.imageUrl || '',
      platform: focusList.find(f => f.focusKey === 'overview_banner')?.imageUrl || '',
    };

    return ResultData.ok({
      focusImages,
      focusBanner,
      newsItems,
      informationItems,
      rightBanners,
      noticeList,
    });
  }

  private async getNewsItems() {
    const result = await this.articleService.findList({
      pageNum: 1,
      pageSize: 6,
      categoryId: 1,
      status: '1',
    });
    const list = result.data?.list || [];
    return list.map(item => ({
      id: item.articleId,
      title: item.title,
      date: this.formatDate(item.publishTime),
      image: item.coverImage,
      openType: item.openType || 'current',
    }));
  }

  private async getInformationItems() {
    const result = await this.articleService.findList({
      pageNum: 1,
      pageSize: 6,
      categoryId: 2,
      status: '1',
    });
    const list = result.data?.list || [];
    return list.map(item => ({
      id: item.articleId,
      title: item.title,
      date: this.formatDate(item.publishTime),
      image: item.coverImage,
      openType: item.openType || 'current',
    }));
  }

  private async getNoticeList() {
    const result = await this.noticeService.findList({
      pageNum: 1,
      pageSize: 5,
      status: '0',
    });
    return result.data?.list?.map(item => item.title) || [];
  }

  private formatDate(date: Date): string {
    if (!date) return '';
    const d = new Date(date);
    const year = d.getFullYear();
    const month = String(d.getMonth() + 1).padStart(2, '0');
    const day = String(d.getDate()).padStart(2, '0');
    const hours = String(d.getHours()).padStart(2, '0');
    const minutes = String(d.getMinutes()).padStart(2, '0');
    return `${year}-${month}-${day} ${hours}:${minutes}`;
  }
}
