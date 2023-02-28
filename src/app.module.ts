import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { Product } from './products/entities/product.entity';
import { ProductsModule } from './products/products.module';
import { DataSource } from 'typeorm';
import { EmployeesModule } from './employees/employees.module';
import { Employee } from './employees/entities/employee.entity';
import { CatagorysModule } from './catagorys/catagorys.module';
import { Catagory } from './catagorys/entities/catagory.entity';
import { CustomersModule } from './customers/customers.module';
import { Customer } from './customers/entities/customer.entity';
import { StoresModule } from './stores/stores.module';
import { Store } from './stores/entities/store.entity';
import { RecieptsModule } from './reciepts/reciepts.module';
import { Reciept } from './reciepts/entities/reciept.entity';
import { MaterialsModule } from './materials/materials.module';
import { Material } from './materials/entities/material.entity';

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'sqlite',
      database: 'db.sqlite',
      synchronize: true,
      entities: [
        Employee,
        Product,
        Catagory,
        Customer,
        Store,
        Reciept,
        Material,
      ],
      migrations: [],
    }),
    EmployeesModule,
    ProductsModule,
    CatagorysModule,
    CustomersModule,
    StoresModule,
    RecieptsModule,
    MaterialsModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {
  constructor(private dataSource: DataSource) {}
}
