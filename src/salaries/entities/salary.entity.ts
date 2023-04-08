import { CheckInOut } from 'src/check_in_outs/entities/check_in_out.entity';
import { Employee } from 'src/employees/entities/employee.entity';
import {
  Column,
  CreateDateColumn,
  DeleteDateColumn,
  Entity,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity()
export class Salary {
  @PrimaryGeneratedColumn()
  ss_id: number;

  @CreateDateColumn({ type: 'timestamp' })
  ss_date: Date;

  @Column()
  ss_work_hour: number;

  @Column()
  ss_salary: number;

  @UpdateDateColumn({ type: 'timestamp' })
  updatedDate: Date;

  @DeleteDateColumn({ type: 'timestamp' })
  deletedDate: Date;

  @OneToMany(() => CheckInOut, (checkinout) => checkinout.salary)
  checkinouts: CheckInOut[];

  @ManyToOne(() => Employee, (employee) => employee.salaries)
  employee: Employee;

  @Column({ default: null })
  EmployeeId: number;
}
