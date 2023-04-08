import { Injectable } from '@nestjs/common';

import { InjectDataSource } from '@nestjs/typeorm';
import { Material } from 'src/materials/entities/material.entity';
import { DataSource } from 'typeorm';

@Injectable()
export class ReportsService {
  constructor(@InjectDataSource() private dataSource: DataSource) {}
  getStore() {
    return this.dataSource.query('SELECT * FROM `store_info`');
  }

  async getMatirial() {
    const mats = await this.dataSource.query('CALL getMatirial()');
    const matList = new Array<Material>();
    for (const matt of mats[0]) {
      const mat = new Material();
      mat.mat_id = matt.mat_id;
      mat.mat_name = matt.mat_name;
      mat.mat_min_quantity = matt.mat_min_quantity;
      mat.mat_quantity = matt.mat_quantity;
      mat.mat_unit = matt.mat_unit;
      mat.mat_price_per_unit = matt.mat_price_per_unit;
      mat.mat_shop_name = matt.mat_shop_name;
      matList.push(mat);
    }
    return matList;
  }
}
