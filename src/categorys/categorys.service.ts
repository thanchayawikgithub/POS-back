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
    private recieptdetailRepository: Repository<Category>,
  ) {}
  create(createCategoryDto: CreateCategoryDto) {
    return this.recieptdetailRepository.save(createCategoryDto);
  }

  findAll() {
    return this.recieptdetailRepository.find();
  }

  findOne(id: number) {
    return this.recieptdetailRepository.findOneBy({ category_id: id });
  }

  async update(id: number, updateCategoryDto: UpdateCategoryDto) {
    const Category = await this.recieptdetailRepository.findOneBy({
      category_id: id,
    });
    if (!Category) {
      throw new NotFoundException();
    }
    const updateCategory = {
      ...Category,
      ...updateCategoryDto,
    };
    return this.recieptdetailRepository.save(updateCategory);
  }

  async remove(id: number) {
    const Category = await this.recieptdetailRepository.findOneBy({
      category_id: id,
    });
    if (!Category) {
      throw new NotFoundException();
    }
    return this.recieptdetailRepository.softRemove(Category);
  }
}
