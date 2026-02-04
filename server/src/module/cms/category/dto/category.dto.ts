import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsString, IsNumber, IsOptional, IsIn, Length } from 'class-validator';

export class CreateCategoryDto {
  @ApiProperty({ description: '分类名称' })
  @IsString()
  @Length(1, 50)
  categoryName: string;

  @ApiProperty({ description: '分类编码' })
  @IsString()
  @Length(1, 50)
  categoryCode: string;

  @ApiPropertyOptional({ description: '父分类ID', default: 0 })
  @IsOptional()
  @IsNumber()
  parentId?: number;

  @ApiPropertyOptional({ description: '排序', default: 0 })
  @IsOptional()
  @IsNumber()
  sortOrder?: number;

  @ApiPropertyOptional({ description: '状态：0禁用 1启用', default: '1' })
  @IsOptional()
  @IsIn(['0', '1'])
  status?: string;

  @ApiPropertyOptional({ description: '图标' })
  @IsOptional()
  @IsString()
  icon?: string;
}

export class UpdateCategoryDto extends CreateCategoryDto {
  @ApiProperty({ description: '分类ID' })
  @IsNumber()
  categoryId: number;
}

export class CategoryListDto {
  @ApiPropertyOptional({ description: '分类名称' })
  @IsOptional()
  @IsString()
  categoryName?: string;

  @ApiPropertyOptional({ description: '状态：0禁用 1启用' })
  @IsOptional()
  @IsIn(['0', '1'])
  status?: string;
}
