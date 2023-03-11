import { Reciept } from 'src/reciepts/entities/reciept.entity';
import { User } from 'src/users/entities/user.entity';
import {
  Column,
  CreateDateColumn,
  DeleteDateColumn,
  Entity,
  JoinColumn,
  OneToMany,
  OneToOne,
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

  @CreateDateColumn()
  createdAt: Date;

  @UpdateDateColumn()
  updatedAt: Date;

  @DeleteDateColumn()
  deletedAt: Date;

  @OneToOne(() => User)
  @JoinColumn()
  user: User;
  @OneToMany(() => Reciept, (reciept) => reciept.employee)
  reciepts: Reciept[];
}
