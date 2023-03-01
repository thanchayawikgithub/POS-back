import { IsNotEmpty, Length, IsNumber, Min } from 'class-validator';

export class CreateProductDto {
  @IsNotEmpty()
  categoryId: number;
  @IsNotEmpty()
  @Length(3, 32)
  product_name: string;

  @IsNotEmpty()
  product_type: string;

  @IsNotEmpty()
  product_size: string;

  @IsNumber()
  @Min(0)
  product_price: number;
}
