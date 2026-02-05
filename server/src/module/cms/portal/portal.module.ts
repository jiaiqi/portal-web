import { Module } from '@nestjs/common';
import { PortalService } from './portal.service';
import { ArticleModule } from '../article/article.module';
import { BannerModule } from '../banner/banner.module';
import { FocusModule } from '../focus/focus.module';
import { NoticeModule } from '../notice/notice.module';
import { PageModule } from '../page/page.module';

@Module({
  imports: [ArticleModule, BannerModule, FocusModule, NoticeModule, PageModule],
  providers: [PortalService],
  exports: [PortalService],
})
export class PortalModule {}
