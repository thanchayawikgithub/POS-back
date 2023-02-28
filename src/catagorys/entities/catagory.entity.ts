import {
  Column,
  CreateDateColumn,
  DeleteDateColumn,
  Entity,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity()
export class Catagory {
  @PrimaryGeneratedColumn()
  cat_id: number;

  @Column()
  cat_name: string;

  @CreateDateColumn()
  cat_createdAt: Date;

  @UpdateDateColumn()
  cat_updatedAt: Date;

  @DeleteDateColumn()
  cat_deletedAt: Date;
}
