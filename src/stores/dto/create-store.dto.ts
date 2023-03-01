import { IsNotEmpty, Length } from 'class-validator';

export class CreateStoreDto {
  @IsNotEmpty()
  @Length(3, 32)
  store_name: string;

  @IsNotEmpty()
  store_address: string;

  @IsNotEmpty()
  store_tel: string;
}
