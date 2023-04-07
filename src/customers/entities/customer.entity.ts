import { Reciept } from 'src/reciepts/entities/reciept.entity';
import {
  Column,
  CreateDateColumn,
  DeleteDateColumn,
  Entity,
  OneToMany,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity()
export class Customer {
  @PrimaryGeneratedColumn()
  customer_id: number;

  @Column()
  customer_name: string;

  @Column()
  customer_tel: string;

  @Column({ default: 0 })
  customer_point: number;

  @CreateDateColumn({ type: 'timestamp' })
  createdDate: Date;

  @UpdateDateColumn({ type: 'timestamp' })
  updatedDate: Date;

  @DeleteDateColumn({ type: 'timestamp' })
  deletedDate: Date;

  @OneToMany(() => Reciept, (reciept) => reciept.customer)
  reciepts: Reciept[];
}
