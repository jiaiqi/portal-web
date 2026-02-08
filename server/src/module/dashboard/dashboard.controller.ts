import { Controller, Get, Query } from '@nestjs/common';
import { ApiTags, ApiOperation, ApiBearerAuth } from '@nestjs/swagger';
import { DashboardService } from './dashboard.service';
import { ApiDataResponse } from 'src/common/decorators/apiDataResponse.decorator';

@ApiTags('工作台')
@ApiBearerAuth()
@Controller('dashboard')
export class DashboardController {
  constructor(private readonly dashboardService: DashboardService) {}

  @ApiOperation({ summary: '获取工作台统计数据' })
  @ApiDataResponse()
  @Get('/statistics')
  getStatistics() {
    return this.dashboardService.getStatistics();
  }

  @ApiOperation({ summary: '获取最近操作日志' })
  @ApiDataResponse()
  @Get('/recentLogs')
  getRecentLogs(@Query('pageSize') pageSize?: number) {
    return this.dashboardService.getRecentLogs({ pageSize });
  }

  @ApiOperation({ summary: '获取文章发布趋势' })
  @ApiDataResponse()
  @Get('/articleTrend')
  getArticleTrend(@Query('type') type?: string) {
    return this.dashboardService.getArticleTrend({ type });
  }

  @ApiOperation({ summary: '获取系统状态' })
  @ApiDataResponse()
  @Get('/systemStatus')
  getSystemStatus() {
    return this.dashboardService.getSystemStatus();
  }

  @ApiOperation({ summary: '获取待办事项' })
  @ApiDataResponse()
  @Get('/todoList')
  getTodoList() {
    return this.dashboardService.getTodoList();
  }
}
