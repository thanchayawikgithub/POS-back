import { Employee } from 'src/employees/entities/employee.entity';
import { Salary } from 'src/salaries/entities/salary.entity';
import {
  Column,
  CreateDateColumn,
  DeleteDateColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';

export class CheckInOut {
  @PrimaryGeneratedColumn()
  cio_id: number;

  @CreateDateColumn()
  cio_date: Date;

  @Column()
  cio_time_in: number;

  @Column()
  cio_time_out: number;

  @Column()
  cio_total_hour: number;

  @UpdateDateColumn()
  updatedDate: Date;

  @DeleteDateColumn()
  deletedDate: Date;

  @ManyToOne(() => Employee, (employee) => employee.checkinouts)
  employee: Employee;

  @ManyToOne(() => Salary, (salary) => salary.checkinouts)
  salary: Salary;
}
