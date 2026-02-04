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
import { LinkService } from './link.service';
import { CreateLinkDto, UpdateLinkDto, LinkListDto } from './dto/link.dto';
import { ApiDataResponse } from 'src/common/decorators/apiDataResponse.decorator';
import { LinkEntity } from './entities/link.entity';

@ApiTags('CMS-友情链接管理')
@ApiBearerAuth()
@Controller('cms/link')
export class LinkController {
  constructor(private readonly linkService: LinkService) {}

  @ApiOperation({ summary: '获取友情链接列表' })
  @ApiDataResponse(LinkEntity, true, true)
  @Get('/list')
  findList(@Query() query: LinkListDto) {
    return this.linkService.findList(query);
  }

  @ApiOperation({ summary: '获取友情链接详情' })
  @ApiDataResponse(LinkEntity)
  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.linkService.findOne(id);
  }

  @ApiOperation({ summary: '新增友情链接' })
  @ApiDataResponse()
  @Post()
  create(@Body() createDto: CreateLinkDto, @Request() req) {
    return this.linkService.create(createDto, req.user?.userName || 'admin');
  }

  @ApiOperation({ summary: '修改友情链接' })
  @ApiDataResponse()
  @Put()
  update(@Body() updateDto: UpdateLinkDto, @Request() req) {
    return this.linkService.update(updateDto, req.user?.userName || 'admin');
  }

  @ApiOperation({ summary: '删除友情链接' })
  @ApiDataResponse()
  @Delete(':id')
  delete(@Param('id', ParseIntPipe) id: number, @Request() req) {
    return this.linkService.delete(id, req.user?.userName || 'admin');
  }
}
