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

  async findAll(query): Promise<Paginate> {
    const page = query.page || 1;
    const take = query.take || 10;
    const skip = (page - 1) * take;
    const keyword = query.keyword || '';
    const orderBy = query.orderBy || 'mat_name';
    const order = query.order || 'ASC';
    const currentPage = page;

    const [result, total] = await this.materialsRepository.findAndCount({
      where: { mat_name: Like(`${keyword}%`) },
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
