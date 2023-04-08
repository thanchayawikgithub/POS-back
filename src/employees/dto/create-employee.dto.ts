import { IsEmail, IsNotEmpty, Length } from 'class-validator';

export class CreateEmployeeDto {
  @IsNotEmpty()
  @Length(3, 32)
  employee_name: string;

  @IsNotEmpty()
  employee_login: string;

  employee_password: string;

  @IsNotEmpty()
  employee_province: string;

  @IsNotEmpty()
  employee_district: string;

  @IsNotEmpty()
  employee_subdistrict: string;

  @IsNotEmpty()
  @Length(10)
  employee_tel: string;

  @IsNotEmpty()
  @IsEmail()
  employee_email: string;

  @IsNotEmpty()
  employee_position: string;

  @IsNotEmpty()
  employee_hourly_wage: number;
}
