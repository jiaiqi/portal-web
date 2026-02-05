import { Controller, Get } from '@nestjs/common';
import { ApiTags, ApiOperation } from '@nestjs/swagger';
import { PortalService } from './portal.service';
import { ApiDataResponse } from 'src/common/decorators/apiDataResponse.decorator';
import { Public } from 'src/common/decorators/public.decorator';

@ApiTags('CMS-门户')
@Controller('portal')
export class PortalController {
  constructor(private readonly portalService: PortalService) {}

  @ApiOperation({ summary: '获取门户首页数据' })
  @ApiDataResponse()
  @Public()
  @Get('/home')
  getHomeData() {
    return this.portalService.getHomeData();
  }
}
