import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { CheckMaterialDetialsService } from './check_material_detials.service';
import { CreateCheckMaterialDetialDto } from './dto/create-check_material_detial.dto';
import { UpdateCheckMaterialDetialDto } from './dto/update-check_material_detial.dto';

@Controller('check_material_detials')
export class CheckMaterialDetialsController {
  constructor(
    private readonly checkMaterialDetialsService: CheckMaterialDetialsService,
  ) {}

  @Post()
  create(@Body() createCheckMaterialDetialDto: CreateCheckMaterialDetialDto) {
    return this.checkMaterialDetialsService.create(
      createCheckMaterialDetialDto,
    );
  }

  @Get()
  findAll() {
    return this.checkMaterialDetialsService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.checkMaterialDetialsService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateCheckMaterialDetialDto: UpdateCheckMaterialDetialDto,
  ) {
    return this.checkMaterialDetialsService.update(
      +id,
      updateCheckMaterialDetialDto,
    );
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.checkMaterialDetialsService.remove(+id);
  }
}
