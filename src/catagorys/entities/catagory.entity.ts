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
  catagory_id: number;

  @Column()
  catagory_name: string;

  @CreateDateColumn()
  catagory_createdAt: Date;

  @UpdateDateColumn()
  catagory_updatedAt: Date;

  @DeleteDateColumn()
  catagory_deletedAt: Date;
}
