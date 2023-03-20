import { Module } from '@nestjs/common';
import { BillService } from './bill.service';
import { BillController } from './bill.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Bill } from './entities/bill.entity';
import { Employee } from 'src/employees/entities/employee.entity';
import { BillDetail } from 'src/bill_details/entities/bill_detail.entity';
import { Material } from 'src/materials/entities/material.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Bill, Employee, BillDetail, Material])],
  controllers: [BillController],
  providers: [BillService],
})
export class BillModule {}
