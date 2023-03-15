import { Module } from '@nestjs/common';
import { CheckMaterialDetialsService } from './check_material_detials.service';
import { CheckMaterialDetialsController } from './check_material_detials.controller';
import { CheckMaterialDetial } from './entities/check_material_detial.entity';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [TypeOrmModule.forFeature([CheckMaterialDetial])],
  controllers: [CheckMaterialDetialsController],
  providers: [CheckMaterialDetialsService],
})
export class CheckMaterialDetialsModule {}
