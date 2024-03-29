import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Administrator } from '../../../entities/administrator.entity';
import { Repository } from 'typeorm';
import { AddAdministratorDto } from '../../dtos/administrator/addAdministratorDTO';
import { EditAdministratorDTO } from '../../dtos/administrator/edit.administrator.DTO';
import crypto from 'crypto';
import { ApiResponse } from '../../mlnsc/api/response.class';
import { AdministratorToken } from '../../../entities/administrator-token.entity';

@Injectable()
export class AdministratorService {
  // eslint-disable-next-line @typescript-eslint/no-empty-function
  constructor(
    @InjectRepository(Administrator)
    private readonly administrator: Repository<Administrator>,
    @InjectRepository(AdministratorToken)
    private readonly administratorToken: Repository<AdministratorToken>,
  ) {}

  getAll(): Promise<Administrator[]> {
    return this.administrator.find();
  }

  getById(administratorId: number): Promise<Administrator> {
    return this.administrator.findOne({ where: { administratorId } });
  }

  async getByUsername(
    usernameString: string,
  ): Promise<Administrator | undefined> {
    const admin = await this.administrator.findOne({
      where: { username: usernameString },
    });
    if (admin) {
      return admin;
    } else {
      return undefined;
    }
  }

  add(data: AddAdministratorDto): Promise<Administrator | ApiResponse> {
    const crypto = require('crypto');
    const passwordHash = crypto.createHash('sha512');
    passwordHash.update(data.password);

    const passwordHashString = passwordHash.digest('hex').toUpperCase();
    const newAdmin: Administrator = new Administrator();
    newAdmin.username = data.username;
    newAdmin.passwordHash = passwordHashString;

    return new Promise((resolve) => {
      this.administrator
        .save(newAdmin)
        .then((data) => resolve(data))
        .catch((error) => {
          const response: ApiResponse = new ApiResponse('error', -1001);
          resolve(response);
        });
    });
  }

  async editById(
    administratorId: number,
    data: EditAdministratorDTO,
  ): Promise<Administrator | ApiResponse> {
    const currAdmin: Administrator = await this.administrator.findOne({
      where: { administratorId },
    });

    if (currAdmin === undefined) {
      return new Promise((resolve) => {
        resolve(new ApiResponse('error', -1002));
      });
    }

    const crypto = require('crypto');
    const passwordHash = crypto.createHash('sha512');
    passwordHash.update(data.password);

    const passwordHashString = passwordHash.digest('hex').toUpperCase();
    currAdmin.passwordHash = passwordHashString;

    return this.administrator.save(currAdmin);
  }

  async addToken(administratorId: number, token: string, expiresAt: string) {
    const administratorToken = new AdministratorToken();
    administratorToken.administratorId = administratorId;
    administratorToken.token = token;
    administratorToken.expiresAt = expiresAt;

    return await this.administratorToken.save(administratorToken);
  }

  async getAdministratorToken(token: string): Promise<AdministratorToken> {
    return await this.administratorToken.findOneBy({ token: token });
  }

  async invalidateToken(
    token: string,
  ): Promise<AdministratorToken | ApiResponse> {
    const administratorToken = await this.administratorToken.findOneBy({
      token: token,
    });

    if (!administratorToken) {
      return new ApiResponse('error', -10001, 'No such refresh token');
    }

    administratorToken.isValid = 0;

    await this.administratorToken.save(administratorToken);

    return await this.getAdministratorToken(token);
  }

  async invalidateAdministratorTokens(
    administratorId: number,
  ): Promise<(AdministratorToken | ApiResponse)[]> {
    const administratorTokens = await this.administratorToken.findBy({
      administratorId: administratorId,
    });

    const results = [];

    for (const administratorToken of administratorTokens) {
      results.push(this.invalidateToken(administratorToken.token));
    }

    return results;
  }
}
