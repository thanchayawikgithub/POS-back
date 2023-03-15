import { IsNotEmpty } from 'class-validator';

export class CreateCheckMaterialDetialDto {
  @IsNotEmpty()
  MaterialId: number;
  @IsNotEmpty()
  CheckMaterialId: number;
  @IsNotEmpty()
  cmd_qty_last: number;
  @IsNotEmpty()
  cmd_qty_remain: number;
  @IsNotEmpty()
  cmd_qty_expire: Date;
}
