import { Injectable } from '@nestjs/common';
import { ArticleService } from '../article/article.service';
import { BannerService } from '../banner/banner.service';
import { FocusService } from '../focus/focus.service';
import { NoticeService } from '../notice/notice.service';
import { PageService } from '../page/page.service';
import { ResultData } from 'src/common/utils/result';

@Injectable()
export class PortalService {
  constructor(
    private readonly articleService: ArticleService,
    private readonly bannerService: BannerService,
    private readonly focusService: FocusService,
    private readonly noticeService: NoticeService,
    private readonly pageService: PageService,
  ) {}

  async getHomeData() {
    const focusData = await this.focusService.getHomeFocus();
    const focusBanner = await this.getFocusBanner();
    const newsItems = await this.getNewsItems();
    const informationItems = await this.getInformationItems();
    const rightBanners = await this.getRightBanners();
    const noticeList = await this.getNoticeList();

    return ResultData.ok({
      focusImages: focusData.data,
      focusBanner,
      newsItems,
      informationItems,
      rightBanners,
      noticeList,
    });
  }

  private async getFocusBanner() {
    const banners = await this.bannerService.findByPosition('focus');
    return banners[0]?.image || '';
  }

  private async getNewsItems() {
    const result = await this.articleService.findList({
      pageNum: 1,
      pageSize: 6,
      categoryId: 1,
      status: '1',
    });
    return result.list.map(item => ({
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
    return result.list.map(item => ({
      id: item.articleId,
      title: item.title,
      date: this.formatDate(item.publishTime),
      image: item.coverImage,
      openType: item.openType || 'current',
    }));
  }

  private async getRightBanners() {
    const topBanners = await this.bannerService.findByPosition('right_top');
    const platformBanners = await this.bannerService.findByPosition('right_platform');

    return {
      top: topBanners[0]?.image || '',
      platform: platformBanners[0]?.image || '',
    };
  }

  private async getNoticeList() {
    const result = await this.noticeService.findList({
      pageNum: 1,
      pageSize: 5,
      status: '0',
    });
    return result.data.list.map(item => item.title);
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
