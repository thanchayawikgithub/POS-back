import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { Employee } from 'src/employees/entities/employee.entity';
import { EmployeesService } from '../employees/employees.service';
import * as bcrypt from 'bcrypt';
@Injectable()
export class AuthService {
  constructor(
    private employeesService: EmployeesService,
    private jwtService: JwtService,
  ) {}

  async validateUser(username: string, pass: string): Promise<any> {
    const employee = await this.employeesService.findOneByEmail(username);
    const isMatch = await bcrypt.compare(pass, employee.employee_password);
    if (employee && isMatch) {
      const { employee_password, ...result } = employee;
      return result;
    }
    return null;
  }

  async login(employee: Employee) {
    const payload = {
      username: employee.employee_login,
      sub: employee.employee_id,
    };
    return {
      employee,
      access_token: this.jwtService.sign(payload),
    };
  }
}
