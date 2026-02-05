import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsString, IsNumber, IsOptional, IsIn, Length, MaxLength, Min } from 'class-validator';
import { Type } from 'class-transformer';

export class CreateFocusDto {
  @ApiProperty({ description: '焦点图标题' })
  @IsOptional()
  @IsString()
  @MaxLength(200)
  title?: string;

  @ApiProperty({ description: '图片URL' })
  @IsString()
  @MaxLength(500)
  imageUrl: string;

  @ApiPropertyOptional({ description: '图片类型：big大图 small小图', default: 'big' })
  @IsOptional()
  @IsIn(['big', 'small'])
  imageType?: string;

  @ApiPropertyOptional({ description: '跳转链接' })
  @IsOptional()
  @IsString()
  @MaxLength(500)
  linkUrl?: string;

  @ApiPropertyOptional({ description: '排序', default: 0 })
  @IsOptional()
  @Type(() => Number)
  @IsNumber()
  sortOrder?: number;

  @ApiPropertyOptional({ description: '状态：0正常 1停用', default: '0' })
  @IsOptional()
  @IsIn(['0', '1'])
  status?: string;
}

export class UpdateFocusDto extends CreateFocusDto {
  @ApiProperty({ description: '焦点图ID' })
  @Type(() => Number)
  @IsNumber()
  focusId: number;
}

export class FocusListDto {
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

  @ApiPropertyOptional({ description: '图片类型：big大图 small小图' })
  @IsOptional()
  @IsIn(['big', 'small'])
  imageType?: string;

  @ApiPropertyOptional({ description: '状态：0正常 1停用' })
  @IsOptional()
  @IsIn(['0', '1'])
  status?: string;
}
