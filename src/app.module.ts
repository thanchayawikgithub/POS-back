import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { Product } from './products/entities/product.entity';
import { ProductsModule } from './products/products.module';
import { DataSource } from 'typeorm';
import { EmployeesModule } from './employees/employees.module';
import { Employee } from './employees/entities/employee.entity';
import { CategorysModule } from './categorys/categorys.module';
import { Category } from './categorys/entities/category.entity';
import { CustomersModule } from './customers/customers.module';
import { Customer } from './customers/entities/customer.entity';
import { StoresModule } from './stores/stores.module';
import { Store } from './stores/entities/store.entity';
import { RecieptsModule } from './reciepts/reciepts.module';
import { Reciept } from './reciepts/entities/reciept.entity';
import { MaterialsModule } from './materials/materials.module';
import { Material } from './materials/entities/material.entity';
import { RecieptDetailsModule } from './reciept_details/reciept_details.module';
import { RecieptDetail } from './reciept_details/entities/reciept_detail.entity';
import { UsersModule } from './users/users.module';
import { User } from './users/entities/user.entity';
import { AuthModule } from './auth/auth.module';

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'sqlite',
      database: 'db.sqlite',
      synchronize: true,
      entities: [
        Employee,
        Product,
        Category,
        Customer,
        Store,
        Reciept,
        Material,
        RecieptDetail,
        User,
      ],
    }),
    EmployeesModule,
    ProductsModule,
    CategorysModule,
    CustomersModule,
    StoresModule,
    RecieptsModule,
    MaterialsModule,
    RecieptDetailsModule,
    UsersModule,
    AuthModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {
  constructor(private dataSource: DataSource) {}
}
