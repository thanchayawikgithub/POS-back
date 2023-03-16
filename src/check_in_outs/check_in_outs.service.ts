import { Injectable } from '@nestjs/common';
import { CreateCheckInOutDto } from './dto/create-check_in_out.dto';
import { UpdateCheckInOutDto } from './dto/update-check_in_out.dto';

@Injectable()
export class CheckInOutsService {
  create(createCheckInOutDto: CreateCheckInOutDto) {
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
