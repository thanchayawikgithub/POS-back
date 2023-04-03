import { IsNotEmpty } from 'class-validator';

export class CreateBillDetailDto {
  @IsNotEmpty()
  materialId: number;
  @IsNotEmpty()
  bill_detail_amount: number;
}
