import { Bill } from 'src/bill/entities/bill.entity';
import { Material } from 'src/materials/entities/material.entity';
import { Column, Entity, PrimaryGeneratedColumn, ManyToOne } from 'typeorm';

@Entity()
export class BillDetail {
  @PrimaryGeneratedColumn()
  bill_detail_id: number;

  @Column()
  bill_detail_name: string;

  @Column()
  bill_detail_amount: number;

  @Column()
  bill_detail_price: number;

  @Column()
  bill_detail_total: number;

  @ManyToOne(() => Material, (material) => material.bill_detail)
  materials: Material;

  @ManyToOne(() => Bill, (bill) => bill.bill_details)
  bill: Bill;
}
