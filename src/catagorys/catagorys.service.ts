import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateCatagoryDto } from './dto/create-catagory.dto';
import { UpdateCatagoryDto } from './dto/update-catagory.dto';
import { Catagory } from './entities/catagory.entity';

@Injectable()
export class CatagorysService {
  constructor(
    @InjectRepository(Catagory)
    private recieptdetailRepository: Repository<Catagory>,
  ) {}
  create(createCatagoryDto: CreateCatagoryDto) {
    return this.recieptdetailRepository.save(createCatagoryDto);
  }

  findAll() {
    return this.recieptdetailRepository.find();
  }

  findOne(id: number) {
    return this.recieptdetailRepository.findOneBy({ catagory_id: id });
  }

  async update(id: number, updateCatagoryDto: UpdateCatagoryDto) {
    const catagory = await this.recieptdetailRepository.findOneBy({
      catagory_id: id,
    });
    if (!catagory) {
      throw new NotFoundException();
    }
    const updateCatagory = {
      ...catagory,
      ...updateCatagoryDto,
    };
    return this.recieptdetailRepository.save(updateCatagory);
  }

  async remove(id: number) {
    const catagory = await this.recieptdetailRepository.findOneBy({
      catagory_id: id,
    });
    if (!catagory) {
      throw new NotFoundException();
    }
    return this.recieptdetailRepository.softRemove(catagory);
  }
}
