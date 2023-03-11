import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { User } from 'src/users/entities/user.entity';
import { Repository } from 'typeorm';
import { CreateEmployeeDto } from './dto/create-employee.dto';
import { UpdateEmployeeDto } from './dto/update-employee.dto';
import { Employee } from './entities/employee.entity';

@Injectable()
export class EmployeesService {
  constructor(
    @InjectRepository(Employee)
    private employeesRepository: Repository<Employee>,
    @InjectRepository(User)
    private userRepository: Repository<User>,
  ) {}

  async create(createEmployeeDto: CreateEmployeeDto) {
    const user = await this.userRepository.findOneBy({
      user_id: createEmployeeDto.userId,
    });
    const employee: Employee = new Employee();
    employee.user = user;
    employee.employee_name = createEmployeeDto.employee_name;
    employee.employee_province = createEmployeeDto.employee_province;
    employee.employee_district = createEmployeeDto.employee_district;
    employee.employee_subdistrict = createEmployeeDto.employee_subdistrict;
    employee.employee_tel = createEmployeeDto.employee_tel;
    employee.employee_email = createEmployeeDto.employee_email;
    employee.employee_position = createEmployeeDto.employee_position;
    employee.employee_hourly_wage = createEmployeeDto.employee_hourly_wage;
    await this.employeesRepository.save(employee);
    return await this.employeesRepository.findOne({
      where: { employee_id: employee.employee_id },
      relations: ['user', 'reciepts'],
    });
  }

  findAll() {
    return this.employeesRepository.find({ relations: ['user'] });
  }

  async findOne(id: number) {
    const employee = await this.employeesRepository.findOne({
      where: { employee_id: id },
      relations: ['user'],
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
