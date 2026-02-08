import { ApiProperty } from '@nestjs/swagger';
import { IsString, IsNumber, IsOptional, IsIn } from 'class-validator';

export class CreateSpecialDto {
  @ApiProperty({ description: '专题标题' })
  @IsString()
  title: string;

  @ApiProperty({ description: '封面图', required: false })
  @IsString()
  @IsOptional()
  coverImage?: string;

  @ApiProperty({ description: '专题描述', required: false })
  @IsString()
  @IsOptional()
  description?: string;

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

export class UpdateSpecialDto extends CreateSpecialDto {
  @ApiProperty({ description: '专题ID' })
  @IsNumber()
  specialId: number;
}

export class SpecialListDto {
  @ApiProperty({ description: '页码', required: false })
  @IsNumber()
  @IsOptional()
  pageNum?: number;

  @ApiProperty({ description: '每页数量', required: false })
  @IsNumber()
  @IsOptional()
  pageSize?: number;

  @ApiProperty({ description: '专题标题', required: false })
  @IsString()
  @IsOptional()
  title?: string;

  @ApiProperty({ description: '状态：0禁用 1启用', required: false })
  @IsString()
  @IsOptional()
  status?: string;
}

export class AddSpecialArticleDto {
  @ApiProperty({ description: '专题ID' })
  @IsNumber()
  specialId: number;

  @ApiProperty({ description: '文章ID' })
  @IsNumber()
  articleId: number;

  @ApiProperty({ description: '栏目ID', required: false })
  @IsNumber()
  @IsOptional()
  categoryId?: number;

  @ApiProperty({ description: '排序', default: 0 })
  @IsNumber()
  @IsOptional()
  sortOrder?: number;
}
