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
    @InjectRepository(Product) private productRepository: Repository<Product>,
    @InjectRepository(Category)
    private categoryRepository: Repository<Category>,
  ) {}
  async create(createProductDto: CreateProductDto) {
    const category = await this.categoryRepository.findOneBy({
      category_id: createProductDto.categoryId,
    });
    console.log(category);
    const product: Product = new Product();
    product.category = category;
    product.product_name = createProductDto.product_name;
    product.product_type = createProductDto.product_type;
    product.product_size = createProductDto.product_size;
    product.product_price = createProductDto.product_price;
    product.product_image = createProductDto.product_image;
    await this.productRepository.save(product);
    console.log(product);
    return await this.productRepository.findOne({
      where: { product_id: product.product_id },
      relations: ['category'],
    });
  }

  findAll() {
    return this.productRepository.find({ relations: ['category'] });
  }

  findOne(id: number) {
    return this.productRepository.findOneBy({ product_id: id });
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
