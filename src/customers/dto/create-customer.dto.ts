import { IsNotEmpty, IsPositive, Length } from 'class-validator';

export class CreateCustomerDto {
  @IsNotEmpty()
  @Length(4, 16)
  customer_name: string;

  @IsNotEmpty()
  @Length(10)
  customer_tel: string;

  @IsNotEmpty()
  @IsPositive()
  customer_point: number;

  customer_startDate: Date;
}
