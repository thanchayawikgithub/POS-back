import { Injectable } from '@nestjs/common';
import { CreateCheckMaterialDetialDto } from './dto/create-check_material_detial.dto';
import { UpdateCheckMaterialDetialDto } from './dto/update-check_material_detial.dto';

@Injectable()
export class CheckMaterialDetialsService {
  create(createCheckMaterialDetialDto: CreateCheckMaterialDetialDto) {
    return 'This action adds a new checkMaterialDetial';
  }

  findAll() {
    return `This action returns all checkMaterialDetials`;
  }

  findOne(id: number) {
    return `This action returns a #${id} checkMaterialDetial`;
  }

  update(id: number, updateCheckMaterialDetialDto: UpdateCheckMaterialDetialDto) {
    return `This action updates a #${id} checkMaterialDetial`;
  }

  remove(id: number) {
    return `This action removes a #${id} checkMaterialDetial`;
  }
}
