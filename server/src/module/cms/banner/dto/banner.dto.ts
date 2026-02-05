import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsString, IsNumber, IsOptional, IsIn, Length, Min } from 'class-validator';
import { Type } from 'class-transformer';

export class CreateBannerDto {
  @ApiPropertyOptional({ description: '标题' })
  @IsOptional()
  @IsString()
  @Length(0, 200)
  title?: string;

  @ApiProperty({ description: '图片' })
  @IsString()
  @Length(1, 255)
  image: string;

  @ApiPropertyOptional({ description: '链接地址' })
  @IsOptional()
  @IsString()
  linkUrl?: string;

  @ApiPropertyOptional({ description: '位置：home首页 focus首页焦点 right_top右侧顶部 right_platform右侧平台', default: 'home' })
  @IsOptional()
  @IsIn(['home', 'focus', 'right_top', 'right_platform'])
  position?: string;

  @ApiPropertyOptional({ description: '排序', default: 0 })
  @IsOptional()
  @Type(() => Number)
  @IsNumber()
  sortOrder?: number;

  @ApiPropertyOptional({ description: '状态：0禁用 1启用', default: '1' })
  @IsOptional()
  @IsIn(['0', '1'])
  status?: string;
}

export class UpdateBannerDto extends CreateBannerDto {
  @ApiProperty({ description: '轮播图ID' })
  @Type(() => Number)
  @IsNumber()
  bannerId: number;
}

export class BannerListDto {
  @ApiPropertyOptional({ description: '页码', default: 1 })
  @IsOptional()
  @Type(() => Number)
  @IsNumber()
  @Min(1)
  pageNum?: number = 1;

  @ApiPropertyOptional({ description: '每页条数', default: 10 })
  @IsOptional()
  @Type(() => Number)
  @IsNumber()
  @Min(1)
  pageSize?: number = 10;

  @ApiPropertyOptional({ description: '状态：0禁用 1启用' })
  @IsOptional()
  @IsIn(['0', '1'])
  status?: string;
}
