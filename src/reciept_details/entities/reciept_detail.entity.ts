import { Product } from 'src/products/entities/product.entity';
import { Reciept } from 'src/reciepts/entities/reciept.entity';
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

  @ManyToOne(() => Product, (product) => product.recieptDetail)
  products: Product;

  @ManyToOne(() => Reciept, (reciept) => reciept.recieptDetail)
  reciepts: Reciept;
}
