import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Employee } from 'src/employees/entities/employee.entity';
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

    return this.billRepository.save(bill);
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
