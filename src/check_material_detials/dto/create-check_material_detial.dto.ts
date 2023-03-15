import { IsNotEmpty } from 'class-validator';

export class CreateCheckMaterialDetialDto {
  @IsNotEmpty()
  cmd_id: number;
  @IsNotEmpty()
  cmd_name: string;
  @IsNotEmpty()
  cmd_qty_last: number;
  @IsNotEmpty()
  cmd_qty_remain: number;
  @IsNotEmpty()
  cmd_qty_expire: Date;
}
