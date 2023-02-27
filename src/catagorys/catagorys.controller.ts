import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { CatagorysService } from './catagorys.service';
import { CreateCatagoryDto } from './dto/create-catagory.dto';
import { UpdateCatagoryDto } from './dto/update-catagory.dto';

@Controller('catagorys')
export class CatagorysController {
  constructor(private readonly catagorysService: CatagorysService) {}

  @Post()
  create(@Body() createCatagoryDto: CreateCatagoryDto) {
    return this.catagorysService.create(createCatagoryDto);
  }

  @Get()
  findAll() {
    return this.catagorysService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.catagorysService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateCatagoryDto: UpdateCatagoryDto,
  ) {
    return this.catagorysService.update(+id, updateCatagoryDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.catagorysService.remove(+id);
  }
}
