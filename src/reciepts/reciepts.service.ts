import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateRecieptDto } from './dto/create-reciept.dto';
import { UpdateRecieptDto } from './dto/update-reciept.dto';
import { Reciept } from './entities/reciept.entity';

@Injectable()
export class RecieptsService {
  constructor(
    @InjectRepository(Reciept) private recieptRepository: Repository<Reciept>,
  ) {}
  create(createRecieptDto: CreateRecieptDto) {
    return this.recieptRepository.save(createRecieptDto);
  }

  findAll() {
    return this.recieptRepository.find();
  }

  findOne(id: number) {
    return this.recieptRepository.findOneBy({ rec_id: id });
  }

  async update(id: number, updateRecieptDto: UpdateRecieptDto) {
    const reciept = await this.recieptRepository.findOneBy({ rec_id: id });
    if (!reciept) {
      throw new NotFoundException();
    }
    const updateReciept = { ...reciept, ...updateRecieptDto };
    return this.recieptRepository.save(updateReciept);
  }
  async remove(id: number) {
    const reciept = await this.recieptRepository.findOneBy({ rec_id: id });
    if (!reciept) {
      throw new NotFoundException();
    }
    return this.recieptRepository.softRemove(reciept);
  }
}
