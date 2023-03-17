import { CheckInOut } from 'src/check_in_outs/entities/check_in_out.entity';
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
export class Salary {
  @PrimaryGeneratedColumn()
  ss_id: number;

  @CreateDateColumn()
  ss_date: Date;

  @Column()
  ss_work_hour: number;

  @Column()
  ss_salary: number;

  @UpdateDateColumn()
  updatedDate: Date;

  @DeleteDateColumn()
  deletedDate: Date;

  // @OneToMany(() => CheckInOut, (checkinout) => checkinout.salary)
  // checkinouts: CheckInOut[];
}
