import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AboutService } from './about.service';
import { AboutController } from './about.controller';
import { AboutSectionEntity } from './entities/about-section.entity';
import { AboutArticleEntity } from './entities/about-article.entity';

@Module({
  imports: [TypeOrmModule.forFeature([AboutSectionEntity, AboutArticleEntity])],
  controllers: [AboutController],
  providers: [AboutService],
  exports: [AboutService],
})
export class AboutModule {}
