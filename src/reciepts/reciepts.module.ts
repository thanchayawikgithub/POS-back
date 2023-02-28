import { Module } from '@nestjs/common';
import { RecieptsService } from './reciepts.service';
import { RecieptsController } from './reciepts.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Reciept } from './entities/reciept.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Reciept])],
  controllers: [RecieptsController],
  providers: [RecieptsService],
})
export class RecieptsModule {}
