import { Injectable } from '@nestjs/common';
import { CreateCheckInOutDto } from './dto/create-check_in_out.dto';
import { UpdateCheckInOutDto } from './dto/update-check_in_out.dto';
import { CheckInOut } from './entities/check_in_out.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Employee } from 'src/employees/entities/employee.entity';

@Injectable()
export class CheckInOutsService {
  constructor(
    @InjectRepository(CheckInOut)
    private checkInOutRepository: Repository<CheckInOut>,
    @InjectRepository(Employee)
    private employeeRepository: Repository<Employee>,
  ) {}
  async create(user: { employee_id: number }) {
    const check_in_out: CheckInOut = new CheckInOut();
    const employee = await this.employeeRepository.findOneBy({
      employee_id: user.employee_id,
    });
    check_in_out.EmployeeId = employee.employee_id;
    check_in_out.employee = employee;

    await this.checkInOutRepository.save(check_in_out);
    return this.checkInOutRepository.findOne({
      where: { cio_id: check_in_out.cio_id },
      relations: ['employee'],
    });
  }

  findAll() {
    return this.checkInOutRepository.find({
      relations: ['employee'],
    });
  }

  findOne(id: number) {
    return `This action returns a #${id} checkInOut`;
  }

  update(id: number, updateCheckInOutDto: UpdateCheckInOutDto) {
    return `This action updates a #${id} checkInOut`;
  }

  remove(id: number) {
    return `This action removes a #${id} checkInOut`;
  }
}
