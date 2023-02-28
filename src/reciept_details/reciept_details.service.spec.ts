import { Test, TestingModule } from '@nestjs/testing';
import { RecieptDetailsService } from './reciept_details.service';

describe('RecieptDetailsService', () => {
  let service: RecieptDetailsService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [RecieptDetailsService],
    }).compile();

    service = module.get<RecieptDetailsService>(RecieptDetailsService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
