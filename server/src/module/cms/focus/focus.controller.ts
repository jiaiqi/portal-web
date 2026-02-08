import {
  Controller,
  Get,
  Put,
  Delete,
  Body,
  Query,
  Param,
  ParseIntPipe,
  Request,
} from '@nestjs/common';
import { ApiTags, ApiOperation, ApiBearerAuth } from '@nestjs/swagger';
import { FocusService } from './focus.service';
import {
  UpdateFocusDto,
  FocusListDto,
  FocusHistoryListDto,
  RestoreFocusDto,
} from './dto/focus.dto';
import { ApiDataResponse } from 'src/common/decorators/apiDataResponse.decorator';
import { Public } from 'src/common/decorators/public.decorator';
import { ResultData } from 'src/common/utils/result';
import { FocusEntity } from './entities/focus.entity';

@ApiTags('焦点图管理')
@Controller('cms/focus')
export class FocusController {
  constructor(private readonly focusService: FocusService) {}

  @ApiOperation({ summary: '获取焦点图列表' })
  @ApiDataResponse(FocusEntity, true, true)
  @Get('list')
  async list(@Query() query: FocusListDto) {
    return this.focusService.findList(query);
  }

  @ApiOperation({ summary: '获取所有焦点图（用于前端）' })
  @Public()
  @Get('all')
  async all() {
    return this.focusService.findAll();
  }

  @ApiOperation({ summary: '获取焦点图详情' })
  @Get(':id')
  async detail(@Param('id', ParseIntPipe) id: number) {
    return this.focusService.findById(id);
  }

  @ApiOperation({ summary: '修改焦点图' })
  @Put()
  async update(@Body() dto: UpdateFocusDto, @Request() req) {
    const userId = req.user?.userId || 'admin';
    return this.focusService.update(dto, userId);
  }

  @ApiOperation({ summary: '获取历史记录列表' })
  @ApiDataResponse(FocusEntity, true, true)
  @Get('history/list')
  async historyList(@Query() query: FocusHistoryListDto) {
    return this.focusService.findHistoryList(query);
  }

  @ApiOperation({ summary: '从历史记录恢复' })
  @Put('history/restore')
  async restoreFromHistory(@Body() dto: RestoreFocusDto, @Request() req) {
    const userId = req.user?.userId || 'admin';
    return this.focusService.restoreFromHistory(dto, userId);
  }

  @ApiOperation({ summary: '删除历史记录' })
  @Delete('history/:id')
  async deleteHistory(@Param('id', ParseIntPipe) id: number) {
    return this.focusService.deleteHistory(id);
  }
}
