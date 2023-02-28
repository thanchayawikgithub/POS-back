import { IsNotEmpty, Length, IsNumber, Min } from 'class-validator';

export class CreateProductDto {
  @IsNotEmpty()
  @Length(3, 32)
  pro_name: string;

  @IsNotEmpty()
  pro_type: string;

  @IsNotEmpty()
  pro_size: string;

  @IsNumber()
  @Min(0)
  pro_price: number;
}
