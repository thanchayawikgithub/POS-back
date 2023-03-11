import { RecieptDetail } from 'src/reciept_details/entities/reciept_detail.entity';
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
}
