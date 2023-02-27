import { IsEmail, IsNotEmpty, Length } from 'class-validator';

export class CreateEmployeeDto {
  @IsNotEmpty()
  @Length(3, 32)
  name: string;

  @IsNotEmpty()
  address: string;

  @IsNotEmpty()
  @Length(10)
  tel: string;

  @IsNotEmpty()
  @IsEmail()
  email: string;

  @IsNotEmpty()
  position: string;

  @IsNotEmpty()
  hourly_wage: number;
}
