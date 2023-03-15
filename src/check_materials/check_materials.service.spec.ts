import { Test, TestingModule } from '@nestjs/testing';
import { CheckMaterialsService } from './check_materials.service';

describe('CheckMaterialsService', () => {
  let service: CheckMaterialsService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [CheckMaterialsService],
    }).compile();

    service = module.get<CheckMaterialsService>(CheckMaterialsService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
