import { Controller, Get } from '@nestjs/common';
import { ReportsService } from './reports.service';
import { UseGuards } from '@nestjs/common';
import { JwtAuthGuard } from 'src/auth/jwt-auth.guard';

@UseGuards(JwtAuthGuard)
@Controller('reports')
export class ReportsController {
  constructor(private readonly reportsService: ReportsService) {}
  @Get('/storeview')
  getStore() {
    return this.reportsService.getStore();
  }
  @Get('/getmat')
  getMatirial() {
    return this.reportsService.getMatirial();
  }

  @Get('/getSalesQtyDrink')
  getProductSalesQtyDrink() {
    return this.reportsService.getProductSalesQtyDrink();
  }
  @Get('/getSalesQtyBakery')
  getProductSalesQtyBakery() {
    return this.reportsService.getProductSalesQtyBakery();
  }
  @Get('/getSalesQtyFood')
  getProductSalesQtyFood() {
    return this.reportsService.getProductSalesQtyFood();
  }

  @Get('/getDayOfWeekTotalSales')
  GetDayOfWeekTotalSales() {
    return this.reportsService.getDayOfWeekTotalSales();
  }

  @Get('/getDailySales')
  GetDailySales() {
    return this.reportsService.getDailySales();
  }
}
