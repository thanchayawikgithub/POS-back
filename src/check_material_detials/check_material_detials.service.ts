import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Material } from 'src/materials/entities/material.entity';
import { Repository } from 'typeorm';
import { CreateCheckMaterialDetialDto } from './dto/create-check_material_detial.dto';
import { UpdateCheckMaterialDetialDto } from './dto/update-check_material_detial.dto';
import { CheckMaterialDetial } from './entities/check_material_detial.entity';

@Injectable()
export class CheckMaterialDetialsService {
  constructor(
    @InjectRepository(CheckMaterialDetial)
    private checkMaterialDetailRepository: Repository<CheckMaterialDetial>,
    @InjectRepository(Material)
    private materialRepository: Repository<Material>,
  ) {}
  async create(createCheckMaterialDetialDto: CreateCheckMaterialDetialDto) {
    const material = await this.materialRepository.findOneBy({
      mat_id: createCheckMaterialDetialDto.MaterialId,
    });

    const check_material_detial = new CheckMaterialDetial();
    check_material_detial.cmd_name = material.mat_name;
    check_material_detial.cmd_qty_last = material.mat_quantity;
    check_material_detial.cmd_qty_remain =
      createCheckMaterialDetialDto.cmd_qty_remain;
    check_material_detial.cmd_qty_expire =
      createCheckMaterialDetialDto.cmd_qty_expire;
    check_material_detial.material = material;

    material.mat_quantity = createCheckMaterialDetialDto.cmd_qty_remain;

    await this.checkMaterialDetailRepository.save(check_material_detial);

    await this.materialRepository.save(material);

    return await this.checkMaterialDetailRepository.findOne({
      where: { cmd_id: check_material_detial.cmd_id },
      relations: ['material'],
    });
  }

  findAll() {
    return this.checkMaterialDetailRepository.find({
      relations: ['material'],
    });
  }

  findOne(id: number) {
    return this.checkMaterialDetailRepository.findOneBy({ cmd_id: id });
  }

  update(
    id: number,
    updateCheckMaterialDetialDto: UpdateCheckMaterialDetialDto,
  ) {
    return `This action updates a #${id} checkMaterialDetial`;
  }

  async remove(id: number) {
    const cmd = await this.checkMaterialDetailRepository.findOneBy({
      cmd_id: id,
    });
    if (!cmd) {
      throw new NotFoundException();
    }
    return this.checkMaterialDetailRepository.softRemove(cmd);
  }
}
