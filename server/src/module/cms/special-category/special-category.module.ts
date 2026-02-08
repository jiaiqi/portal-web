import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { SpecialCategoryService } from './special-category.service';
import { SpecialCategoryController } from './special-category.controller';
import { SpecialCategoryEntity } from './entities/special-category.entity';

@Module({
  imports: [TypeOrmModule.forFeature([SpecialCategoryEntity])],
  controllers: [SpecialCategoryController],
  providers: [SpecialCategoryService],
  exports: [SpecialCategoryService],
})
export class SpecialCategoryModule {}
