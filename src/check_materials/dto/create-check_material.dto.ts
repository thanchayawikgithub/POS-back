import { IsNotEmpty } from 'class-validator';
import { CreateCheckMaterialDetialDto } from 'src/check_material_detials/dto/create-check_material_detial.dto';

export class CreateCheckMaterialDto {
  @IsNotEmpty()
  EmployeeId: number;
  @IsNotEmpty()
  checkMaterialDetails: CreateCheckMaterialDetialDto[];
}
