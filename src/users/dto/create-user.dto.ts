import { IsNotEmpty } from 'class-validator';

export class CreateUserDto {
  @IsNotEmpty()
  user_name: string;
  @IsNotEmpty()
  user_login: string;
  @IsNotEmpty()
  user_password: string;
  @IsNotEmpty()
  user_role: string;
}
