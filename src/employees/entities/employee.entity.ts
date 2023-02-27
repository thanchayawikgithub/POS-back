import {
  Column,
  CreateDateColumn,
  DeleteDateColumn,
  Entity,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity()
export class Employee {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({
    length: '32',
    unique: true,
  })
  name: string;

  @Column({
    unique: true,
  })
  address: string;

  @Column({
    length: '10',
    unique: true,
  })
  tel: string;

  @Column({
    length: '64',
    unique: true,
  })
  email: string;

  @Column({
    unique: true,
  })
  position: string;

  @Column({
    unique: true,
  })
  hourly_wage: number;

  @CreateDateColumn()
  createdAt: Date;

  @UpdateDateColumn()
  updatedAt: Date;

  @DeleteDateColumn()
  deletedAt: Date;
}
