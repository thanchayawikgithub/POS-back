import { IsNotEmpty } from 'class-validator';
export class CreateBillDto {
  @IsNotEmpty()
  employee_id: number;
  @IsNotEmpty()
  bill_shop_name: string;
  @IsNotEmpty()
  bill_total: number;
  @IsNotEmpty()
  bill_buy: number;
  @IsNotEmpty()
  bill_change: number;
}
