import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CheckMaterialDetial } from 'src/check_material_detials/entities/check_material_detial.entity';

import { Employee } from 'src/employees/entities/employee.entity';
import { Material } from 'src/materials/entities/material.entity';
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
    @InjectRepository(Material)
    private materialRepository: Repository<Material>,
    @InjectRepository(CheckMaterialDetial)
    private checkMaterialDetial: Repository<CheckMaterialDetial>,
  ) {}
  async create(createCheckMaterialDto: CreateCheckMaterialDto) {
    const employee = await this.employeeRepository.findOneBy({
      employee_id: createCheckMaterialDto.EmployeeId,
    });
    const check_material: CheckMaterial = new CheckMaterial();
    check_material.employee = employee;
    await this.checkMaterialRepository.save(check_material);
    for (const check_mat of createCheckMaterialDto.checkMaterialDetails) {
      const checkMaterialDetail = new CheckMaterialDetial();
      checkMaterialDetail.material = await this.materialRepository.findOneBy({
        mat_id: check_mat.MaterialId,
      });
      checkMaterialDetail.cmd_name = checkMaterialDetail.material.mat_name;
      checkMaterialDetail.cmd_qty_last =
        checkMaterialDetail.material.mat_quantity;
      checkMaterialDetail.cmd_qty_remain = check_mat.cmd_qty_remain;
      checkMaterialDetail.cmd_qty_expire = check_mat.cmd_qty_expire;

      checkMaterialDetail.material.mat_quantity = check_mat.cmd_qty_remain;
      await this.materialRepository.save(checkMaterialDetail.material);

      checkMaterialDetail.checkMaterial = check_material;
      await this.checkMaterialDetial.save(checkMaterialDetail);
    }
    await this.checkMaterialRepository.save(check_material);
    return await this.checkMaterialRepository.findOne({
      where: { check_mat_id: check_material.check_mat_id },
      relations: ['checkMaterialDetails'],
    });
  }

  findAll() {
    return this.checkMaterialRepository.find({
      relations: ['employee', 'checkMaterialDetails'],
    });
  }

  findOne(id: number) {
    return this.checkMaterialRepository.findOne({
      where: { check_mat_id: id },
      relations: ['employee', 'checkMaterialDetails'],
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
