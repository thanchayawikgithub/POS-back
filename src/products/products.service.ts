import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm/dist';
import { Category } from 'src/categorys/entities/category.entity';
import { Repository } from 'typeorm';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';
import { Product } from './entities/product.entity';

@Injectable()
export class ProductsService {
  constructor(
    @InjectRepository(Product)
    private productRepository: Repository<Product>,
    @InjectRepository(Category)
    private categoryRepository: Repository<Category>,
  ) {}
  async create(createProductDto: CreateProductDto) {
    const category = await this.categoryRepository.findOne({
      where: {
        category_id: createProductDto.categoryId,
      },
    });
    const product: Product = new Product();
    product.categoryId = createProductDto.categoryId;
    product.category = category;
    product.product_name = createProductDto.product_name;
    product.product_type = createProductDto.product_type;
    product.product_size = createProductDto.product_size;
    product.product_price = createProductDto.product_price;
    product.product_image = createProductDto.product_image;
    return this.productRepository.save(product);
  }
  findByCategory(id: number) {
    return this.productRepository.find({ where: { categoryId: id } });
  }

  findAll(option) {
    return this.productRepository.find(option);
  }

  findOne(id: number) {
    return this.productRepository.findOne({
      where: { product_id: id },
      relations: ['category'],
    });
  }

  async update(id: number, updateProductDto: UpdateProductDto) {
    const product = await this.productRepository.findOneBy({ product_id: id });
    if (!product) {
      throw new NotFoundException();
    }
    const updatedProduct = { ...product, ...updateProductDto };
    return this.productRepository.save(updatedProduct);
  }

  async remove(id: number) {
    const product = await this.productRepository.findOneBy({ product_id: id });
    if (!product) {
      throw new NotFoundException();
    }
    return this.productRepository.softRemove(product);
  }
}
