import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Bill } from 'src/bill/entities/bill.entity';
import { Material } from 'src/materials/entities/material.entity';
import { Repository } from 'typeorm';
import { CreateBillDetailDto } from './dto/create-bill_detail.dto';
import { UpdateBillDetailDto } from './dto/update-bill_detail.dto';
import { BillDetail } from './entities/bill_detail.entity';

@Injectable()
export class BillDetailsService {
  constructor(
    @InjectRepository(BillDetail)
    private billDetailRepository: Repository<BillDetail>,
    @InjectRepository(Bill)
    private billRepository: Repository<Bill>,
    @InjectRepository(Material)
    private materialRepository: Repository<Material>,
  ) {}
  async create(createBillDetailDto: CreateBillDetailDto) {
    const material = await this.materialRepository.findOneBy({
      mat_id: createBillDetailDto.materialId,
    });
    const bill_detail: BillDetail = new BillDetail();
    bill_detail.bill_detail_amount = createBillDetailDto.bill_detail_amount;
    bill_detail.bill_detail_name = material.mat_name;
    bill_detail.bill_detail_price = material.mat_price_per_unit;
    bill_detail.bill_detail_total =
      material.mat_price_per_unit * bill_detail.bill_detail_amount;
    bill_detail.materials = material;

    material.mat_quantity += createBillDetailDto.bill_detail_amount;

    await this.billDetailRepository.save(bill_detail);

    await this.materialRepository.save(material);

    return await this.billDetailRepository.findOne({
      where: { bill_detail_id: bill_detail.bill_detail_id },
    });
  }

  findAll() {
    return this.billDetailRepository.find({ relations: ['materials'] });
  }

  findOne(id: number) {
    return this.billDetailRepository.findOne({
      where: { bill_detail_id: id },
      relations: ['materials'],
    });
  }

  async update(id: number, updateBillDetailDto: UpdateBillDetailDto) {
    const bill_detail = await this.billDetailRepository.findOneBy({
      bill_detail_id: id,
    });
    if (!bill_detail) {
      throw new NotFoundException();
    }
    const updateBillDetail = { ...bill_detail, ...updateBillDetailDto };
    return this.billDetailRepository.save(updateBillDetail);
  }
  async remove(id: number) {
    const bill_detail = await this.billDetailRepository.findOneBy({
      bill_detail_id: id,
    });
    if (!bill_detail) {
      throw new NotFoundException();
    }
    return this.billDetailRepository.remove(bill_detail);
  }
}
