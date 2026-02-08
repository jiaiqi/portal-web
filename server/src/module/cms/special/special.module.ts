import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { SpecialService } from './special.service';
import { SpecialController } from './special.controller';
import { SpecialEntity } from './entities/special.entity';
import { SpecialArticleEntity } from './entities/special-article.entity';
import { ArticleEntity } from '../article/entities/article.entity';

@Module({
  imports: [TypeOrmModule.forFeature([SpecialEntity, SpecialArticleEntity, ArticleEntity])],
  controllers: [SpecialController],
  providers: [SpecialService],
  exports: [SpecialService],
})
export class SpecialModule {}
