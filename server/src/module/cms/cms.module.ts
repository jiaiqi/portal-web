import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';

// Entities
import { ArticleEntity } from './article/entities/article.entity';
import { CategoryEntity } from './category/entities/category.entity';
import { BannerEntity } from './banner/entities/banner.entity';
import { SpecialEntity } from './special/entities/special.entity';
import { SpecialArticleEntity } from './special/entities/special-article.entity';
import { LinkEntity } from './link/entities/link.entity';
import { PageEntity } from './page/entities/page.entity';
import { QuickLinkEntity } from './quick-link/entities/quick-link.entity';
import { NoticeEntity } from './notice/entities/notice.entity';
import { FocusEntity } from './focus/entities/focus.entity';

// Modules
import { ArticleModule } from './article/article.module';
import { CategoryModule } from './category/category.module';
import { BannerModule } from './banner/banner.module';
import { SpecialModule } from './special/special.module';
import { LinkModule } from './link/link.module';
import { PageModule } from './page/page.module';
import { QuickLinkModule } from './quick-link/quick-link.module';
import { NoticeModule } from './notice/notice.module';
import { FocusModule } from './focus/focus.module';
import { PortalModule } from './portal/portal.module';

@Module({
  imports: [
    TypeOrmModule.forFeature([
      ArticleEntity,
      CategoryEntity,
      BannerEntity,
      SpecialEntity,
      SpecialArticleEntity,
      LinkEntity,
      PageEntity,
      QuickLinkEntity,
      NoticeEntity,
      FocusEntity,
    ]),
    ArticleModule,
    CategoryModule,
    BannerModule,
    SpecialModule,
    LinkModule,
    PageModule,
    QuickLinkModule,
    NoticeModule,
    FocusModule,
    PortalModule,
  ],
  exports: [ArticleModule, CategoryModule, BannerModule, SpecialModule, LinkModule, PageModule, QuickLinkModule, NoticeModule, FocusModule, PortalModule],
})
export class CmsModule {}
