import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsString, IsNumber, IsOptional, IsIn, Length, MaxLength, Min } from 'class-validator';
import { Type } from 'class-transformer';

// 栏目DTO
export class CreateSectionDto {
  @ApiProperty({ description: '栏目标识' })
  @IsString()
  @Length(1, 50)
  sectionKey: string;

  @ApiProperty({ description: '栏目名称' })
  @IsString()
  @Length(1, 100)
  sectionName: string;

  @ApiPropertyOptional({ description: '栏目类型：richText富文本 list列表', default: 'richText' })
  @IsOptional()
  @IsIn(['richText', 'list'])
  sectionType?: string;

  @ApiPropertyOptional({ description: '富文本内容' })
  @IsOptional()
  @IsString()
  content?: string;

  @ApiPropertyOptional({ description: '排序', default: 0 })
  @IsOptional()
  @Type(() => Number)
  @IsNumber()
  @Min(0)
  sortOrder?: number;

  @ApiPropertyOptional({ description: '状态：0禁用 1启用', default: '1' })
  @IsOptional()
  @IsIn(['0', '1'])
  status?: string;
}

export class UpdateSectionDto extends CreateSectionDto {
  @ApiProperty({ description: '栏目ID' })
  @Type(() => Number)
  @IsNumber()
  sectionId: number;
}

export class SectionListDto {
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

  @ApiPropertyOptional({ description: '栏目名称' })
  @IsOptional()
  @IsString()
  sectionName?: string;

  @ApiPropertyOptional({ description: '状态：0禁用 1启用' })
  @IsOptional()
  @IsIn(['0', '1'])
  status?: string;
}

// 文章DTO
export class CreateAboutArticleDto {
  @ApiProperty({ description: '栏目标识' })
  @IsString()
  @Length(1, 50)
  sectionKey: string;

  @ApiProperty({ description: '文章标题' })
  @IsString()
  @Length(1, 200)
  title: string;

  @ApiPropertyOptional({ description: '文章内容' })
  @IsOptional()
  @IsString()
  content?: string;

  @ApiPropertyOptional({ description: '排序', default: 0 })
  @IsOptional()
  @Type(() => Number)
  @IsNumber()
  @Min(0)
  sortOrder?: number;

  @ApiPropertyOptional({ description: '状态：0禁用 1启用', default: '1' })
  @IsOptional()
  @IsIn(['0', '1'])
  status?: string;
}

export class UpdateAboutArticleDto extends CreateAboutArticleDto {
  @ApiProperty({ description: '文章ID' })
  @Type(() => Number)
  @IsNumber()
  articleId: number;
}

export class AboutArticleListDto {
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

  @ApiPropertyOptional({ description: '栏目标识' })
  @IsOptional()
  @IsString()
  sectionKey?: string;

  @ApiPropertyOptional({ description: '文章标题' })
  @IsOptional()
  @IsString()
  title?: string;

  @ApiPropertyOptional({ description: '状态：0禁用 1启用' })
  @IsOptional()
  @IsIn(['0', '1'])
  status?: string;
}
