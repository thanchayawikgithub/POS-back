import { Customer } from 'src/customers/entities/customer.entity';
import { Employee } from 'src/employees/entities/employee.entity';
import { RecieptDetail } from 'src/reciept_details/entities/reciept_detail.entity';
import { Store } from 'src/stores/entities/store.entity';
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
export class Reciept {
  @PrimaryGeneratedColumn()
  rec_id: number;
  @Column()
  rec_queue: number;
  @Column()
  rec_time: number;
  @Column()
  rec_discount: number;
  @Column()
  rec_total: number;
  @Column()
  rec_received: number;
  @Column()
  rec_changed: number;
  @Column()
  rec_payment: string;
  @CreateDateColumn()
  createdAt: Date;
  @UpdateDateColumn()
  updatedAt: Date;
  @DeleteDateColumn()
  deletedAt: Date;

  @OneToMany(() => RecieptDetail, (reciept_detail) => reciept_detail.reciepts)
  recieptDetail: RecieptDetail[];

  @ManyToOne(() => Store, (store) => store.reciepts)
  store: Store;
  @ManyToOne(() => Customer, (customer) => customer.reciepts)
  customer: Customer;
  @ManyToOne(() => Employee, (employee) => employee.reciepts)
  employee: Employee;
}
