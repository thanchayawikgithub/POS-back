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

  @Column()
  cio_total_hour: number;

  @Column()
  status: string;

  @UpdateDateColumn({ type: 'timestamp' })
  updatedDate: Date;

  @DeleteDateColumn({ type: 'timestamp' })
  deletedDate: Date;

  @ManyToOne(() => Employee, (employee) => employee.checkinouts)
  employee: Employee;

  @ManyToOne(() => Salary, (salary) => salary.checkinouts)
  salary: Salary;
}
