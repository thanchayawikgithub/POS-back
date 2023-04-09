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
      employee_id: createBillDto.employeeId,
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
        mat_id: bills.materialId,
      });
      billDetail.bill_detail_name = billDetail.materials.mat_name;
      billDetail.bill_detail_price = billDetail.materials.mat_price_per_unit;
      billDetail.bill_detail_total =
        billDetail.materials.mat_price_per_unit * billDetail.bill_detail_amount;
      billDetail.bill = bill;
      await this.billDetailRepository.save(billDetail);

      const material = billDetail.materials;
      material.mat_quantity += bills.bill_detail_amount;
      await this.materialRepository.save(material);
    }
    await this.billRepository.save(bill);
    return await this.billRepository.findOne({
      where: { bill_id: bill.bill_id },
      relations: ['employee', 'bill_details'],
    });
  }

  async findAll(query): Promise<Paginate> {
    const page = query.page || 1;
    const take = query.take || 10;
    const skip = (page - 1) * take;
    const keyword = query.keyword || '';
    const orderBy = query.orderBy || 'bill_shop_name';
    const order = query.order || 'ASC';
    const currentPage = page;

    const [result, total] = await this.billRepository.findAndCount({
      relations: ['bill_details', 'employee'],
      order: { [orderBy]: order },
      take: take,
      skip: skip,
    });

    const lastPage = Math.ceil(total / take);
    return {
      data: result,
      count: total,
      currentPage: currentPage,
      lastPage: lastPage,
    };
  }

  findOne(id: number) {
    return this.billRepository.findOne({
      where: { bill_id: id },
      relations: ['employee', 'bill_details'],
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
