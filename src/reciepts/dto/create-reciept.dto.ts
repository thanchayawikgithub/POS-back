import { IsNotEmpty } from 'class-validator';
import { CreateRecieptDetailDto } from 'src/reciept_details/dto/create-reciept_detail.dto';

export class CreateRecieptDto {
  @IsNotEmpty()
  rec_queue: number;
  @IsNotEmpty()
  rec_time: number;
  @IsNotEmpty()
  rec_discount: number;
  @IsNotEmpty()
  rec_received: number;
  @IsNotEmpty()
  rec_payment: string;
  @IsNotEmpty()
  storeId: number;
  @IsNotEmpty()
  customerId: number;
  @IsNotEmpty()
  employeeId: number;
  @IsNotEmpty()
  recieptDetails: CreateRecieptDetailDto[];
}
