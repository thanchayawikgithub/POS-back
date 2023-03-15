import { Test, TestingModule } from '@nestjs/testing';
import { CheckMaterialDetialsService } from './check_material_detials.service';

describe('CheckMaterialDetialsService', () => {
  let service: CheckMaterialDetialsService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [CheckMaterialDetialsService],
    }).compile();

    service = module.get<CheckMaterialDetialsService>(CheckMaterialDetialsService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
