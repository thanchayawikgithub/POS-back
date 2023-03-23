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

  @CreateDateColumn({ type: 'timestamp' })
  cio_date: Date;

  @Column()
  cio_time_in: number;

  @Column()
  cio_time_out: number;

  @Column()
  cio_total_hour: number;

  @UpdateDateColumn({ type: 'timestamp' })
  updatedDate: Date;

  @DeleteDateColumn({ type: 'timestamp' })
  deletedDate: Date;

  // @ManyToOne(() => Employee, (employee) => employee.checkinouts)
  // employee: Employee;

  // @ManyToOne(() => Salary, (salary) => salary.checkinouts)
  // salary: Salary;
}
