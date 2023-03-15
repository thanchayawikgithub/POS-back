import { Module } from '@nestjs/common';
import { CheckMaterialsService } from './check_materials.service';
import { CheckMaterialsController } from './check_materials.controller';
import { CheckMaterial } from './entities/check_material.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Employee } from 'src/employees/entities/employee.entity';

@Module({
  imports: [TypeOrmModule.forFeature([CheckMaterial, Employee])],
  controllers: [CheckMaterialsController],
  providers: [CheckMaterialsService],
})
export class CheckMaterialsModule {}
