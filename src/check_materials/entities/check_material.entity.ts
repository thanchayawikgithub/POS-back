import { CheckMaterialDetial } from 'src/check_material_detials/entities/check_material_detial.entity';
import { Employee } from 'src/employees/entities/employee.entity';
import {
  CreateDateColumn,
  DeleteDateColumn,
  Entity,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity()
export class CheckMaterial {
  @PrimaryGeneratedColumn()
  check_mat_id: number;

  @CreateDateColumn()
  check_mat_date: Date;

  @CreateDateColumn()
  check_mat_time: Date;

  @ManyToOne(() => Employee, (employee) => employee.checkmaterials)
  employee: Employee;

  @DeleteDateColumn()
  deleteAt: Date;

  @OneToMany(
    () => CheckMaterialDetial,
    (checkMaterialDetail) => checkMaterialDetail.checkMaterial,
  )
  checkMaterialDetails: CheckMaterialDetial[];
}
