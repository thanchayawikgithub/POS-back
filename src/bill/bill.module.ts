import { Module } from '@nestjs/common';
import { BillService } from './bill.service';
import { BillController } from './bill.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Bill } from './entities/bill.entity';
import { Employee } from 'src/employees/entities/employee.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Bill, Employee])],
  controllers: [BillController],
  providers: [BillService],
})
export class BillModule {}
