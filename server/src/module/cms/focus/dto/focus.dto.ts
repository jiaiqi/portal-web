import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsString, IsNumber, IsOptional, IsIn, Length, MaxLength, Min } from 'class-validator';
import { Type } from 'class-transformer';

export class UpdateFocusDto {
  @ApiProperty({ description: '焦点图ID' })
  @Type(() => Number)
  @IsNumber()
  focusId: number;

  @ApiProperty({ description: '图片URL' })
  @IsString()
  @MaxLength(500)
  imageUrl: string;

  @ApiPropertyOptional({ description: '图片来源类型：upload上传 link链接', default: 'upload' })
  @IsOptional()
  @IsIn(['upload', 'link'])
  imageSourceType?: string;

  @ApiPropertyOptional({ description: '链接类型：internal内部文章 external外部地址', default: 'external' })
  @IsOptional()
  @IsIn(['internal', 'external'])
  linkType?: string;

  @ApiPropertyOptional({ description: '链接值（文章ID或外部URL）' })
  @IsOptional()
  @IsString()
  @MaxLength(500)
  linkValue?: string;

  @ApiPropertyOptional({ description: '打开方式：current当前页 new新标签页', default: 'new' })
  @IsOptional()
  @IsIn(['current', 'new'])
  openType?: string;

  @ApiPropertyOptional({ description: '修改备注' })
  @IsOptional()
  @IsString()
  @MaxLength(200)
  remark?: string;
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
}

export class FocusHistoryListDto {
  @ApiProperty({ description: '焦点图ID' })
  @Type(() => Number)
  @IsNumber()
  focusId: number;

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
}

export class RestoreFocusDto {
  @ApiProperty({ description: '历史记录ID' })
  @Type(() => Number)
  @IsNumber()
  historyId: number;

  @ApiPropertyOptional({ description: '恢复备注' })
  @IsOptional()
  @IsString()
  @MaxLength(200)
  remark?: string;
}
