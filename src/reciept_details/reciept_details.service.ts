import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateRecieptDetailDto } from './dto/create-reciept_detail.dto';
import { UpdateRecieptDetailDto } from './dto/update-reciept_detail.dto';
import { RecieptDetail } from './entities/reciept_detail.entity';

@Injectable()
export class RecieptDetailsService {
  constructor(
    @InjectRepository(RecieptDetail)
    private recieptdetailRepository: Repository<RecieptDetail>,
  ) {}
  create(createRecieptDetailDto: CreateRecieptDetailDto) {
    return this.recieptdetailRepository.save(createRecieptDetailDto);
  }

  findAll() {
    return this.recieptdetailRepository.find();
  }

  findOne(id: number) {
    return this.recieptdetailRepository.findOneBy({ rcd_id: id });
  }

  async update(id: number, updateRecieptDetailDto: UpdateRecieptDetailDto) {
    const reciept_detail = await this.recieptdetailRepository.findOneBy({
      rcd_id: id,
    });
    if (!reciept_detail) {
      throw new NotFoundException();
    }
    const updateRecieptDetail = {
      ...reciept_detail,
      ...updateRecieptDetailDto,
    };
    return this.recieptdetailRepository.save(updateRecieptDetail);
  }

  async remove(id: number) {
    const reciept_detail = await this.recieptdetailRepository.findOneBy({
      rcd_id: id,
    });
    if (!reciept_detail) {
      throw new NotFoundException();
    }
    return this.recieptdetailRepository.softRemove(reciept_detail);
  }
}
