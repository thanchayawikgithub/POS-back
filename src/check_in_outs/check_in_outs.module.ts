import { Module } from '@nestjs/common';
import { CheckInOutsService } from './check_in_outs.service';
import { CheckInOutsController } from './check_in_outs.controller';
import { CheckInOut } from './entities/check_in_out.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Employee } from 'src/employees/entities/employee.entity';
import { Salary } from 'src/salaries/entities/salary.entity';
import { AuthModule } from 'src/auth/auth.module';

@Module({
  imports: [
    TypeOrmModule.forFeature([CheckInOut, Salary, Employee]),
    AuthModule,
  ],
  controllers: [CheckInOutsController],
  providers: [CheckInOutsService],
})
export class CheckInOutsModule {}
