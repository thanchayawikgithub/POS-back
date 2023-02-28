import { IsNotEmpty } from 'class-validator';

export class CreateCatagoryDto {
  @IsNotEmpty()
  cat_name: string;
}
