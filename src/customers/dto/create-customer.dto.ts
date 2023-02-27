import { IsNotEmpty, Length } from 'class-validator';

export class CreateCustomerDto {
  @IsNotEmpty()
  @Length(4, 16)
  name: string;

  @IsNotEmpty()
  tel: string;

  @IsNotEmpty()
  point: number;

  @IsNotEmpty()
  startDate: Date;
}
