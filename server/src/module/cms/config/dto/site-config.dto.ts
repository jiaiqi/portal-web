import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsString, IsNumber, IsOptional, Length, Min } from 'class-validator';
import { Type } from 'class-transformer';

export class CreateSiteConfigDto {
  @ApiProperty({ description: '配置键' })
  @IsString()
  @Length(1, 100)
  configKey: string;

  @ApiPropertyOptional({ description: '配置值' })
  @IsOptional()
  @IsString()
  configValue?: string;

  @ApiProperty({ description: '配置名称' })
  @IsString()
  @Length(1, 200)
  configName: string;

  @ApiPropertyOptional({ description: '配置类型：text文本 textarea多行文本 rich富文本 image图片', default: 'text' })
  @IsOptional()
  @IsString()
  configType?: string;

  @ApiPropertyOptional({ description: '排序', default: 0 })
  @IsOptional()
  @Type(() => Number)
  @IsNumber()
  sortOrder?: number;
}

export class UpdateSiteConfigDto extends CreateSiteConfigDto {
  @ApiProperty({ description: '配置ID' })
  @Type(() => Number)
  @IsNumber()
  configId: number;
}

export class SiteConfigListDto {
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

  @ApiPropertyOptional({ description: '配置键' })
  @IsOptional()
  @IsString()
  configKey?: string;

  @ApiPropertyOptional({ description: '配置名称' })
  @IsOptional()
  @IsString()
  configName?: string;
}

export class SiteConfigValueDto {
  @ApiProperty({ description: '配置键' })
  @IsString()
  configKey: string;

  @ApiPropertyOptional({ description: '配置值' })
  @IsOptional()
  @IsString()
  configValue?: string;
}
