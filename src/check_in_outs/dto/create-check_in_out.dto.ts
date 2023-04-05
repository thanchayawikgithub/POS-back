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

  status: string;

  @IsNotEmpty()
  cio_time_out: number;

  cio_total_hour: number;
}
