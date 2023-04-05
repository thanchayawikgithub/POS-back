import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  BadRequestException,
} from '@nestjs/common';
import { CheckInOutsService } from './check_in_outs.service';
import { CreateCheckInOutDto } from './dto/create-check_in_out.dto';
import { UpdateCheckInOutDto } from './dto/update-check_in_out.dto';
import { AuthService } from 'src/auth/auth.service';

@Controller('check-in-outs')
export class CheckInOutsController {
  constructor(
    private readonly checkInOutsService: CheckInOutsService,
    private readonly authService: AuthService,
  ) {}

  @Post()
  async create(
    @Body() createCheckInOutDto: { username: string; password: string },
  ) {
    const user: { employee_id: number } = await this.authService.validateUser(
      createCheckInOutDto.username,
      createCheckInOutDto.password,
    );
    if (!user) {
      throw new BadRequestException();
    }
    return this.checkInOutsService.create(user);
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
