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
import { FocusService } from './focus.service';
import { CreateFocusDto, UpdateFocusDto, FocusListDto } from './dto/focus.dto';
import { ApiDataResponse } from 'src/common/decorators/apiDataResponse.decorator';
import { FocusEntity } from './entities/focus.entity';

@ApiTags('CMS-焦点图管理')
@ApiBearerAuth()
@Controller('cms/focus')
export class FocusController {
  constructor(private readonly focusService: FocusService) {}

  @ApiOperation({ summary: '获取焦点图列表' })
  @ApiDataResponse(FocusEntity, true, true)
  @Get('/list')
  findList(@Query() query: FocusListDto) {
    return this.focusService.findList(query);
  }

  @ApiOperation({ summary: '获取首页焦点图' })
  @ApiDataResponse()
  @Get('/home')
  getHomeFocus() {
    return this.focusService.getHomeFocus();
  }

  @ApiOperation({ summary: '获取焦点图详情' })
  @ApiDataResponse(FocusEntity)
  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.focusService.findOne(id);
  }

  @ApiOperation({ summary: '新增焦点图' })
  @ApiDataResponse()
  @Post()
  create(@Body() createDto: CreateFocusDto, @Request() req) {
    return this.focusService.create(createDto, req.user?.userName || 'admin');
  }

  @ApiOperation({ summary: '修改焦点图' })
  @ApiDataResponse()
  @Put()
  update(@Body() updateDto: UpdateFocusDto, @Request() req) {
    return this.focusService.update(updateDto, req.user?.userName || 'admin');
  }

  @ApiOperation({ summary: '删除焦点图' })
  @ApiDataResponse()
  @Delete(':id')
  delete(@Param('id', ParseIntPipe) id: number, @Request() req) {
    return this.focusService.delete(id, req.user?.userName || 'admin');
  }
}
