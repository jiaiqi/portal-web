import {
  Controller,
  Get,
  Post,
  Put,
  Delete,
  Body,
  Query,
  Param,
  ParseIntPipe,
} from '@nestjs/common';
import { ApiTags, ApiOperation, ApiBearerAuth } from '@nestjs/swagger';
import { SiteConfigService } from './site-config.service';
import {
  CreateSiteConfigDto,
  UpdateSiteConfigDto,
  SiteConfigListDto,
} from './dto/site-config.dto';
import { Public } from 'src/common/decorators/public.decorator';

@ApiTags('网站配置管理')
@Controller('cms/site-config')
export class SiteConfigController {
  constructor(private readonly siteConfigService: SiteConfigService) {}

  @ApiOperation({ summary: '获取配置列表' })
  @Get('list')
  async list(@Query() query: SiteConfigListDto) {
    return this.siteConfigService.findList(query);
  }

  @ApiOperation({ summary: '获取所有配置（键值对形式）' })
  @Public()
  @Get('all')
  async all() {
    return this.siteConfigService.findAll();
  }

  @ApiOperation({ summary: '根据key获取配置值' })
  @Public()
  @Get('value/:key')
  async getValue(@Param('key') key: string) {
    return this.siteConfigService.getValue(key);
  }

  @ApiOperation({ summary: '获取配置详情' })
  @Get(':id')
  async detail(@Param('id', ParseIntPipe) id: number) {
    return this.siteConfigService.findById(id);
  }

  @ApiOperation({ summary: '新增配置' })
  @Post()
  async add(@Body() dto: CreateSiteConfigDto) {
    return this.siteConfigService.create(dto);
  }

  @ApiOperation({ summary: '修改配置' })
  @Put()
  async update(@Body() dto: UpdateSiteConfigDto) {
    return this.siteConfigService.update(dto);
  }

  @ApiOperation({ summary: '删除配置' })
  @Delete(':id')
  async delete(@Param('id', ParseIntPipe) id: number) {
    return this.siteConfigService.delete(id);
  }
}
