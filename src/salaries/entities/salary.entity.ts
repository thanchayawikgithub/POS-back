import {
  Column,
  CreateDateColumn,
  DeleteDateColumn,
  Entity,
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
}
