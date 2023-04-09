import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  Query,
  UseInterceptors,
  UploadedFile,
  Res,
  Request,
} from '@nestjs/common';
import { MaterialsService } from './materials.service';
import { CreateMaterialDto } from './dto/create-material.dto';
import { UpdateMaterialDto } from './dto/update-material.dto';
import { FileInterceptor } from '@nestjs/platform-express';
import { v4 as uuidv4 } from 'uuid';
import { extname } from 'path';
import { UseGuards } from '@nestjs/common';
import { JwtAuthGuard } from 'src/auth/jwt-auth.guard';
import { diskStorage } from 'multer';
import { Response } from 'express';

@Controller('materials')
export class MaterialsController {
  constructor(private readonly materialsService: MaterialsService) {}

  @Post()
  @UseInterceptors(
    FileInterceptor('file', {
      storage: diskStorage({
        destination: './mat_images',
        filename: (req, file, cb) => {
          const name = uuidv4();
          return cb(null, name + extname(file.originalname));
        },
      }),
    }),
  )
  create(
    @Body() createMaterialDto: CreateMaterialDto,
    @UploadedFile() file: Express.Multer.File,
  ) {
    createMaterialDto.mat_image = file.filename;
    return this.materialsService.create(createMaterialDto);
  }

  @UseGuards(JwtAuthGuard)
  @Get()
  findAll(@Query() query, @Request() req: any) {
    return this.materialsService.findAll(query);
  }
  @UseGuards(JwtAuthGuard)
  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.materialsService.findOne(+id);
  }

  @Get('shopName/:shopName')
  findByShopName(@Param('shopName') shopName: string) {
    return this.materialsService.findByShopName(shopName);
  }

  @Get(':id/image')
  async getImage(@Param('id') id: string, @Res() res: Response) {
    const mat = await this.materialsService.findOne(+id);
    res.sendFile(mat.mat_image, { root: './mat_images' });
  }

  @Get('image/:imageFile')
  async getImageByFileNmae(
    @Param('imageFile') imageFile: string,
    @Res() res: Response,
  ) {
    res.sendFile(imageFile, { root: './mat_images' });
  }

  @UseGuards(JwtAuthGuard)
  @Patch(':id')
  @UseInterceptors(
    FileInterceptor('file', {
      storage: diskStorage({
        destination: './mat_images',
        filename: (req, file, cb) => {
          const name = uuidv4();
          return cb(null, name + extname(file.originalname));
        },
      }),
    }),
  )
  update(
    @Param('id') id: string,
    @Body() updateMaterialDto: UpdateMaterialDto,
    @UploadedFile() file: Express.Multer.File,
  ) {
    if (file) {
      updateMaterialDto.mat_image = file.filename;
    }
    return this.materialsService.update(+id, updateMaterialDto);
  }

  @UseGuards(JwtAuthGuard)
  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.materialsService.remove(+id);
  }
}
