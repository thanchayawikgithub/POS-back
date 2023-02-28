import {
  Column,
  CreateDateColumn,
  DeleteDateColumn,
  Entity,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';
@Entity()
export class Product {
  @PrimaryGeneratedColumn()
  product_id: number;

  @Column({ length: 64 })
  product_name: string;

  @Column()
  product_type: string;

  @Column()
  product_size: string;

  @Column({ type: 'float' })
  product_price: number;

  @CreateDateColumn()
  product_createdAt: Date;

  @UpdateDateColumn()
  product_updatedAt: Date;

  @DeleteDateColumn()
  product_deletedAt: Date;
}
