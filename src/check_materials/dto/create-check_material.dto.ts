import { IsNotEmpty } from 'class-validator';

export class CreateCheckMaterialDto {
  @IsNotEmpty()
  EmployeeId: number;
}
