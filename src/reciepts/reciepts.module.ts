import { Module } from '@nestjs/common';
import { RecieptsService } from './reciepts.service';
import { RecieptsController } from './reciepts.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Reciept } from './entities/reciept.entity';
import { RecieptDetail } from 'src/reciept_details/entities/reciept_detail.entity';
import { Product } from 'src/products/entities/product.entity';
import { Store } from 'src/stores/entities/store.entity';
import { Customer } from 'src/customers/entities/customer.entity';
import { Employee } from 'src/employees/entities/employee.entity';

@Module({
  imports: [
    TypeOrmModule.forFeature([
      Reciept,
      RecieptDetail,
      Product,
      Store,
      Customer,
      Employee,
    ]),
  ],
  controllers: [RecieptsController],
  providers: [RecieptsService],
})
export class RecieptsModule {}
