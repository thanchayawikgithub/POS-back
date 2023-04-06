import { check } from 'prettier';
import { Employee } from 'src/employees/entities/employee.entity';
import { Salary } from 'src/salaries/entities/salary.entity';
import {
  Column,
  CreateDateColumn,
  DeleteDateColumn,
  Entity,
  ManyToOne,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity()
export class CheckInOut {
  @PrimaryGeneratedColumn()
  cio_id: number;

  @CreateDateColumn({ type: 'timestamp' })
  cio_date: Date;

  @CreateDateColumn({ type: 'timestamp' })
  cio_time_in: Date;

  @Column({ default: 0 })
  cio_total_hour: number;

  @Column({ default: 'checked in' })
  status: string;

  @Column({ type: 'timestamp', default: null })
  cio_time_out: Date;

  @UpdateDateColumn({ type: 'timestamp' })
  updatedDate: Date;

  @DeleteDateColumn({ type: 'timestamp' })
  deletedDate: Date;

  @Column()
  EmployeeId: number;

  @ManyToOne(() => Employee, (employee) => employee.checkinouts)
  employee: Employee;

  @ManyToOne(() => Salary, (salary) => salary.checkinouts)
  salary: Salary;
}
