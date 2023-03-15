import { CheckMaterialDetial } from 'src/check_material_detials/entities/check_material_detial.entity';
import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';

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

  @OneToMany(
    () => CheckMaterialDetial,
    (checkmaterialdetail) => checkmaterialdetail.checkmaterial,
  )
  checkmaterialdetails: CheckMaterialDetial[];
}
