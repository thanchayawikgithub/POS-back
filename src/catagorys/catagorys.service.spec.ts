import { Test, TestingModule } from '@nestjs/testing';
import { CatagorysService } from './catagorys.service';

describe('CatagorysService', () => {
  let service: CatagorysService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [CatagorysService],
    }).compile();

    service = module.get<CatagorysService>(CatagorysService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
