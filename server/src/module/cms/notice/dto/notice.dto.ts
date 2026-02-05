import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsString, IsNumber, IsOptional, IsIn, Length, MaxLength, Min } from 'class-validator';
import { Type } from 'class-transformer';

export class CreateNoticeDto {
  @ApiProperty({ description: '公告标题' })
  @IsString()
  @Length(1, 200)
  title: string;

  @ApiPropertyOptional({ description: '公告内容' })
  @IsOptional()
  @IsString()
  content?: string;

  @ApiPropertyOptional({ description: '公告类型：notice公告 announcement公示', default: 'notice' })
  @IsOptional()
  @IsIn(['notice', 'announcement'])
  noticeType?: string;

  @ApiPropertyOptional({ description: '状态：0正常 1关闭', default: '0' })
  @IsOptional()
  @IsIn(['0', '1'])
  status?: string;

  @ApiPropertyOptional({ description: '是否置顶：0否 1是', default: '0' })
  @IsOptional()
  @IsIn(['0', '1'])
  isTop?: string;

  @ApiPropertyOptional({ description: '排序', default: 0 })
  @IsOptional()
  @Type(() => Number)
  @IsNumber()
  sortOrder?: number;
}

export class UpdateNoticeDto extends CreateNoticeDto {
  @ApiProperty({ description: '公告ID' })
  @Type(() => Number)
  @IsNumber()
  noticeId: number;
}

export class NoticeListDto {
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

  @ApiPropertyOptional({ description: '公告标题' })
  @IsOptional()
  @IsString()
  title?: string;

  @ApiPropertyOptional({ description: '公告类型：notice公告 announcement公示' })
  @IsOptional()
  @IsIn(['notice', 'announcement'])
  noticeType?: string;

  @ApiPropertyOptional({ description: '状态：0正常 1关闭' })
  @IsOptional()
  @IsIn(['0', '1'])
  status?: string;
}
