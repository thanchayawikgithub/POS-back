import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  Request,
  Query,
} from '@nestjs/common';
import { RecieptsService } from './reciepts.service';
import { CreateRecieptDto } from './dto/create-reciept.dto';
import { UpdateRecieptDto } from './dto/update-reciept.dto';
import { UseGuards } from '@nestjs/common';
import { JwtAuthGuard } from 'src/auth/jwt-auth.guard';

@UseGuards(JwtAuthGuard)
@Controller('reciepts')
export class RecieptsController {
  constructor(private readonly recieptsService: RecieptsService) {}

  @Post()
  create(@Body() createRecieptDto: CreateRecieptDto) {
    return this.recieptsService.create(createRecieptDto);
  }

  @Get()
  findAll(@Query() query, @Request() req: any) {
    return this.recieptsService.findAll(query);
  }

  @Get('lastReceipt')
  findLast() {
    return this.recieptsService.findLast();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.recieptsService.findOne(+id);
  }

  @Get('/getDailyReceipts')
  findDailyReceipts() {
    return this.recieptsService.findDailyReceipts();
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateRecieptDto: UpdateRecieptDto) {
    return this.recieptsService.update(+id, updateRecieptDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.recieptsService.remove(+id);
  }
}
