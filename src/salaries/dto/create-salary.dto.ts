import { IsNotEmpty } from 'class-validator';

export class CreateSalaryDto {
  ss_work_hour: number;

  @IsNotEmpty()
  ss_salary: number;
}
