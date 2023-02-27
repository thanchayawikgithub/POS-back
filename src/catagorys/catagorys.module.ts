import { Module } from '@nestjs/common';
import { CatagorysService } from './catagorys.service';
import { CatagorysController } from './catagorys.controller';
import { Catagory } from './entities/catagory.entity';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [TypeOrmModule.forFeature([Catagory])],
  controllers: [CatagorysController],
  providers: [CatagorysService],
})
export class CatagorysModule {}
