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
import { BannerService } from './banner.service';
import { CreateBannerDto, UpdateBannerDto, BannerListDto } from './dto/banner.dto';
import { ApiDataResponse } from 'src/common/decorators/apiDataResponse.decorator';
import { BannerEntity } from './entities/banner.entity';

@ApiTags('CMS-轮播图管理')
@ApiBearerAuth()
@Controller('cms/banner')
export class BannerController {
  constructor(private readonly bannerService: BannerService) {}

  @ApiOperation({ summary: '获取轮播图列表' })
  @ApiDataResponse(BannerEntity, true)
  @Get('/list')
  findList(@Query() query: BannerListDto) {
    return this.bannerService.findList(query);
  }

  @ApiOperation({ summary: '获取所有启用轮播图' })
  @ApiDataResponse(BannerEntity, true)
  @Get('/all')
  findAll() {
    return this.bannerService.findAll();
  }

  @ApiOperation({ summary: '获取轮播图详情' })
  @ApiDataResponse(BannerEntity)
  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.bannerService.findOne(id);
  }

  @ApiOperation({ summary: '新增轮播图' })
  @ApiDataResponse()
  @Post()
  create(@Body() createDto: CreateBannerDto, @Request() req) {
    return this.bannerService.create(createDto, req.user?.userName || 'admin');
  }

  @ApiOperation({ summary: '修改轮播图' })
  @ApiDataResponse()
  @Put()
  update(@Body() updateDto: UpdateBannerDto, @Request() req) {
    return this.bannerService.update(updateDto, req.user?.userName || 'admin');
  }

  @ApiOperation({ summary: '删除轮播图' })
  @ApiDataResponse()
  @Delete(':id')
  delete(@Param('id', ParseIntPipe) id: number, @Request() req) {
    return this.bannerService.delete(id, req.user?.userName || 'admin');
  }
}
