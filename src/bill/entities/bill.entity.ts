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
export class Bill {
  @PrimaryGeneratedColumn()
  bill_id: number;

  @Column()
  bill_shop_name: string;

  @CreateDateColumn()
  bill_date: Date;

  @CreateDateColumn()
  bill_time: Date;

  @Column()
  bill_total: number;

  @Column()
  bill_buy: number;

  @Column()
  bill_change: number;

  @CreateDateColumn()
  bill_createdAt: Date;

  @UpdateDateColumn()
  bill_updatedAt: Date;

  @DeleteDateColumn()
  bill_deletedAt: Date;

  @ManyToOne(() => Employee, (employee) => employee.bill)
  employee: Employee;
}
