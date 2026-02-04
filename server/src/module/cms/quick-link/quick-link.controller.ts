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
import { QuickLinkService } from './quick-link.service';
import { CreateQuickLinkDto, UpdateQuickLinkDto, QuickLinkListDto } from './dto/quick-link.dto';
import { ApiDataResponse } from 'src/common/decorators/apiDataResponse.decorator';
import { QuickLinkEntity } from './entities/quick-link.entity';

@ApiTags('CMS-快捷链接管理')
@ApiBearerAuth()
@Controller('cms/quick-link')
export class QuickLinkController {
  constructor(private readonly quickLinkService: QuickLinkService) {}

  @ApiOperation({ summary: '获取快捷链接列表' })
  @ApiDataResponse(QuickLinkEntity, true, true)
  @Get('/list')
  findList(@Query() query: QuickLinkListDto) {
    return this.quickLinkService.findList(query);
  }

  @ApiOperation({ summary: '获取快捷链接详情' })
  @ApiDataResponse(QuickLinkEntity)
  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.quickLinkService.findOne(id);
  }

  @ApiOperation({ summary: '新增快捷链接' })
  @ApiDataResponse()
  @Post()
  create(@Body() createDto: CreateQuickLinkDto, @Request() req) {
    return this.quickLinkService.create(createDto, req.user?.userName || 'admin');
  }

  @ApiOperation({ summary: '修改快捷链接' })
  @ApiDataResponse()
  @Put()
  update(@Body() updateDto: UpdateQuickLinkDto, @Request() req) {
    return this.quickLinkService.update(updateDto, req.user?.userName || 'admin');
  }

  @ApiOperation({ summary: '删除快捷链接' })
  @ApiDataResponse()
  @Delete(':id')
  delete(@Param('id', ParseIntPipe) id: number, @Request() req) {
    return this.quickLinkService.delete(id, req.user?.userName || 'admin');
  }
}
