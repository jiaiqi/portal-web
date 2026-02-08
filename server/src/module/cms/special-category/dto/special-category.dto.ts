import { ApiProperty } from '@nestjs/swagger';
import { IsString, IsNumber, IsOptional, IsIn } from 'class-validator';

export class CreateSpecialCategoryDto {
  @ApiProperty({ description: '专题ID' })
  @IsNumber()
  specialId: number;

  @ApiProperty({ description: '栏目名称' })
  @IsString()
  categoryName: string;

  @ApiProperty({ description: '栏目编码' })
  @IsString()
  categoryCode: string;

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

export class UpdateSpecialCategoryDto extends CreateSpecialCategoryDto {
  @ApiProperty({ description: '栏目ID' })
  @IsNumber()
  categoryId: number;
}

export class SpecialCategoryListDto {
  @ApiProperty({ description: '专题ID', required: false })
  @IsNumber()
  @IsOptional()
  specialId?: number;

  @ApiProperty({ description: '栏目名称', required: false })
  @IsString()
  @IsOptional()
  categoryName?: string;

  @ApiProperty({ description: '状态：0禁用 1启用', required: false })
  @IsString()
  @IsOptional()
  status?: string;
}
