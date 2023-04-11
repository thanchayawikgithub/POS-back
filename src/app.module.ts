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
import { AuthModule } from './auth/auth.module';
import { CheckMaterialsModule } from './check_materials/check_materials.module';
import { CheckMaterial } from './check_materials/entities/check_material.entity';
import { CheckMaterialDetialsModule } from './check_material_detials/check_material_detials.module';
import { CheckMaterialDetial } from './check_material_detials/entities/check_material_detial.entity';
import { SalariesModule } from './salaries/salaries.module';
import { Salary } from './salaries/entities/salary.entity';
import { BillModule } from './bill/bill.module';
import { Bill } from './bill/entities/bill.entity';
import { BillDetailsModule } from './bill_details/bill_details.module';
import { BillDetail } from './bill_details/entities/bill_detail.entity';
import { CheckInOutsModule } from './check_in_outs/check_in_outs.module';
import { CheckInOut } from './check_in_outs/entities/check_in_out.entity';
import { ReportsModule } from './reports/reports.module';

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'mysql',
      host: 'angsila.informatics.buu.ac.th',
      port: 3306,
      username: 'guest01',
      password: 'sSYhvAdV',
      database: 'guest01',
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
        CheckMaterial,
        CheckMaterialDetial,
        Salary,
        Bill,
        BillDetail,
        CheckInOut,
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
    AuthModule,
    CheckMaterialsModule,
    CheckMaterialDetialsModule,
    SalariesModule,
    BillModule,
    BillDetailsModule,
    CheckInOutsModule,
    ReportsModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {
  constructor(private dataSource: DataSource) {}
}
