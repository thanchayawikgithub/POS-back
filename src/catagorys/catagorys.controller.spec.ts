import { Test, TestingModule } from '@nestjs/testing';
import { CatagorysController } from './catagorys.controller';
import { CatagorysService } from './catagorys.service';

describe('CatagorysController', () => {
  let controller: CatagorysController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [CatagorysController],
      providers: [CatagorysService],
    }).compile();

    controller = module.get<CatagorysController>(CatagorysController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
