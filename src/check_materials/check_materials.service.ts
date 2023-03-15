import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Employee } from 'src/employees/entities/employee.entity';
import { Repository } from 'typeorm';
import { CreateCheckMaterialDto } from './dto/create-check_material.dto';
import { UpdateCheckMaterialDto } from './dto/update-check_material.dto';
import { CheckMaterial } from './entities/check_material.entity';

@Injectable()
export class CheckMaterialsService {
  constructor(
    @InjectRepository(CheckMaterial)
    private checkMaterialRepository: Repository<CheckMaterial>,
    @InjectRepository(Employee)
    private employeeRepository: Repository<Employee>,
  ) {}
  async create(createCheckMaterialDto: CreateCheckMaterialDto) {
    const employee = await this.employeeRepository.findOneBy({
      employee_id: createCheckMaterialDto.EmployeeId,
    });
    const check_material: CheckMaterial = new CheckMaterial();
    check_material.employee = employee;
    return this.checkMaterialRepository.save(check_material);
  }

  findAll() {
    return this.checkMaterialRepository.find({ relations: ['employee'] });
  }

  findOne(id: number) {
    return this.checkMaterialRepository.findOne({
      where: { check_mat_id: id },
      relations: ['employee'],
    });
  }
  async update(id: number, updateMaterialDto: UpdateCheckMaterialDto) {
    const check_material = await this.checkMaterialRepository.findOneBy({
      check_mat_id: id,
    });
    if (!check_material) {
      throw new NotFoundException();
    }
    const updateMaterial = {
      ...check_material,
      ...updateMaterialDto,
    };
    return this.checkMaterialRepository.save(updateMaterial);
  }

  async remove(id: number) {
    const check_material = await this.checkMaterialRepository.findOneBy({
      check_mat_id: id,
    });
    if (!check_material) {
      throw new NotFoundException();
    }
    return this.checkMaterialRepository.softRemove(check_material);
  }
}
