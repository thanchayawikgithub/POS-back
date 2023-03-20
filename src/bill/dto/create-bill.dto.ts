import { IsNotEmpty } from 'class-validator';
import { CreateBillDetailDto } from 'src/bill_details/dto/create-bill_detail.dto';
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
  @IsNotEmpty()
  billDetails: CreateBillDetailDto[];
}
