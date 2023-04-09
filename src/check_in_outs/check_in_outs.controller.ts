import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  BadRequestException,
  Query,
  Request,
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
  findAll(@Query() query, @Request() req: any) {
    return this.checkInOutsService.findAll(query);
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.checkInOutsService.findOne(+id);
  }

  @Get('/employee/:id')
  findByEmpId(@Param('id') id: string) {
    return this.checkInOutsService.findByEmpId(+id);
  }

  @Patch(':id')
  async update(
    @Param('id') id: string,
    @Body()
    updateCheckInOutDto: {
      username: string;
      password: string;
      status: string;
      cio_total_hour: number;
    },
  ) {
    const user: { employee_id: number } = await this.authService.validateUser(
      updateCheckInOutDto.username,
      updateCheckInOutDto.password,
    );
    if (!user) {
      throw new BadRequestException();
    }
    return this.checkInOutsService.update(+id, user);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.checkInOutsService.remove(+id);
  }
}
