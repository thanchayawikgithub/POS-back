import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm/dist';
import { Repository } from 'typeorm';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';
import { Product } from './entities/product.entity';

@Injectable()
export class ProductsService {
  constructor(
    @InjectRepository(Product) private productRrpository: Repository<Product>,
  ) {}
  create(createProductDto: CreateProductDto) {
    return this.productRrpository.save(createProductDto);
  }

  findAll() {
    return this.productRrpository.find();
  }

  findOne(id: number) {
    return this.productRrpository.findOne({ where: { id } });
  }

  async update(id: number, updateProductDto: UpdateProductDto) {
    const product = await this.productRrpository.findOneBy({ id });
    if (!product) {
      throw new NotFoundException();
    }
    const updatedProduct = { ...product, ...updateProductDto };
    return this.productRrpository.save(updatedProduct);
  }

  async remove(id: number) {
    const product = await this.productRrpository.findOneBy({ id });
    if (!product) {
      throw new NotFoundException();
    }
    return this.productRrpository.softRemove(product);
  }
}
