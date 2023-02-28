import { Test, TestingModule } from '@nestjs/testing';
import { RecieptDetailsController } from './reciept_details.controller';
import { RecieptDetailsService } from './reciept_details.service';

describe('RecieptDetailsController', () => {
  let controller: RecieptDetailsController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [RecieptDetailsController],
      providers: [RecieptDetailsService],
    }).compile();

    controller = module.get<RecieptDetailsController>(RecieptDetailsController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
