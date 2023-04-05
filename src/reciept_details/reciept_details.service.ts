import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Product } from 'src/products/entities/product.entity';
import { Reciept } from 'src/reciepts/entities/reciept.entity';
import { Repository } from 'typeorm';
import { CreateRecieptDetailDto } from './dto/create-reciept_detail.dto';
import { UpdateRecieptDetailDto } from './dto/update-reciept_detail.dto';
import { RecieptDetail } from './entities/reciept_detail.entity';

@Injectable()
export class RecieptDetailsService {
  constructor(
    @InjectRepository(RecieptDetail)
    private recieptdetailRepository: Repository<RecieptDetail>,
    @InjectRepository(Product)
    private productRepository: Repository<Product>,
  ) {}

  async create(createRecieptDetailDto: CreateRecieptDetailDto) {
    const product = await this.productRepository.findOneBy({
      product_id: createRecieptDetailDto.productId,
    });
    const reciept_detail: RecieptDetail = new RecieptDetail();
    reciept_detail.rcd_amount = createRecieptDetailDto.rcd_amount;
    reciept_detail.rcd_name = product.product_name;
    reciept_detail.rcd_price = createRecieptDetailDto.rcd_price;
    reciept_detail.rcd_total =
      reciept_detail.rcd_price * reciept_detail.rcd_amount;
    reciept_detail.products = product;

    return this.recieptdetailRepository.save(reciept_detail);
  }

  findAll() {
    return this.recieptdetailRepository.find({ relations: ['products'] });
  }

  findOne(id: number) {
    return this.recieptdetailRepository.findOne({
      where: { rcd_id: id },
      relations: ['products'],
    });
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
