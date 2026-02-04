import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsString, IsNumber, IsOptional, IsIn, Length, Min } from 'class-validator';
import { Type } from 'class-transformer';

export class CreateLinkDto {
  @ApiProperty({ description: '链接名称' })
  @IsString()
  @Length(1, 100)
  linkName: string;

  @ApiProperty({ description: '链接地址' })
  @IsString()
  @Length(1, 255)
  linkUrl: string;

  @ApiPropertyOptional({ description: '链接Logo' })
  @IsOptional()
  @IsString()
  linkLogo?: string;

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

export class UpdateLinkDto extends CreateLinkDto {
  @ApiProperty({ description: '链接ID' })
  @Type(() => Number)
  @IsNumber()
  linkId: number;
}

export class LinkListDto {
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

  @ApiPropertyOptional({ description: '链接名称' })
  @IsOptional()
  @IsString()
  linkName?: string;

  @ApiPropertyOptional({ description: '状态：0禁用 1启用' })
  @IsOptional()
  @IsIn(['0', '1'])
  status?: string;
}
