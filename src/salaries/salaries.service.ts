import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { IsNull, Repository } from 'typeorm';

import { UpdateSalaryDto } from './dto/update-salary.dto';
import { Salary } from './entities/salary.entity';
import { CheckInOut } from 'src/check_in_outs/entities/check_in_out.entity';
import { Employee } from 'src/employees/entities/employee.entity';

@Injectable()
export class SalariesService {
  constructor(
    @InjectRepository(Salary)
    private salariesRepository: Repository<Salary>,
    @InjectRepository(CheckInOut)
    private checkInOutRepository: Repository<CheckInOut>,
    @InjectRepository(Employee)
    private employeeRepository: Repository<Employee>,
  ) {}

  async create(id: number) {
    const employee = await this.employeeRepository.findOne({
      where: { employee_id: id },
      relations: ['salaries'],
    });
    const check_in_outs = await this.checkInOutRepository.find({
      where: {
        SalaryId: IsNull(),
        EmployeeId: employee.employee_id,
        status: 'checked out',
      },
    });
    console.log(check_in_outs);
    if (check_in_outs.length === 0) {
      throw new NotFoundException();
    }
    const totalHours = await this.checkInOutRepository
      .createQueryBuilder()
      .select('SUM(cio_total_hour)', 'total')
      .where(
        'EmployeeId = :employeeId AND SalaryId IS NULL AND status = :status',
        {
          employeeId: employee.employee_id,
          status: 'checked out',
        },
      )
      .getRawOne();

    const hourlyWage = employee.employee_hourly_wage;
    const totalWage = hourlyWage * totalHours.total || 0;

    const salary: Salary = new Salary();
    salary.EmployeeId = employee.employee_id;
    salary.ss_work_hour = totalHours.total || 0;
    salary.ss_salary = totalWage;
    salary.checkinouts = check_in_outs;

    const savedSalary = await this.salariesRepository.save(salary);
    for (const check_in_out of check_in_outs) {
      check_in_out.SalaryId = savedSalary.ss_id;
      await this.checkInOutRepository.save(check_in_out);
    }
    employee.salaries.push(salary);
    await this.employeeRepository.save(employee);
    return savedSalary;
  }

  findAll() {
    return this.salariesRepository.find({ relations: ['employee'] });
  }

  findOne(id: number) {
    return this.salariesRepository.findOneBy({ ss_id: id });
  }

  async update(id: number, updateSalaryDto: UpdateSalaryDto) {
    const salary = await this.salariesRepository.findOneBy({ ss_id: id });
    if (!salary) {
      throw new NotFoundException();
    }
    const updatedSalary = { ...salary, ...updateSalaryDto };
    return this.salariesRepository.save(updatedSalary);
  }

  async remove(id: number) {
    const salary = await this.salariesRepository.findOneBy({ ss_id: id });
    if (!salary) {
      throw new NotFoundException();
    }
    return this.salariesRepository.softRemove(salary);
  }
}
