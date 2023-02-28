import { Module } from '@nestjs/common';
import { RecieptDetailsService } from './reciept_details.service';
import { RecieptDetailsController } from './reciept_details.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { RecieptDetail } from './entities/reciept_detail.entity';

@Module({
  imports: [TypeOrmModule.forFeature([RecieptDetail])],
  controllers: [RecieptDetailsController],
  providers: [RecieptDetailsService],
})
export class RecieptDetailsModule {}
