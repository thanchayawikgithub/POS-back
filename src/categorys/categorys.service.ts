import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateCategoryDto } from './dto/create-category.dto';
import { UpdateCategoryDto } from './dto/update-category.dto';
import { Category } from './entities/category.entity';

@Injectable()
export class CategorysService {
  constructor(
    @InjectRepository(Category)
    private categoryRepository: Repository<Category>,
  ) {}
  create(createCategoryDto: CreateCategoryDto) {
    return this.categoryRepository.save(createCategoryDto);
  }

  findAll() {
    return this.categoryRepository.find({ relations: ['products'] });
  }

  findOne(id: number) {
    return this.categoryRepository.findOne({
      where: { category_id: id },
      relations: ['products'],
    });
  }

  async update(id: number, updateCategoryDto: UpdateCategoryDto) {
    const Category = await this.categoryRepository.findOneBy({
      category_id: id,
    });
    if (!Category) {
      throw new NotFoundException();
    }
    const updateCategory = {
      ...Category,
      ...updateCategoryDto,
    };
    return this.categoryRepository.save(updateCategory);
  }

  async remove(id: number) {
    const Category = await this.categoryRepository.findOneBy({
      category_id: id,
    });
    if (!Category) {
      throw new NotFoundException();
    }
    return this.categoryRepository.softRemove(Category);
  }
}
