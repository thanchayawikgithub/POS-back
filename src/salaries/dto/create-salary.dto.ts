import { IsNotEmpty } from 'class-validator';

export class CreateSalaryDto {
  @IsNotEmpty()
  EmployeeId: number;

  @IsNotEmpty()
  SalaryId: number;
}
