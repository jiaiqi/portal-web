import { ApiProperty } from '@nestjs/swagger';

export class RecordVisitDto {
  @ApiProperty({ description: '访问页面URL', example: '/' })
  pageUrl: string;

  @ApiProperty({ description: '页面类型：home首页 article文章 special专题', example: 'home' })
  pageType: string;

  @ApiProperty({ description: '关联ID（文章ID、专题ID等）', required: false })
  refTypeId?: number;

  @ApiProperty({ description: 'IP地址', required: false })
  ipAddress?: string;

  @ApiProperty({ description: '浏览器信息', required: false })
  userAgent?: string;
}
