import { IsNotEmpty } from 'class-validator';

export class CreateRecieptDto {
  @IsNotEmpty()
  rec_queue: number;
  @IsNotEmpty()
  rec_time: number;
  @IsNotEmpty()
  rec_discount: number;
  @IsNotEmpty()
  rec_total: number;
  @IsNotEmpty()
  rec_received: number;
  @IsNotEmpty()
  rec_changed: number;
  @IsNotEmpty()
  rec_payment: string;
}
