import {
  Column,
  CreateDateColumn,
  DeleteDateColumn,
  Entity,
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
}
