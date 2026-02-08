import { Controller, Post, Get, Body, Query } from '@nestjs/common';
import { ApiTags, ApiOperation } from '@nestjs/swagger';
import { StatisticsService } from './statistics.service';
import { RecordVisitDto } from './dto/record-visit.dto';
import { ApiDataResponse } from 'src/common/decorators/apiDataResponse.decorator';

@ApiTags('CMS统计')
@Controller('cms/statistics')
export class StatisticsController {
  constructor(private readonly statisticsService: StatisticsService) {}

  @ApiOperation({ summary: '记录访问' })
  @ApiDataResponse()
  @Post('record')
  recordVisit(@Body() recordVisitDto: RecordVisitDto) {
    return this.statisticsService.recordVisit(recordVisitDto);
  }

  @ApiOperation({ summary: '获取总访问量' })
  @ApiDataResponse()
  @Get('total')
  getTotalVisits() {
    return this.statisticsService.getTotalVisits();
  }

  @ApiOperation({ summary: '获取今日访问量' })
  @ApiDataResponse()
  @Get('today')
  getTodayVisits() {
    return this.statisticsService.getTodayVisits();
  }

  @ApiOperation({ summary: '获取访问趋势' })
  @ApiDataResponse()
  @Get('trend')
  getVisitTrend(@Query('days') days?: number) {
    return this.statisticsService.getVisitTrend(days);
  }
}
