import { Injectable } from '@nestjs/common';
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

  update(id: number, updateRecieptDto: UpdateRecieptDto) {
    return `This action updates a #${id} reciept`;
  }

  remove(id: number) {
    return `This action removes a #${id} reciept`;
  }
}
