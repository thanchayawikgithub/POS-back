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
    private catagoryRrpository: Repository<Catagory>,
  ) {}
  create(createCatagoryDto: CreateCatagoryDto) {
    return this.catagoryRrpository.save(createCatagoryDto);
  }

  findAll() {
    return this.catagoryRrpository.find();
  }

  findOne(cat_id: number) {
    return this.catagoryRrpository.findOne({ where: { cat_id } });
  }

  async update(cat_id: number, updateCatagoryDto: UpdateCatagoryDto) {
    const catagory = await this.catagoryRrpository.findOneBy({ cat_id });
    if (!catagory) {
      throw new NotFoundException();
    }
    const updatedCatagory = { ...catagory, ...updateCatagoryDto };
    return this.catagoryRrpository.save(updatedCatagory);
  }

  async remove(cat_id: number) {
    const catagory = await this.catagoryRrpository.findOneBy({ cat_id });
    if (!catagory) {
      throw new NotFoundException();
    }
    return this.catagoryRrpository.softRemove(catagory);
  }
}
