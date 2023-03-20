import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { BillDetail } from 'src/bill_details/entities/bill_detail.entity';
import { Employee } from 'src/employees/entities/employee.entity';
import { Material } from 'src/materials/entities/material.entity';
import { Repository } from 'typeorm';
import { CreateBillDto } from './dto/create-bill.dto';
import { UpdateBillDto } from './dto/update-bill.dto';
import { Bill } from './entities/bill.entity';

@Injectable()
export class BillService {
  constructor(
    @InjectRepository(Bill)
    private billRepository: Repository<Bill>,
    @InjectRepository(Employee)
    private employeeRepository: Repository<Employee>,
    @InjectRepository(BillDetail)
    private billDetailRepository: Repository<BillDetail>,
    @InjectRepository(Material)
    private materialRepository: Repository<Material>,
  ) {}
  async create(createBillDto: CreateBillDto) {
    const employee = await this.employeeRepository.findOneBy({
      employee_id: createBillDto.employee_id,
    });
    const bill: Bill = new Bill();
    bill.bill_shop_name = createBillDto.bill_shop_name;
    bill.bill_total = createBillDto.bill_total;
    bill.bill_buy = createBillDto.bill_buy;
    bill.bill_change = createBillDto.bill_change;
    bill.employee = employee;
    await this.billRepository.save(bill);
    for (const bills of createBillDto.billDetails) {
      const billDetail = new BillDetail();
      billDetail.bill_detail_amount = bills.bill_detail_amount;
      billDetail.materials = await this.materialRepository.findOneBy({
        mat_id: bills.mat_id,
      });
      billDetail.bill_detail_name = billDetail.materials.mat_name;
      billDetail.bill_detail_price = billDetail.materials.mat_price_per_unit;
      billDetail.bill_detail_total =
        billDetail.materials.mat_price_per_unit * billDetail.bill_detail_amount;
      billDetail.bill = bill;
      await this.billDetailRepository.save(billDetail);
    }
    await this.billRepository.save(bill);
    return await this.billRepository.findOne({
      where: { bill_id: bill.bill_id },
      relations: ['employee', 'bill_details'],
    });
  }

  findAll() {
    return this.billRepository.find({ relations: ['employee'] });
  }

  findOne(id: number) {
    return this.billRepository.findOne({
      where: { bill_id: id },
      relations: ['employee'],
    });
  }

  async update(id: number, updateBillDto: UpdateBillDto) {
    const bill = await this.billRepository.findOneBy({
      bill_id: id,
    });
    if (!bill) {
      throw new NotFoundException();
    }
    const updateBill = {
      ...bill,
      ...updateBillDto,
    };
    return this.billRepository.save(updateBill);
  }

  async remove(id: number) {
    const bill = await this.billRepository.findOneBy({
      bill_id: id,
    });
    if (!bill) {
      throw new NotFoundException();
    }
    return this.billRepository.softRemove(bill);
  }
}
