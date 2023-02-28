import { PartialType } from '@nestjs/mapped-types';
import { CreateRecieptDetailDto } from './create-reciept_detail.dto';

export class UpdateRecieptDetailDto extends PartialType(
  CreateRecieptDetailDto,
) {}
