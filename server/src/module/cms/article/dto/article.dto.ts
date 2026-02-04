import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsString, IsNumber, IsOptional, IsIn, Length, MaxLength } from 'class-validator';

export class CreateArticleDto {
  @ApiProperty({ description: '文章标题' })
  @IsString()
  @Length(1, 200)
  title: string;

  @ApiProperty({ description: '分类ID' })
  @IsNumber()
  categoryId: number;

  @ApiPropertyOptional({ description: '文章摘要' })
  @IsOptional()
  @IsString()
  @MaxLength(500)
  summary?: string;

  @ApiPropertyOptional({ description: '封面图' })
  @IsOptional()
  @IsString()
  @MaxLength(255)
  coverImage?: string;

  @ApiPropertyOptional({ description: '文章内容' })
  @IsOptional()
  @IsString()
  content?: string;

  @ApiPropertyOptional({ description: '文章来源' })
  @IsOptional()
  @IsString()
  @MaxLength(100)
  source?: string;

  @ApiPropertyOptional({ description: '作者' })
  @IsOptional()
  @IsString()
  @MaxLength(50)
  author?: string;

  @ApiPropertyOptional({ description: '发布时间' })
  @IsOptional()
  publishTime?: Date;

  @ApiPropertyOptional({ description: '状态：0草稿 1已发布', default: '0' })
  @IsOptional()
  @IsIn(['0', '1'])
  status?: string;

  @ApiPropertyOptional({ description: '是否置顶：0否 1是', default: '0' })
  @IsOptional()
  @IsIn(['0', '1'])
  isTop?: string;

  @ApiPropertyOptional({ description: 'SEO标题' })
  @IsOptional()
  @IsString()
  @MaxLength(200)
  seoTitle?: string;

  @ApiPropertyOptional({ description: 'SEO关键词' })
  @IsOptional()
  @IsString()
  @MaxLength(500)
  seoKeywords?: string;

  @ApiPropertyOptional({ description: 'SEO描述' })
  @IsOptional()
  @IsString()
  @MaxLength(500)
  seoDescription?: string;
}

export class UpdateArticleDto extends CreateArticleDto {
  @ApiProperty({ description: '文章ID' })
  @IsNumber()
  articleId: number;
}

export class ArticleListDto {
  @ApiPropertyOptional({ description: '页码', default: 1 })
  @IsOptional()
  pageNum?: number;

  @ApiPropertyOptional({ description: '每页条数', default: 10 })
  @IsOptional()
  pageSize?: number;

  @ApiPropertyOptional({ description: '分类ID' })
  @IsOptional()
  categoryId?: number;

  @ApiPropertyOptional({ description: '文章标题' })
  @IsOptional()
  @IsString()
  title?: string;

  @ApiPropertyOptional({ description: '状态：0草稿 1已发布' })
  @IsOptional()
  @IsIn(['0', '1'])
  status?: string;
}

export class ArticleStatusDto {
  @ApiProperty({ description: '文章ID' })
  @IsNumber()
  articleId: number;

  @ApiProperty({ description: '状态：0草稿 1已发布' })
  @IsIn(['0', '1'])
  status: string;
}
