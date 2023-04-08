import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { SalariesService } from './salaries.service';
import { UpdateSalaryDto } from './dto/update-salary.dto';

@Controller('salaries')
export class SalariesController {
  constructor(private readonly salariesService: SalariesService) {}

  @Post(':id')
  create(@Param('id') id: number) {
    return this.salariesService.create(id);
  }

  @Get()
  findAll() {
    return this.salariesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.salariesService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateSalaryDto: UpdateSalaryDto) {
    return this.salariesService.update(+id, updateSalaryDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.salariesService.remove(+id);
  }
}
