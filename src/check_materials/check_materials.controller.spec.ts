import { Test, TestingModule } from '@nestjs/testing';
import { CheckMaterialsController } from './check_materials.controller';
import { CheckMaterialsService } from './check_materials.service';

describe('CheckMaterialsController', () => {
  let controller: CheckMaterialsController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [CheckMaterialsController],
      providers: [CheckMaterialsService],
    }).compile();

    controller = module.get<CheckMaterialsController>(CheckMaterialsController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
