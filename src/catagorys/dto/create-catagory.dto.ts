import { IsNotEmpty } from 'class-validator';

export class CreateCatagoryDto {
  @IsNotEmpty()
  catagory_name: string;
}
