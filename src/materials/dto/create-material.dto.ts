import { IsNotEmpty, Min } from 'class-validator';

export class CreateMaterialDto {
  @IsNotEmpty()
  mat_name: string;

  @IsNotEmpty()
  mat_min_quantity: number;

  @IsNotEmpty()
  mat_quantity: number;

  @IsNotEmpty()
  mat_unit: number;

  @IsNotEmpty()
  mat_price_per_unit: number;
}
