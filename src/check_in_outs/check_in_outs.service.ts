import {
  Injectable,
  NotFoundException,
  UnauthorizedException,
} from '@nestjs/common';
import { CreateCheckInOutDto } from './dto/create-check_in_out.dto';
import { UpdateCheckInOutDto } from './dto/update-check_in_out.dto';
import { CheckInOut } from './entities/check_in_out.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { IsNull, Repository } from 'typeorm';
import { Employee } from 'src/employees/entities/employee.entity';
import { now } from 'moment';
import { Salary } from 'src/salaries/entities/salary.entity';

@Injectable()
export class CheckInOutsService {
  constructor(
    @InjectRepository(CheckInOut)
    private checkInOutRepository: Repository<CheckInOut>,
    @InjectRepository(Employee)
    private employeeRepository: Repository<Employee>,
    @InjectRepository(Salary)
    private salaryRepository: Repository<Salary>,
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

  async findAll(query): Promise<Paginate> {
    const page = query.page || 1;
    const take = query.take || 10;
    const skip = (page - 1) * take;
    const keyword = query.keyword || '';
    const orderBy = query.orderBy || 'cio_date';
    const order = query.order || 'DESC';
    const currentPage = page;
    const [result, total] = await this.checkInOutRepository.findAndCount({
      relations: ['employee'],
      where: { status: 'checked out' },
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
    return this.checkInOutRepository.findOne({
      where: { cio_id: id },
      relations: ['employee'],
    });
  }

  findByEmpId(id: number) {
    return this.checkInOutRepository.find({
      where: { EmployeeId: id, status: 'checked out', SalaryId: IsNull() },
      relations: ['employee'],
    });
  }

  async update(id: number, user: { employee_id: number }) {
    const employee = await this.employeeRepository.findOneBy({
      employee_id: user.employee_id,
    });
    const check_in_out = await this.checkInOutRepository.findOneBy({
      cio_id: id,
    });
    if (!check_in_out) {
      throw new NotFoundException();
    } else if (check_in_out.EmployeeId !== employee.employee_id) {
      throw new UnauthorizedException();
    }
    check_in_out.cio_time_out = new Date('2023-04-09T11:41:09.524Z');
    check_in_out.status = 'checked out';

    //calculate the difference in hours between createdAt and cio_time_out timestamps
    const totalHour = Math.abs(
      (check_in_out.cio_time_out.getTime() -
        check_in_out.cio_time_in.getTime()) /
        3600000,
    );

    check_in_out.cio_total_hour = totalHour;
    // const diffMillis =
    //   check_in_out.cio_time_out.getTime() - check_in_out.cio_time_in.getTime();
    // const diffHours = diffMillis / (1000 * 60 * 60);
    // check_in_out.cio_total_hour = diffHours;

    await this.checkInOutRepository.save(check_in_out);

    return this.checkInOutRepository.findOne({
      where: { cio_id: check_in_out.cio_id },
      relations: ['employee'],
    });
  }

  async remove(id: number) {
    const check_in_out = await this.checkInOutRepository.findOneBy({
      cio_id: id,
    });
    if (!check_in_out) {
      throw new NotFoundException();
    }
    return this.checkInOutRepository.softRemove(check_in_out);
  }
}
