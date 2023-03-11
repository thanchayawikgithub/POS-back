import { IsNotEmpty } from 'class-validator';
export class CreateRecieptDetailDto {
  @IsNotEmpty()
  productId: number;
  @IsNotEmpty()
  rcd_amount: number;
}
