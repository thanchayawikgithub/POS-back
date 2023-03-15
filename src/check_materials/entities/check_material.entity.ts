import { Employee } from 'src/employees/entities/employee.entity';
import {
  CreateDateColumn,
  DeleteDateColumn,
  Entity,
  ManyToOne,
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
}
