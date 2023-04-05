import { IsNotEmpty, Length } from 'class-validator';

export class CreateProductDto {
  @IsNotEmpty()
  @Length(3, 32)
  product_name: string;

  @IsNotEmpty()
  product_type: string;

  @IsNotEmpty()
  product_size: string;

  @IsNotEmpty()
  product_size_unit: string;

  @IsNotEmpty()
  product_price: number;

  product_image = 'no_img_avaliable.jpg';

  @IsNotEmpty()
  categoryId: number;
}
