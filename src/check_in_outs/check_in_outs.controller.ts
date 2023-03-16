import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { CheckInOutsService } from './check_in_outs.service';
import { CreateCheckInOutDto } from './dto/create-check_in_out.dto';
import { UpdateCheckInOutDto } from './dto/update-check_in_out.dto';

@Controller('check-in-outs')
export class CheckInOutsController {
  constructor(private readonly checkInOutsService: CheckInOutsService) {}

  @Post()
  create(@Body() createCheckInOutDto: CreateCheckInOutDto) {
    return this.checkInOutsService.create(createCheckInOutDto);
  }

  @Get()
  findAll() {
    return this.checkInOutsService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.checkInOutsService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateCheckInOutDto: UpdateCheckInOutDto,
  ) {
    return this.checkInOutsService.update(+id, updateCheckInOutDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.checkInOutsService.remove(+id);
  }
}
