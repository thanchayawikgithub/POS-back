import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Customer } from 'src/customers/entities/customer.entity';
import { Employee } from 'src/employees/entities/employee.entity';
import { Product } from 'src/products/entities/product.entity';
import { RecieptDetail } from 'src/reciept_details/entities/reciept_detail.entity';
import { Store } from 'src/stores/entities/store.entity';
import { MoreThan, Repository } from 'typeorm';
import { CreateRecieptDto } from './dto/create-reciept.dto';
import { UpdateRecieptDto } from './dto/update-reciept.dto';
import { Reciept } from './entities/reciept.entity';

@Injectable()
export class RecieptsService {
  constructor(
    @InjectRepository(Reciept) private recieptRepository: Repository<Reciept>,
    @InjectRepository(RecieptDetail)
    private recieptDetailRepository: Repository<RecieptDetail>,
    @InjectRepository(Product)
    private productRepository: Repository<Product>,
    @InjectRepository(Store)
    private storeRepository: Repository<Store>,
    @InjectRepository(Customer)
    private customerRepository: Repository<Customer>,
    @InjectRepository(Employee)
    private employeeRepository: Repository<Employee>,
  ) {}
  async create(createRecieptDto: CreateRecieptDto) {
    const store = await this.storeRepository.findOneBy({
      store_id: createRecieptDto.storeId,
    });
    const customer = await this.customerRepository.findOneBy({
      customer_id: createRecieptDto.customerId,
    });
    const employee = await this.employeeRepository.findOneBy({
      employee_id: createRecieptDto.employeeId,
    });
    const reciept: Reciept = new Reciept();
    reciept.rec_queue = createRecieptDto.rec_queue;
    reciept.rec_time = createRecieptDto.rec_time;
    reciept.rec_discount = createRecieptDto.rec_discount;
    reciept.rec_payment = createRecieptDto.rec_payment;

    reciept.rec_total = createRecieptDto.rec_total;
    reciept.rec_received = createRecieptDto.rec_received;
    reciept.rec_changed = createRecieptDto.rec_changed;
    reciept.store = store;
    reciept.customer = customer;
    reciept.employee = employee;

    await this.recieptRepository.save(reciept);
    for (const rec of createRecieptDto.recieptDetails) {
      const recieptDetail = new RecieptDetail();
      recieptDetail.rcd_amount = rec.rcd_amount;
      recieptDetail.products = await this.productRepository.findOneBy({
        product_id: rec.productId,
      });
      recieptDetail.rcd_name = rec.rcd_name;
      recieptDetail.rcd_price = rec.rcd_price;
      recieptDetail.rcd_total = rec.rcd_price * rec.rcd_amount;
      recieptDetail.reciepts = reciept;

      //increase point by amount
      if (customer) {
        customer.customer_point += recieptDetail.rcd_amount;
        await this.customerRepository.save(customer);
      }
      await this.recieptDetailRepository.save(recieptDetail);
    }
    await this.recieptRepository.save(reciept);
    //save customer
    // await this.customerRepository.save(customer);
    return await this.recieptRepository.findOne({
      where: { rec_id: reciept.rec_id },
      relations: ['recieptDetail', 'customer', 'employee', 'store'],
    });
  }

  findAll() {
    return this.recieptRepository.find({
      relations: ['recieptDetail', 'customer', 'employee', 'store'],
    });
  }

  async findLast() {
    const lastRecord = await this.recieptRepository.findOne({
      order: { rec_id: 'DESC' },
      where: { rec_id: MoreThan(0) }, // this will select the record with the highest rec_id
      relations: ['recieptDetail', 'customer', 'employee', 'store'],
    });
    return lastRecord;
  }

  findOne(id: number) {
    return this.recieptRepository.findOne({
      where: { rec_id: id },
      relations: ['recieptDetail', 'customer', 'employee', 'store'],
    });
  }

  async update(id: number, updateRecieptDto: UpdateRecieptDto) {
    const reciept = await this.recieptRepository.findOneBy({ rec_id: id });
    if (!reciept) {
      throw new NotFoundException();
    }
    const updateReciept = { ...reciept, ...updateRecieptDto };
    return this.recieptRepository.save(updateReciept);
  }
  async remove(id: number) {
    const reciept = await this.recieptRepository.findOneBy({ rec_id: id });
    if (!reciept) {
      throw new NotFoundException();
    }
    return this.recieptRepository.softRemove(reciept);
  }
}
