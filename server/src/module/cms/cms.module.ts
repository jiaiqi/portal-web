import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';

// Entities
import { ArticleEntity } from './article/entities/article.entity';
import { CategoryEntity } from './category/entities/category.entity';
import { SpecialEntity } from './special/entities/special.entity';
import { SpecialArticleEntity } from './special/entities/special-article.entity';
import { LinkEntity } from './link/entities/link.entity';
import { PageEntity } from './page/entities/page.entity';
import { QuickLinkEntity } from './quick-link/entities/quick-link.entity';
import { NoticeEntity } from './notice/entities/notice.entity';
import { FocusEntity } from './focus/entities/focus.entity';
import { FocusHistoryEntity } from './focus/entities/focus-history.entity';
import { SiteConfigEntity } from './config/entities/site-config.entity';
import { AboutSectionEntity } from './about/entities/about-section.entity';
import { AboutArticleEntity } from './about/entities/about-article.entity';

// Modules
import { ArticleModule } from './article/article.module';
import { CategoryModule } from './category/category.module';
import { SpecialModule } from './special/special.module';
import { LinkModule } from './link/link.module';
import { PageModule } from './page/page.module';
import { QuickLinkModule } from './quick-link/quick-link.module';
import { NoticeModule } from './notice/notice.module';
import { FocusModule } from './focus/focus.module';
import { PortalModule } from './portal/portal.module';
import { SiteConfigModule } from './config/site-config.module';
import { AboutModule } from './about/about.module';

@Module({
  imports: [
    TypeOrmModule.forFeature([
      ArticleEntity,
      CategoryEntity,
      SpecialEntity,
      SpecialArticleEntity,
      LinkEntity,
      PageEntity,
      QuickLinkEntity,
      NoticeEntity,
      FocusEntity,
      FocusHistoryEntity,
      SiteConfigEntity,
      AboutSectionEntity,
      AboutArticleEntity,
    ]),
    ArticleModule,
    CategoryModule,
    SpecialModule,
    LinkModule,
    PageModule,
    QuickLinkModule,
    NoticeModule,
    FocusModule,
    PortalModule,
    SiteConfigModule,
    AboutModule,
  ],
  exports: [ArticleModule, CategoryModule, SpecialModule, LinkModule, PageModule, QuickLinkModule, NoticeModule, FocusModule, PortalModule, SiteConfigModule, AboutModule],
})
export class CmsModule {}
