import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

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
  @Column()
  cmd_qty_expire: Date;
}
