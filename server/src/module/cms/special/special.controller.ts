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
import { SpecialService } from './special.service';
import { CreateSpecialDto, UpdateSpecialDto, SpecialListDto, AddSpecialArticleDto } from './dto/special.dto';
import { ApiDataResponse } from 'src/common/decorators/apiDataResponse.decorator';
import { SpecialEntity } from './entities/special.entity';
import { SpecialArticleEntity } from './entities/special-article.entity';
import { Public } from 'src/common/decorators/public.decorator';

@ApiTags('CMS-专题管理')
@ApiBearerAuth()
@Controller('cms/special')
export class SpecialController {
  constructor(private readonly specialService: SpecialService) {}

  @ApiOperation({ summary: '获取专题列表' })
  @ApiDataResponse(SpecialEntity, true, true)
  @Get('/list')
  findList(@Query() query: SpecialListDto) {
    return this.specialService.findList(query);
  }

  @ApiOperation({ summary: '获取专题详情' })
  @ApiDataResponse(SpecialEntity)
  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.specialService.findOne(id);
  }

  @ApiOperation({ summary: '新增专题' })
  @ApiDataResponse()
  @Post()
  create(@Body() createDto: CreateSpecialDto, @Request() req) {
    return this.specialService.create(createDto, req.user?.userName || 'admin');
  }

  @ApiOperation({ summary: '修改专题' })
  @ApiDataResponse()
  @Put()
  update(@Body() updateDto: UpdateSpecialDto, @Request() req) {
    return this.specialService.update(updateDto, req.user?.userName || 'admin');
  }

  @ApiOperation({ summary: '删除专题' })
  @ApiDataResponse()
  @Delete(':id')
  delete(@Param('id', ParseIntPipe) id: number, @Request() req) {
    return this.specialService.delete(id, req.user?.userName || 'admin');
  }

  @ApiOperation({ summary: '添加文章到专题' })
  @ApiDataResponse()
  @Post('/article')
  addArticle(@Body() addDto: AddSpecialArticleDto) {
    return this.specialService.addArticle(addDto);
  }

  @ApiOperation({ summary: '从专题移除文章' })
  @ApiDataResponse()
  @Delete('/article/:id')
  removeArticle(@Param('id', ParseIntPipe) id: number) {
    return this.specialService.removeArticle(id);
  }

  @ApiOperation({ summary: '获取专题下的文章列表（支持栏目筛选）' })
  @ApiDataResponse(SpecialArticleEntity, true)
  @Public()
  @Get('/:specialId/articles')
  findArticlesByCategory(
    @Param('specialId', ParseIntPipe) specialId: number,
    @Query('categoryId') categoryId?: number,
  ) {
    return this.specialService.findArticlesByCategory(specialId, categoryId);
  }
}
