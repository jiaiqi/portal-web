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
import { ResultData } from 'src/common/utils/result';

@ApiTags('CMS-分类管理')
@ApiBearerAuth()
@Controller('cms/category')
export class CategoryController {
  constructor(private readonly categoryService: CategoryService) {}

  @ApiOperation({ summary: '获取分类列表' })
  @ApiDataResponse(CategoryEntity, true)
  @Public()
  @Get('/list')
  async findList(@Query() query: CategoryListDto) {
    const data = await this.categoryService.findList(query);
    return ResultData.ok(data);
  }

  @ApiOperation({ summary: '获取所有启用分类' })
  @ApiDataResponse(CategoryEntity, true)
  @Public()
  @Get('/all')
  async findAll() {
    const data = await this.categoryService.findAll();
    return ResultData.ok(data);
  }

  @ApiOperation({ summary: '获取分类树' })
  @ApiDataResponse(CategoryEntity, true)
  @Public()
  @Get('/tree')
  async findTree() {
    const data = await this.categoryService.findTree();
    return ResultData.ok(data);
  }

  @ApiOperation({ summary: '根据编码获取分类' })
  @ApiDataResponse(CategoryEntity)
  @Public()
  @Get('/code/:code')
  async findByCode(@Param('code') code: string) {
    const data = await this.categoryService.findByCode(code);
    return ResultData.ok(data);
  }

  @ApiOperation({ summary: '获取子分类' })
  @ApiDataResponse(CategoryEntity, true)
  @Public()
  @Get('/children/:parentId')
  async findChildren(@Param('parentId', ParseIntPipe) parentId: number) {
    const data = await this.categoryService.findChildren(parentId);
    return ResultData.ok(data);
  }

  @ApiOperation({ summary: '获取分类详情' })
  @ApiDataResponse(CategoryEntity)
  @Public()
  @Get(':id')
  async findOne(@Param('id', ParseIntPipe) id: number) {
    const data = await this.categoryService.findOne(id);
    return ResultData.ok(data);
  }

  @ApiOperation({ summary: '新增分类' })
  @ApiDataResponse()
  @Post()
  async create(@Body() createDto: CreateCategoryDto, @Request() req) {
    const data = await this.categoryService.create(createDto, req.user?.userName || 'admin');
    return ResultData.ok(data);
  }

  @ApiOperation({ summary: '修改分类' })
  @ApiDataResponse()
  @Put()
  async update(@Body() updateDto: UpdateCategoryDto, @Request() req) {
    const data = await this.categoryService.update(updateDto, req.user?.userName || 'admin');
    return ResultData.ok(data);
  }

  @ApiOperation({ summary: '删除分类' })
  @ApiDataResponse()
  @Delete(':id')
  async delete(@Param('id', ParseIntPipe) id: number, @Request() req) {
    await this.categoryService.delete(id, req.user?.userName || 'admin');
    return ResultData.ok();
  }
}
