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
import { ArticleService } from './article.service';
import { CreateArticleDto, UpdateArticleDto, ArticleListDto, ArticleStatusDto, ArticleAuditDto, ArticlePublishDto } from './dto/article.dto';
import { ApiDataResponse } from 'src/common/decorators/apiDataResponse.decorator';
import { ArticleEntity } from './entities/article.entity';
import { Public } from 'src/common/decorators/public.decorator';

@ApiTags('CMS-文章管理')
@ApiBearerAuth()
@Controller('cms/article')
export class ArticleController {
  constructor(private readonly articleService: ArticleService) {}

  @ApiOperation({ summary: '获取文章列表' })
  @ApiDataResponse(ArticleEntity, true, true)
  @Public()
  @Get('/list')
  findList(@Query() query: ArticleListDto) {
    return this.articleService.findList(query);
  }

  @ApiOperation({ summary: '获取文章详情' })
  @ApiDataResponse(ArticleEntity)
  @Public()
  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.articleService.findOne(id);
  }

  @ApiOperation({ summary: '新增文章' })
  @ApiDataResponse()
  @Post()
  create(@Body() createDto: CreateArticleDto, @Request() req) {
    return this.articleService.create(createDto, req.user?.userName || 'admin');
  }

  @ApiOperation({ summary: '修改文章' })
  @ApiDataResponse()
  @Put()
  update(@Body() updateDto: UpdateArticleDto, @Request() req) {
    return this.articleService.update(updateDto, req.user?.userName || 'admin');
  }

  @ApiOperation({ summary: '删除文章' })
  @ApiDataResponse()
  @Delete(':id')
  delete(@Param('id', ParseIntPipe) id: number, @Request() req) {
    return this.articleService.delete(id, req.user?.userName || 'admin');
  }

  @ApiOperation({ summary: '修改文章状态' })
  @ApiDataResponse()
  @Put('/status')
  updateStatus(@Body() statusDto: ArticleStatusDto, @Request() req) {
    return this.articleService.updateStatus(
      statusDto.articleId,
      statusDto.status,
      req.user?.userName || 'admin',
    );
  }

  @ApiOperation({ summary: '文章审核' })
  @ApiDataResponse()
  @Put('/audit')
  audit(@Body() auditDto: ArticleAuditDto, @Request() req) {
    return this.articleService.audit(auditDto, req.user?.userName || 'admin');
  }

  @ApiOperation({ summary: '文章发布' })
  @ApiDataResponse()
  @Put('/publish')
  publish(@Body() publishDto: ArticlePublishDto, @Request() req) {
    return this.articleService.publish(publishDto, req.user?.userName || 'admin');
  }
}
