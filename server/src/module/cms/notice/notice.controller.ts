import {
  Controller,
  Get,
  Post,
  Put,
  Delete,
  Body,
  Query,
  Param,
  Request,
  ParseIntPipe,
} from '@nestjs/common';
import { ApiTags, ApiOperation, ApiBearerAuth } from '@nestjs/swagger';
import { NoticeService } from './notice.service';
import { CreateNoticeDto, UpdateNoticeDto, NoticeListDto } from './dto/notice.dto';
import { ApiDataResponse } from 'src/common/decorators/apiDataResponse.decorator';
import { NoticeEntity } from './entities/notice.entity';
import { Public } from 'src/common/decorators/public.decorator';

@ApiTags('CMS-公告管理')
@ApiBearerAuth()
@Controller('cms/notice')
export class NoticeController {
  constructor(private readonly noticeService: NoticeService) {}

  @ApiOperation({ summary: '获取公告列表' })
  @ApiDataResponse(NoticeEntity, true, true)
  @Public()
  @Get('/list')
  findList(@Query() query: NoticeListDto) {
    return this.noticeService.findList(query);
  }

  @ApiOperation({ summary: '获取公告详情' })
  @ApiDataResponse(NoticeEntity)
  @Public()
  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.noticeService.findOne(id);
  }

  @ApiOperation({ summary: '新增公告' })
  @ApiDataResponse()
  @Post()
  create(@Body() createDto: CreateNoticeDto, @Request() req) {
    return this.noticeService.create(createDto, req.user?.userName || 'admin');
  }

  @ApiOperation({ summary: '修改公告' })
  @ApiDataResponse()
  @Put()
  update(@Body() updateDto: UpdateNoticeDto, @Request() req) {
    return this.noticeService.update(updateDto, req.user?.userName || 'admin');
  }

  @ApiOperation({ summary: '删除公告' })
  @ApiDataResponse()
  @Delete(':id')
  delete(@Param('id', ParseIntPipe) id: number, @Request() req) {
    return this.noticeService.delete(id, req.user?.userName || 'admin');
  }
}
