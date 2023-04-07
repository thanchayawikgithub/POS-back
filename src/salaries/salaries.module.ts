import { Module } from '@nestjs/common';
import { SalariesService } from './salaries.service';
import { SalariesController } from './salaries.controller';
import { Salary } from './entities/salary.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Employee } from 'src/employees/entities/employee.entity';
import { CheckInOut } from 'src/check_in_outs/entities/check_in_out.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Salary, Employee, CheckInOut])],
  controllers: [SalariesController],
  providers: [SalariesService],
})
export class SalariesModule {}
