import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DashboardController } from './dashboard.controller';
import { DashboardService } from './dashboard.service';
import { ArticleEntity } from '../cms/article/entities/article.entity';
import { NoticeEntity } from '../cms/notice/entities/notice.entity';
import { FocusEntity } from '../cms/focus/entities/focus.entity';
import { CategoryEntity } from '../cms/category/entities/category.entity';

@Module({
  imports: [
    TypeOrmModule.forFeature([
      ArticleEntity,
      NoticeEntity,
      FocusEntity,
      CategoryEntity,
    ]),
  ],
  controllers: [DashboardController],
  providers: [DashboardService],
  exports: [DashboardService],
})
export class DashboardModule {}
