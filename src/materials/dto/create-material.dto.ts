import { IsNotEmpty } from 'class-validator';

export class CreateMaterialDto {
  @IsNotEmpty()
  mat_name: string;

  @IsNotEmpty()
  mat_min_quantity: number;

  @IsNotEmpty()
  mat_quantity: number;

  @IsNotEmpty()
  mat_unit: string;

  mat_shop_name: string;

  mat_image = 'no_img_avaliable.jpg';

  @IsNotEmpty()
  mat_price_per_unit: number;
}
