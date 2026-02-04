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

// Modules
import { ArticleModule } from './article/article.module';
import { CategoryModule } from './category/category.module';
import { BannerModule } from './banner/banner.module';

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
    ]),
    ArticleModule,
    CategoryModule,
    BannerModule,
  ],
  exports: [ArticleModule, CategoryModule, BannerModule],
})
export class CmsModule {}
