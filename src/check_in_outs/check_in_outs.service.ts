import { Injectable } from '@nestjs/common';
import { CreateCheckInOutDto } from './dto/create-check_in_out.dto';
import { UpdateCheckInOutDto } from './dto/update-check_in_out.dto';
import { CheckInOut } from './entities/check_in_out.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';

@Injectable()
export class CheckInOutsService {
  constructor(
    @InjectRepository(CheckInOut)
    private checkInOutRepository: Repository<CheckInOut>,
  ) {}
  create(user: { employee_id: number }) {
    // const check_in_out: CheckInOut = new CheckInOut();
    return 'This action adds a new checkInOut';
  }

  findAll() {
    return `This action returns all checkInOuts`;
  }

  findOne(id: number) {
    return `This action returns a #${id} checkInOut`;
  }

  update(id: number, updateCheckInOutDto: UpdateCheckInOutDto) {
    return `This action updates a #${id} checkInOut`;
  }

  remove(id: number) {
    return `This action removes a #${id} checkInOut`;
  }
}
