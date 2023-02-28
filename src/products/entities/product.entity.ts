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
  pro_id: number;

  @Column({ length: 64 })
  pro_name: string;

  @Column()
  pro_type: string;

  @Column()
  pro_size: string;

  @Column({ type: 'float' })
  pro_price: number;

  @CreateDateColumn()
  pro_createdAt: Date;

  @UpdateDateColumn()
  pro_updatedAt: Date;

  @DeleteDateColumn()
  pro_deletedAt: Date;
}
