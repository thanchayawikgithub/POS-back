import { IsNotEmpty } from 'class-validator';

export class CreateBillDetailDto {
  @IsNotEmpty()
  mat_id: number;

  @IsNotEmpty()
  bill_detail_amount: number;
}
