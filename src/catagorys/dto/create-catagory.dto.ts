import { IsNotEmpty } from 'class-validator';

export class CreateCatagoryDto {
  @IsNotEmpty()
  name: string;
}
