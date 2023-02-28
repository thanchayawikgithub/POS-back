import { IsNotEmpty } from 'class-validator';
export class CreateRecieptDetailDto {
  @IsNotEmpty()
  rcd_name: string;
  @IsNotEmpty()
  rcd_amount: number;
  @IsNotEmpty()
  rcd_price: number;
  @IsNotEmpty()
  rcd_total: number;
}
