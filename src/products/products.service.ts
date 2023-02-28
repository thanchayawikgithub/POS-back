import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm/dist';
import { Repository } from 'typeorm';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';
import { Product } from './entities/product.entity';

@Injectable()
export class ProductsService {
  constructor(
    @InjectRepository(Product) private productRepository: Repository<Product>,
  ) {}
  create(createProductDto: CreateProductDto) {
    return this.productRepository.save(createProductDto);
  }

  findAll() {
    return this.productRepository.find();
  }

  findOne(pro_id: number) {
    return this.productRepository.findOne({ where: { pro_id } });
  }

  async update(pro_id: number, updateProductDto: UpdateProductDto) {
    const product = await this.productRepository.findOneBy({ pro_id });
    if (!product) {
      throw new NotFoundException();
    }
    const updatedProduct = { ...product, ...updateProductDto };
    return this.productRepository.save(updatedProduct);
  }

  async remove(pro_id: number) {
    const product = await this.productRepository.findOneBy({ pro_id });
    if (!product) {
      throw new NotFoundException();
    }
    return this.productRepository.softRemove(product);
  }
}
