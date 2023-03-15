import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { CheckMaterialsService } from './check_materials.service';
import { CreateCheckMaterialDto } from './dto/create-check_material.dto';
import { UpdateCheckMaterialDto } from './dto/update-check_material.dto';

@Controller('check_materials')
export class CheckMaterialsController {
  constructor(private readonly checkMaterialsService: CheckMaterialsService) {}

  @Post()
  create(@Body() createCheckMaterialDto: CreateCheckMaterialDto) {
    return this.checkMaterialsService.create(createCheckMaterialDto);
  }

  @Get()
  findAll() {
    return this.checkMaterialsService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.checkMaterialsService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateCheckMaterialDto: UpdateCheckMaterialDto,
  ) {
    return this.checkMaterialsService.update(+id, updateCheckMaterialDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.checkMaterialsService.remove(+id);
  }
}
