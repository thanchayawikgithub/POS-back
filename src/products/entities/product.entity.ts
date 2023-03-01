import { Category } from 'src/categorys/entities/category.entity';
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

  @Column({
    length: '128',
    default: 'no_img_avaliable.jpg',
  })
  product_image: string;

  @CreateDateColumn()
  product_createdAt: Date;

  @UpdateDateColumn()
  product_updatedAt: Date;

  @DeleteDateColumn()
  product_deletedAt: Date;

  @ManyToOne(() => Category, (category) => category.products)
  category: Category;
}
