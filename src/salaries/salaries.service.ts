import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateSalaryDto } from './dto/create-salary.dto';
import { UpdateSalaryDto } from './dto/update-salary.dto';
import { Salary } from './entities/salary.entity';

@Injectable()
export class SalariesService {
  constructor(
    @InjectRepository(Salary)
    private salariesRepository: Repository<Salary>,
  ) {}

  create(createSalaryDto: CreateSalaryDto) {
    return this.salariesRepository.save(createSalaryDto);
  }

  findAll() {
    return this.salariesRepository.find({});
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
