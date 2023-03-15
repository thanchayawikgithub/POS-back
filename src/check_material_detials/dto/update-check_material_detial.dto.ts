import { PartialType } from '@nestjs/mapped-types';
import { CreateCheckMaterialDetialDto } from './create-check_material_detial.dto';

export class UpdateCheckMaterialDetialDto extends PartialType(
  CreateCheckMaterialDetialDto,
) {}
