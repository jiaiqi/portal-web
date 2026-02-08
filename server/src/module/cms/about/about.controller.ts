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
import { AboutService } from './about.service';
import {
  CreateSectionDto,
  UpdateSectionDto,
  SectionListDto,
  CreateAboutArticleDto,
  UpdateAboutArticleDto,
  AboutArticleListDto,
} from './dto/about.dto';
import { ApiDataResponse } from 'src/common/decorators/apiDataResponse.decorator';
import { AboutSectionEntity } from './entities/about-section.entity';
import { AboutArticleEntity } from './entities/about-article.entity';
import { Public } from 'src/common/decorators/public.decorator';

@ApiTags('CMS-协会概况管理')
@ApiBearerAuth()
@Controller('cms/about')
export class AboutController {
  constructor(private readonly aboutService: AboutService) {}

  // ==================== 栏目管理（后台）====================

  @ApiOperation({ summary: '创建栏目' })
  @ApiDataResponse(AboutSectionEntity)
  @Post('/section')
  createSection(@Body() createDto: CreateSectionDto, @Request() req) {
    return this.aboutService.createSection(createDto, req.user?.userName || 'admin');
  }

  @ApiOperation({ summary: '修改栏目' })
  @ApiDataResponse(AboutSectionEntity)
  @Put('/section')
  updateSection(@Body() updateDto: UpdateSectionDto, @Request() req) {
    return this.aboutService.updateSection(updateDto, req.user?.userName || 'admin');
  }

  @ApiOperation({ summary: '删除栏目' })
  @ApiDataResponse()
  @Delete('/section/:id')
  deleteSection(@Param('id', ParseIntPipe) id: number, @Request() req) {
    return this.aboutService.deleteSection(id, req.user?.userName || 'admin');
  }

  // ==================== 栏目管理（前台）====================

  @ApiOperation({ summary: '获取所有启用的栏目' })
  @ApiDataResponse(AboutSectionEntity, true)
  @Public()
  @Get('/section/all')
  findAllSections() {
    return this.aboutService.findAllSections();
  }

  @ApiOperation({ summary: '根据key获取栏目' })
  @ApiDataResponse(AboutSectionEntity)
  @Public()
  @Get('/section/key/:sectionKey')
  findSectionByKey(@Param('sectionKey') sectionKey: string) {
    return this.aboutService.findSectionByKey(sectionKey);
  }

  @ApiOperation({ summary: '获取栏目列表' })
  @ApiDataResponse(AboutSectionEntity, true, true)
  @Get('/section/list')
  findSectionList(@Query() query: SectionListDto) {
    return this.aboutService.findSectionList(query);
  }

  @ApiOperation({ summary: '获取栏目详情' })
  @ApiDataResponse(AboutSectionEntity)
  @Get('/section/:id')
  findOneSection(@Param('id', ParseIntPipe) id: number) {
    return this.aboutService.findOneSection(id);
  }

  // ==================== 文章管理（后台）====================

  @ApiOperation({ summary: '创建文章' })
  @ApiDataResponse(AboutArticleEntity)
  @Post('/article')
  createArticle(@Body() createDto: CreateAboutArticleDto, @Request() req) {
    return this.aboutService.createArticle(createDto, req.user?.userName || 'admin');
  }

  @ApiOperation({ summary: '修改文章' })
  @ApiDataResponse(AboutArticleEntity)
  @Put('/article')
  updateArticle(@Body() updateDto: UpdateAboutArticleDto, @Request() req) {
    return this.aboutService.updateArticle(updateDto, req.user?.userName || 'admin');
  }

  @ApiOperation({ summary: '删除文章' })
  @ApiDataResponse()
  @Delete('/article/:id')
  deleteArticle(@Param('id', ParseIntPipe) id: number, @Request() req) {
    return this.aboutService.deleteArticle(id, req.user?.userName || 'admin');
  }

  // ==================== 文章管理（前台）====================

  @ApiOperation({ summary: '根据栏目key获取文章列表' })
  @ApiDataResponse(AboutArticleEntity, true)
  @Public()
  @Get('/article/section/:sectionKey')
  findArticlesBySectionKey(@Param('sectionKey') sectionKey: string) {
    return this.aboutService.findArticlesBySectionKey(sectionKey);
  }

  @ApiOperation({ summary: '获取文章列表' })
  @ApiDataResponse(AboutArticleEntity, true, true)
  @Get('/article/list')
  findArticleList(@Query() query: AboutArticleListDto) {
    return this.aboutService.findArticleList(query);
  }

  @ApiOperation({ summary: '获取文章详情' })
  @ApiDataResponse(AboutArticleEntity)
  @Public()
  @Get('/article/:id')
  findOneArticle(@Param('id', ParseIntPipe) id: number) {
    return this.aboutService.findOneArticle(id);
  }
}
