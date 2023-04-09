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

  async getProductSalesQtyDrink() {
    const products = await this.dataSource.query(
      'SELECT ProductDw.Product_id, ProductDw.Product_name AS Product_name, SUM(FactAgg.Fact_agg_quantity_sold) AS Drink_quantity_sold FROM FactAgg INNER JOIN ProductDw ON FactAgg.Product_id = ProductDw.Product_id WHERE Product_category = "drink" GROUP BY ProductDw.Product_category, ProductDw.Product_id;',
    );
    return products;
  }

  async getProductSalesQtyBakery() {
    const products = await this.dataSource.query(
      'SELECT ProductDw.Product_id,ProductDw.Product_name AS Product_name, SUM(FactAgg.Fact_agg_quantity_sold) AS Bakery_quantity_sold FROM FactAgg INNER JOIN ProductDw ON FactAgg.Product_id = ProductDw.Product_id WHERE Product_category = "bakery" GROUP BY ProductDw.Product_category, ProductDw.Product_id;',
    );
    return products;
  }

  async getProductSalesQtyFood() {
    const products = await this.dataSource.query(
      'SELECT ProductDw.Product_id,ProductDw.Product_name AS Product_name, SUM(FactAgg.Fact_agg_quantity_sold) AS Food_quantity_sold FROM FactAgg INNER JOIN ProductDw ON FactAgg.Product_id = ProductDw.Product_id WHERE Product_category = "food" GROUP BY ProductDw.Product_category, ProductDw.Product_id;',
    );
    return products;
  }

  async getCheckInOuts() {
    const check_in_outs = await this.dataSource.query(
      'SELECT CAST(cio_time_in AS DATE) AS DATE, employee.employee_name, CAST(cio_time_in AS TIME) AS Check_in_time, CAST(cio_time_out AS TIME) AS Check_out_time FROM employee INNER JOIN check_in_out ON check_in_out.EmployeeId = employee.employee_id;',
    );
    return check_in_outs;
  }

  async getDayOfWeekTotalSales() {
    const TotalSales = await this.dataSource.query(
      'SELECT TimeDw.DayOfWeek, SUM(FactDw.Fact_total_sales) AS Total FROM FactDw INNER JOIN TimeDw ON FactDw.Time_id = TimeDw.Time_id GROUP BY TimeDw.DayOfWeek ORDER BY CASE TimeDw.DayOfWeek WHEN "Monday" THEN 1 WHEN "Tuesday" THEN 2 WHEN "Wednesday" THEN 3 WHEN "Thursday" THEN 4 WHEN "Friday" THEN 5 WHEN "Saturday" THEN 6 WHEN "Sunday" THEN 7 END ASC',
    );
    return TotalSales;
  }

  async getDailySales() {
    const dailySales = await this.dataSource.query(
      'SELECT SUM(reciept.rec_total) AS total_sales, COUNT(reciept.rec_id) AS total_receipts FROM reciept WHERE DATE(reciept.rec_createdAt) = CURDATE() GROUP BY DATE(reciept.rec_createdAt);',
    );
    return dailySales;
  }

  async getCustomersRegister() {
    const sumcustomers = await this.dataSource.query(
      'SELECT (COUNT(CustomerDw.Customer_id))AS member,MONTH(CustomerDw.Customer_start_date) AS MONTH FROM CustomerDw GROUP BY MONTH;',
    );
    return sumcustomers;
  }
}
