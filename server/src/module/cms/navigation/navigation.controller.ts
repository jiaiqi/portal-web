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
import { NavigationService } from './navigation.service';
import { CreateNavigationDto, UpdateNavigationDto, NavigationListDto } from './dto/navigation.dto';
import { ApiDataResponse } from 'src/common/decorators/apiDataResponse.decorator';
import { NavigationEntity } from './entities/navigation.entity';
import { Public } from 'src/common/decorators/public.decorator';

@ApiTags('CMS-网站导航管理')
@ApiBearerAuth()
@Controller('cms/navigation')
export class NavigationController {
  constructor(private readonly navigationService: NavigationService) {}

  @ApiOperation({ summary: '获取导航列表' })
  @ApiDataResponse(NavigationEntity, true, true)
  @Get('/list')
  findList(@Query() query: NavigationListDto) {
    return this.navigationService.findList(query);
  }

  @ApiOperation({ summary: '获取所有启用的导航' })
  @ApiDataResponse(NavigationEntity, true)
  @Public()
  @Get('/all')
  findAll() {
    return this.navigationService.findAll();
  }

  @ApiOperation({ summary: '获取导航详情' })
  @ApiDataResponse(NavigationEntity)
  @Get(':id')
  findOne(@Param('id', ParseIntPipe) id: number) {
    return this.navigationService.findOne(id);
  }

  @ApiOperation({ summary: '新增导航' })
  @ApiDataResponse()
  @Post()
  create(@Body() createDto: CreateNavigationDto, @Request() req) {
    return this.navigationService.create(createDto, req.user?.userName || 'admin');
  }

  @ApiOperation({ summary: '修改导航' })
  @ApiDataResponse()
  @Put()
  update(@Body() updateDto: UpdateNavigationDto, @Request() req) {
    return this.navigationService.update(updateDto, req.user?.userName || 'admin');
  }

  @ApiOperation({ summary: '删除导航' })
  @ApiDataResponse()
  @Delete(':id')
  delete(@Param('id', ParseIntPipe) id: number, @Request() req) {
    return this.navigationService.delete(id, req.user?.userName || 'admin');
  }
}
