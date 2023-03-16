import { Module } from '@nestjs/common';
import { BillDetailsService } from './bill_details.service';
import { BillDetailsController } from './bill_details.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { BillDetail } from './entities/bill_detail.entity';
import { Material } from 'src/materials/entities/material.entity';
import { Bill } from 'src/bill/entities/bill.entity';

@Module({
  imports: [TypeOrmModule.forFeature([BillDetail, Bill, Material])],
  controllers: [BillDetailsController],
  providers: [BillDetailsService],
})
export class BillDetailsModule {}
