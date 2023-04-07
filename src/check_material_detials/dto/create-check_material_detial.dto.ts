import { IsNotEmpty } from 'class-validator';

export class CreateCheckMaterialDetialDto {
  @IsNotEmpty()
  MaterialId: number;
  @IsNotEmpty()
  cmd_qty_remain: number;

  cmd_qty_expire: number;
}
