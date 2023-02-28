import {
  Column,
  CreateDateColumn,
  DeleteDateColumn,
  Entity,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity()
export class RecieptDetail {
  @PrimaryGeneratedColumn()
  rcd_id: number;

  @Column()
  rcd_name: string;

  @Column()
  rcd_amount: number;

  @Column()
  rcd_price: number;

  @Column()
  rcd_total: number;

  @CreateDateColumn()
  createdAt: Date;

  @UpdateDateColumn()
  updatedAt: Date;

  @DeleteDateColumn()
  deletedAt: Date;
}
