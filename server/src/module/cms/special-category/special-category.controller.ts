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
import { SpecialCategoryService } from './special-category.service';
import { CreateSpecialCategoryDto, UpdateSpecialCategoryDto, SpecialCategoryListDto } from './dto/special-category.dto';
import { ApiDataResponse } from 'src/common/decorators/apiDataResponse.decorator';
import { SpecialCategoryEntity } from './entities/special-category.entity';
import { Public } from 'src/common/decorators/public.decorator';

@ApiTags('CMS-专题栏目管理')
@ApiBearerAuth()
@Controller('cms/special-category')
export class SpecialCategoryController {
  constructor(private readonly specialCategoryService: SpecialCategoryService) {}

  @ApiOperation({ summary: '获取专题栏目列表' })
  @ApiDataResponse(SpecialCategoryEntity, true)
  @Get('/list')
  findList(@Query() query: SpecialCategoryListDto) {
    return this.specialCategoryService.findList(query);
  }

  @ApiOperation({ summary: '根据专题ID获取栏目列表' })
  @ApiDataResponse(SpecialCategoryEntity, true)
  @Public()
  @Get('/special/:specialId')
  findBySpecialId(@Param('specialId', ParseIntPipe) specialId: number) {
    return this.specialCategoryService.findBySpecialId(specialId);
  }

  @ApiOperation({ summary: '获取专题栏目详情' })
  @ApiDataResponse(SpecialCategoryEntity)
  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.specialCategoryService.findOne(id);
  }

  @ApiOperation({ summary: '新增专题栏目' })
  @ApiDataResponse()
  @Post()
  create(@Body() createDto: CreateSpecialCategoryDto, @Request() req) {
    return this.specialCategoryService.create(createDto, req.user?.userName || 'admin');
  }

  @ApiOperation({ summary: '修改专题栏目' })
  @ApiDataResponse()
  @Put()
  update(@Body() updateDto: UpdateSpecialCategoryDto, @Request() req) {
    return this.specialCategoryService.update(updateDto, req.user?.userName || 'admin');
  }

  @ApiOperation({ summary: '删除专题栏目' })
  @ApiDataResponse()
  @Delete(':id')
  delete(@Param('id', ParseIntPipe) id: number, @Request() req) {
    return this.specialCategoryService.delete(id, req.user?.userName || 'admin');
  }
}
