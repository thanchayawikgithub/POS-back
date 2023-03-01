import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateEmployeeDto } from './dto/create-employee.dto';
import { UpdateEmployeeDto } from './dto/update-employee.dto';
import { Employee } from './entities/employee.entity';

@Injectable()
export class EmployeesService {
  constructor(
    @InjectRepository(Employee)
    private employeesRepository: Repository<Employee>,
  ) {}

  create(createEmployeeDto: CreateEmployeeDto) {
    return this.employeesRepository.save(createEmployeeDto);
  }

  findAll() {
    return this.employeesRepository.find({});
  }

  async findOne(id: number) {
    const employee = await this.employeesRepository.findOne({
      where: { employee_id: id },
    });
    if (!employee) {
      throw new NotFoundException();
    }

    return employee;
  }

  async update(id: number, updateEmployeeDto: UpdateEmployeeDto) {
    const employee = await this.employeesRepository.findOne({
      where: { employee_id: id },
    });
    if (!employee) {
      throw new NotFoundException();
    }
    const updatedEmployee = { ...employee, ...updateEmployeeDto };
    return this.employeesRepository.save(updatedEmployee);
  }

  async remove(id: number) {
    const employee = await this.employeesRepository.findOne({
      where: { employee_id: id },
    });
    if (!employee) {
      throw new NotFoundException();
    }
    return this.employeesRepository.softRemove(employee);
  }
}
