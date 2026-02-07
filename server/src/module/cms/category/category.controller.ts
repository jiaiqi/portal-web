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
import { CategoryService } from './category.service';
import { CreateCategoryDto, UpdateCategoryDto, CategoryListDto } from './dto/category.dto';
import { ApiDataResponse } from 'src/common/decorators/apiDataResponse.decorator';
import { CategoryEntity } from './entities/category.entity';
import { Public } from 'src/common/decorators/public.decorator';

@ApiTags('CMS-分类管理')
@ApiBearerAuth()
@Controller('cms/category')
export class CategoryController {
  constructor(private readonly categoryService: CategoryService) {}

  @ApiOperation({ summary: '获取分类列表' })
  @ApiDataResponse(CategoryEntity, true)
  @Public()
  @Get('/list')
  findList(@Query() query: CategoryListDto) {
    return this.categoryService.findList(query);
  }

  @ApiOperation({ summary: '获取所有启用分类' })
  @ApiDataResponse(CategoryEntity, true)
  @Public()
  @Get('/all')
  findAll() {
    return this.categoryService.findAll();
  }

  @ApiOperation({ summary: '获取分类详情' })
  @ApiDataResponse(CategoryEntity)
  @Public()
  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.categoryService.findOne(id);
  }

  @ApiOperation({ summary: '新增分类' })
  @ApiDataResponse()
  @Post()
  create(@Body() createDto: CreateCategoryDto, @Request() req) {
    return this.categoryService.create(createDto, req.user?.userName || 'admin');
  }

  @ApiOperation({ summary: '修改分类' })
  @ApiDataResponse()
  @Put()
  update(@Body() updateDto: UpdateCategoryDto, @Request() req) {
    return this.categoryService.update(updateDto, req.user?.userName || 'admin');
  }

  @ApiOperation({ summary: '删除分类' })
  @ApiDataResponse()
  @Delete(':id')
  delete(@Param('id', ParseIntPipe) id: number, @Request() req) {
    return this.categoryService.delete(id, req.user?.userName || 'admin');
  }
}
