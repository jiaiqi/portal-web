import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsString, IsNumber, IsOptional, IsIn, Length } from 'class-validator';

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

  @ApiPropertyOptional({ description: '排序', default: 0 })
  @IsOptional()
  @IsNumber()
  sortOrder?: number;

  @ApiPropertyOptional({ description: '状态：0禁用 1启用', default: '1' })
  @IsOptional()
  @IsIn(['0', '1'])
  status?: string;
}

export class UpdateBannerDto extends CreateBannerDto {
  @ApiProperty({ description: '轮播图ID' })
  @IsNumber()
  bannerId: number;
}

export class BannerListDto {
  @ApiPropertyOptional({ description: '状态：0禁用 1启用' })
  @IsOptional()
  @IsIn(['0', '1'])
  status?: string;
}
