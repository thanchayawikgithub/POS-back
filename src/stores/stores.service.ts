import { Store } from './entities/store.entity';
import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateStoreDto } from './dto/create-store.dto';
import { UpdateStoreDto } from './dto/update-store.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';

@Injectable()
export class StoresService {
  constructor(
    @InjectRepository(Store) private storeRepository: Repository<Store>,
  ) {}
  create(createStoreDto: CreateStoreDto) {
    return this.storeRepository.save(createStoreDto);
  }

  findAll() {
    return this.storeRepository.find();
  }

  findOne(id: number) {
    return this.storeRepository.findOne({ where: { store_id: id } });
  }

  async update(id: number, updateStoreDto: UpdateStoreDto) {
    const store = await this.storeRepository.findOneBy({ store_id: id });
    if (!store) {
      throw new NotFoundException();
    }
    const updateStore = { ...store, ...updateStoreDto };
    return this.storeRepository.save(updateStore);
  }

  async remove(id: number) {
    const store = await this.storeRepository.findOneBy({ store_id: id });
    if (!store) {
      throw new NotFoundException();
    }
    return this.storeRepository.softRemove(store);
  }
}
