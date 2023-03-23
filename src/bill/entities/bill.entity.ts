import { BillDetail } from 'src/bill_details/entities/bill_detail.entity';
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

  @CreateDateColumn({ type: 'timestamp' })
  bill_date: Date;

  @CreateDateColumn({ type: 'timestamp' })
  bill_time: Date;

  @Column()
  bill_total: number;

  @Column()
  bill_buy: number;

  @Column()
  bill_change: number;

  @CreateDateColumn({ type: 'timestamp' })
  bill_createdAt: Date;

  @UpdateDateColumn({ type: 'timestamp' })
  bill_updatedAt: Date;

  @DeleteDateColumn({ type: 'timestamp' })
  bill_deletedAt: Date;

  @ManyToOne(() => Employee, (employee) => employee.bill)
  employee: Employee;

  @OneToMany(() => BillDetail, (billDetail) => billDetail.bill)
  bill_details: BillDetail[];
}
