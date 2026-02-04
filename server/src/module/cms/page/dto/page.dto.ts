import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsString, IsNumber, IsOptional, Length, Min } from 'class-validator';
import { Type } from 'class-transformer';

export class CreatePageDto {
  @ApiProperty({ description: '页面名称' })
  @IsString()
  @Length(1, 100)
  pageName: string;

  @ApiProperty({ description: '页面标识' })
  @IsString()
  @Length(1, 50)
  pageKey: string;

  @ApiPropertyOptional({ description: '页面内容' })
  @IsOptional()
  @IsString()
  content?: string;
}

export class UpdatePageDto extends CreatePageDto {
  @ApiProperty({ description: '页面ID' })
  @Type(() => Number)
  @IsNumber()
  pageId: number;
}

export class PageListDto {
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

  @ApiPropertyOptional({ description: '页面名称' })
  @IsOptional()
  @IsString()
  pageName?: string;

  @ApiPropertyOptional({ description: '页面标识' })
  @IsOptional()
  @IsString()
  pageKey?: string;
}
