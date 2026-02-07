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
import { PageService } from './page.service';
import { CreatePageDto, UpdatePageDto, PageListDto } from './dto/page.dto';
import { ApiDataResponse } from 'src/common/decorators/apiDataResponse.decorator';
import { PageEntity } from './entities/page.entity';
import { Public } from 'src/common/decorators/public.decorator';

@ApiTags('CMS-单页管理')
@ApiBearerAuth()
@Controller('cms/page')
export class PageController {
  constructor(private readonly pageService: PageService) {}

  @ApiOperation({ summary: '获取单页列表' })
  @ApiDataResponse(PageEntity, true, true)
  @Public()
  @Get('/list')
  findList(@Query() query: PageListDto) {
    return this.pageService.findList(query);
  }

  @ApiOperation({ summary: '获取单页详情' })
  @ApiDataResponse(PageEntity)
  @Public()
  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.pageService.findOne(id);
  }

  @ApiOperation({ summary: '新增单页' })
  @ApiDataResponse()
  @Post()
  create(@Body() createDto: CreatePageDto, @Request() req) {
    return this.pageService.create(createDto, req.user?.userName || 'admin');
  }

  @ApiOperation({ summary: '修改单页' })
  @ApiDataResponse()
  @Put()
  update(@Body() updateDto: UpdatePageDto, @Request() req) {
    return this.pageService.update(updateDto, req.user?.userName || 'admin');
  }

  @ApiOperation({ summary: '删除单页' })
  @ApiDataResponse()
  @Delete(':id')
  delete(@Param('id', ParseIntPipe) id: number, @Request() req) {
    return this.pageService.delete(id, req.user?.userName || 'admin');
  }
}
