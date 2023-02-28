import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Material {
  @PrimaryGeneratedColumn()
  mat_id: number;

  @Column()
  mat_name: string;

  @Column()
  mat_min_quantity: number;

  @Column()
  mat_quantity: number;

  @Column()
  mat_unit: number;

  @Column()
  mat_price_per_unit: number;
}
