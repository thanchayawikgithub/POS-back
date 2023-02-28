import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateMaterialDto } from './dto/create-material.dto';
import { UpdateMaterialDto } from './dto/update-material.dto';
import { Material } from './entities/material.entity';

@Injectable()
export class MaterialsService {
  constructor(
    @InjectRepository(Material)
    private materialsRepository: Repository<Material>,
  ) {}

  create(createMaterialDto: CreateMaterialDto) {
    return this.materialsRepository.save(createMaterialDto);
  }

  findAll() {
    return this.materialsRepository.find();
  }

  findOne(mat_id: number) {
    return this.materialsRepository.findOne({ where: { mat_id: mat_id } });
  }

  async update(mat_id: number, updateMaterialDto: UpdateMaterialDto) {
    try {
      const updatedMaterial = await this.materialsRepository.save({
        mat_id,
        ...updateMaterialDto,
      });
      return updatedMaterial;
    } catch (e) {
      throw new NotFoundException();
    }
  }

  async remove(mat_id: number) {
    const material = await this.materialsRepository.findOne({
      where: { mat_id: mat_id },
    });
    try {
      const deletedMaterial = await this.materialsRepository.remove(material);
      return deletedMaterial;
    } catch (e) {
      throw new NotFoundException();
    }
  }
}