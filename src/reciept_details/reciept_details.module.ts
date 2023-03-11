import { Module } from '@nestjs/common';
import { RecieptDetailsService } from './reciept_details.service';
import { RecieptDetailsController } from './reciept_details.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { RecieptDetail } from './entities/reciept_detail.entity';
import { Product } from 'src/products/entities/product.entity';
import { Reciept } from 'src/reciepts/entities/reciept.entity';

@Module({
  imports: [TypeOrmModule.forFeature([RecieptDetail, Product, Reciept])],
  controllers: [RecieptDetailsController],
  providers: [RecieptDetailsService],
})
export class RecieptDetailsModule {}
