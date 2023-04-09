import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Like, Repository } from 'typeorm';
import { CreateCustomerDto } from './dto/create-customer.dto';
import { UpdateCustomerDto } from './dto/update-customer.dto';
import { Customer } from './entities/customer.entity';

@Injectable()
export class CustomersService {
  constructor(
    @InjectRepository(Customer)
    private customersRepository: Repository<Customer>,
  ) {}

  create(createCustomerDto: CreateCustomerDto) {
    return this.customersRepository.save(createCustomerDto);
  }

  async findAll(query): Promise<Paginate> {
    const page = query.page || 1;
    const take = query.take || 10;
    const skip = (page - 1) * take;
    const keyword = query.keyword || '';
    const orderBy = query.orderBy || 'customer_name';
    const order = query.order || 'ASC';
    const currentPage = page;

    const [result, total] = await this.customersRepository.findAndCount({
      relations: ['reciepts'],
      where: { customer_name: Like(`${keyword}%`) },
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
    return this.customersRepository.findOne({
      where: { customer_id: id },
      relations: ['reciepts'],
    });
  }

  findOneByTel(tel: string) {
    return this.customersRepository.findOne({ where: { customer_tel: tel } });
  }

  async update(id: number, updateCustomerDto: UpdateCustomerDto) {
    const customer = await this.customersRepository.findOneBy({
      customer_id: id,
    });
    if (!customer) {
      throw new NotFoundException();
    }
    const updatedCustomer = { ...customer, ...updateCustomerDto };
    return this.customersRepository.save(updatedCustomer);
  }

  async remove(id: number) {
    const customer = await this.customersRepository.findOneBy({
      customer_id: id,
    });
    if (!customer) {
      throw new NotFoundException();
    }
    return this.customersRepository.softRemove(customer);
  }
}
