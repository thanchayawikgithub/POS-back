import { CheckMaterial } from 'src/check_materials/entities/check_material.entity';
import { Material } from 'src/materials/entities/material.entity';
import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class CheckMaterialDetial {
  @PrimaryGeneratedColumn()
  cmd_id: number;
  @Column()
  cmd_name: string;
  @Column()
  cmd_qty_last: number;
  @Column()
  cmd_qty_remain: number;
  @Column({ default: 0 })
  cmd_qty_expire: number;

  @ManyToOne(
    () => CheckMaterial,
    (checkMaterial) => checkMaterial.checkMaterialDetails,
  )
  checkMaterial: CheckMaterial;

  @ManyToOne(() => Material, (material) => material.checkMaterialDetails)
  material: Material;
}
