import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { RecieptDetailsService } from './reciept_details.service';
import { CreateRecieptDetailDto } from './dto/create-reciept_detail.dto';
import { UpdateRecieptDetailDto } from './dto/update-reciept_detail.dto';
import { UseGuards } from '@nestjs/common';
import { JwtAuthGuard } from 'src/auth/jwt-auth.guard';

@UseGuards(JwtAuthGuard)
@Controller('reciept_details')
export class RecieptDetailsController {
  constructor(private readonly recieptDetailsService: RecieptDetailsService) {}

  @Post()
  create(@Body() createRecieptDetailDto: CreateRecieptDetailDto) {
    return this.recieptDetailsService.create(createRecieptDetailDto);
  }

  @Get()
  findAll() {
    return this.recieptDetailsService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.recieptDetailsService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateRecieptDetailDto: UpdateRecieptDetailDto,
  ) {
    return this.recieptDetailsService.update(+id, updateRecieptDetailDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.recieptDetailsService.remove(+id);
  }
}
