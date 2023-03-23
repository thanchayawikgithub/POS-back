import { Bill } from 'src/bill/entities/bill.entity';
import { CheckInOut } from 'src/check_in_outs/entities/check_in_out.entity';
import { CheckMaterial } from 'src/check_materials/entities/check_material.entity';
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
export class Employee {
  @PrimaryGeneratedColumn()
  employee_id: number;

  @Column()
  employee_name: string;

  @Column()
  employee_login: string;

  @Column()
  employee_password: string;

  @Column()
  employee_province: string;

  @Column()
  employee_district: string;

  @Column()
  employee_subdistrict: string;

  @Column()
  employee_tel: string;

  @Column()
  employee_email: string;

  @Column()
  employee_position: string;

  @Column()
  employee_hourly_wage: number;

  @CreateDateColumn({ type: 'timestamp' })
  createdAt: Date;

  @UpdateDateColumn({ type: 'timestamp' })
  updatedAt: Date;

  @DeleteDateColumn({ type: 'timestamp' })
  deletedAt: Date;

  @OneToMany(() => Reciept, (reciept) => reciept.employee)
  reciepts: Reciept[];

  @OneToMany(() => CheckMaterial, (checkmaterial) => checkmaterial.employee)
  checkmaterials: CheckMaterial[];

  // @OneToMany(() => CheckInOut, (checkinout) => checkinout.employee)
  // checkinouts: CheckInOut[];

  @OneToMany(() => Bill, (bill) => bill.employee)
  bill: Bill[];
}
