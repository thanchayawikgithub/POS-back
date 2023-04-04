import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Like, Repository } from 'typeorm';
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

  findByShopName(shopName: string) {
    const searchShopName = shopName || '';
    return this.materialsRepository.find({
      where: {
        mat_shop_name: Like(`${searchShopName}%`),
      },
    });
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

  async remove(id: number) {
    const material = await this.materialsRepository.findOneBy({ mat_id: id });
    if (!material) {
      throw new NotFoundException();
    }
    return this.materialsRepository.remove(material);
  }
}
