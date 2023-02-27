import { IsNotEmpty, Length } from 'class-validator';

export class CreateStoreDto {
  @IsNotEmpty()
  @Length(3, 32)
  name: string;

  @IsNotEmpty()
  address: string;

  @IsNotEmpty()
  tel: string;
}
