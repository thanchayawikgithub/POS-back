import { IsNotEmpty } from 'class-validator';

export class CreateCheckInOutDto {
  @IsNotEmpty()
  EmployeeId: number;

  // @IsNotEmpty()
  // SummarySalaryId: number;

  status: string;

  cio_total_hour: number;
}
