import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { StatisticsController } from './statistics.controller';
import { StatisticsService } from './statistics.service';
import { VisitLogEntity } from './entities/visit-log.entity';
import { StatisticsEntity } from './entities/statistics.entity';

@Module({
  imports: [TypeOrmModule.forFeature([VisitLogEntity, StatisticsEntity])],
  controllers: [StatisticsController],
  providers: [StatisticsService],
  exports: [StatisticsService],
})
export class StatisticsModule {}
