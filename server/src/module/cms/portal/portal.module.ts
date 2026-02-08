import { Module } from '@nestjs/common';
import { PortalService } from './portal.service';
import { PortalController } from './portal.controller';
import { ArticleModule } from '../article/article.module';
import { FocusModule } from '../focus/focus.module';
import { NoticeModule } from '../notice/notice.module';
import { PageModule } from '../page/page.module';

@Module({
  imports: [ArticleModule, FocusModule, NoticeModule, PageModule],
  controllers: [PortalController],
  providers: [PortalService],
  exports: [PortalService],
})
export class PortalModule {}
