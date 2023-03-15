import { Test, TestingModule } from '@nestjs/testing';
import { CheckMaterialDetialsController } from './check_material_detials.controller';
import { CheckMaterialDetialsService } from './check_material_detials.service';

describe('CheckMaterialDetialsController', () => {
  let controller: CheckMaterialDetialsController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [CheckMaterialDetialsController],
      providers: [CheckMaterialDetialsService],
    }).compile();

    controller = module.get<CheckMaterialDetialsController>(
      CheckMaterialDetialsController,
    );
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
