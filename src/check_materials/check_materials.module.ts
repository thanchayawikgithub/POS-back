import { Module } from '@nestjs/common';
import { CheckMaterialsService } from './check_materials.service';
import { CheckMaterialsController } from './check_materials.controller';
import { CheckMaterial } from './entities/check_material.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Employee } from 'src/employees/entities/employee.entity';
import { Material } from 'src/materials/entities/material.entity';
import { CheckMaterialDetial } from 'src/check_material_detials/entities/check_material_detial.entity';

@Module({
  imports: [
    TypeOrmModule.forFeature([
      CheckMaterial,
      Employee,
      Material,
      CheckMaterialDetial,
    ]),
  ],
  controllers: [CheckMaterialsController],
  providers: [CheckMaterialsService],
})
export class CheckMaterialsModule {}
