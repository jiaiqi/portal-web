import { ApiProperty } from '@nestjs/swagger';
import { IsString, IsNumber, IsOptional, IsIn } from 'class-validator';

export class CreateNavigationDto {
  @ApiProperty({ description: '导航名称' })
  @IsString()
  navName: string;

  @ApiProperty({ description: '导航路径/路由' })
  @IsString()
  navPath: string;

  @ApiProperty({ description: '导航类型：internal内部 external外部', default: 'internal' })
  @IsString()
  @IsIn(['internal', 'external'])
  @IsOptional()
  navType?: string;

  @ApiProperty({ description: '打开方式：_self当前页 _blank新标签页', default: '_self' })
  @IsString()
  @IsIn(['_self', '_blank'])
  @IsOptional()
  navTarget?: string;

  @ApiProperty({ description: '排序', default: 0 })
  @IsNumber()
  @IsOptional()
  sortOrder?: number;

  @ApiProperty({ description: '状态：0禁用 1启用', default: '1' })
  @IsString()
  @IsIn(['0', '1'])
  @IsOptional()
  status?: string;
}

export class UpdateNavigationDto extends CreateNavigationDto {
  @ApiProperty({ description: '导航ID' })
  @IsNumber()
  navId: number;
}

export class NavigationListDto {
  @ApiProperty({ description: '页码', required: false })
  @IsNumber()
  @IsOptional()
  pageNum?: number;

  @ApiProperty({ description: '每页数量', required: false })
  @IsNumber()
  @IsOptional()
  pageSize?: number;

  @ApiProperty({ description: '导航名称', required: false })
  @IsString()
  @IsOptional()
  navName?: string;

  @ApiProperty({ description: '状态：0禁用 1启用', required: false })
  @IsString()
  @IsOptional()
  status?: string;
}
