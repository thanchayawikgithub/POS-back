import { Reciept } from 'src/reciepts/entities/reciept.entity';
import {
  Column,
  CreateDateColumn,
  DeleteDateColumn,
  Entity,
  OneToMany,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity()
export class Store {
  @PrimaryGeneratedColumn()
  store_id: number;

  @Column({ length: 64 })
  store_name: string;

  @Column()
  store_province: string;

  @Column()
  store_district: string;

  @Column()
  store_sub_district: string;

  @Column({ length: 10 })
  store_tel: string;

  @CreateDateColumn()
  createdAt: Date;

  @UpdateDateColumn()
  updatedAt: Date;

  @DeleteDateColumn()
  deletedAt: Date;

  @OneToMany(() => Reciept, (reciept) => reciept.store)
  reciepts: Reciept[];
}
