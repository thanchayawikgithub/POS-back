import { IsNotEmpty, Length } from 'class-validator';

export class CreateStoreDto {
  @IsNotEmpty()
  @Length(3, 32)
  store_name: string;

  @IsNotEmpty()
  store_province: string;

  @IsNotEmpty()
  store_district: string;

  @IsNotEmpty()
  store_sub_district: string;

  @IsNotEmpty()
  store_tel: string;
}
