import { IsNotEmpty } from 'class-validator';

export class CreateCheckInOutDto {
  @IsNotEmpty()
  EmployeeId: number;

  @IsNotEmpty()
  SummarySalaryId: number;

  @IsNotEmpty()
  cio_date: Date;

  @IsNotEmpty()
  cio_time_in: number;

  @IsNotEmpty()
  cio_time_out: number;

  @IsNotEmpty()
  cio_total_hour: number;
}
