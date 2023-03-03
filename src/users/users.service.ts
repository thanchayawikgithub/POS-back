import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { User } from './entities/user.entity';

@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(User)
    private userRepository: Repository<User>,
  ) {}

  create(createUserDto: CreateUserDto) {
    return this.userRepository.save(createUserDto);
  }

  findAll() {
    return this.userRepository.find({ relations: ['employee'] });
  }

  findOne(id: number) {
    return this.userRepository.findOne({
      where: { user_id: id },
      relations: ['employee'],
    });
  }

  findOneByEmail(username: string) {
    return this.userRepository.findOne({
      where: { user_login: username },
      relations: ['employee'],
    });
  }

  async update(id: number, updateUserDto: UpdateUserDto) {
    const user = await this.userRepository.findOneBy({ user_id: id });
    if (!user) {
      throw new NotFoundException();
    }
    const updateUser = { ...user, ...updateUserDto };
    return this.userRepository.save(updateUser);
  }

  async remove(id: number) {
    const user = await this.userRepository.findOneBy({ user_id: id });
    if (!user) {
      throw new NotFoundException();
    }
    return this.userRepository.softRemove(user);
  }
}
