import { Injectable } from '@nestjs/common';
import { TypeOrmCrudService } from '@nestjsx/crud-typeorm';
import { User } from '../../../entities/User';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { UserRegistrationDto } from '../../dtos/user/user.registration.dto';
import { ApiResponse } from '../../mlnsc/api/response.class';
import * as crypto from 'crypto';
import { Administrator } from '../../../entities/administrator.entity';
import { UserToken } from '../../../entities/User.token';

@Injectable()
export class UserService extends TypeOrmCrudService<User> {
  constructor(
    @InjectRepository(User)
    private readonly user: Repository<User>,
    @InjectRepository(UserToken)
    private readonly userToken: Repository<UserToken>, //!!!! app module
  ) {
    super(user);
  }

  async register(data: UserRegistrationDto): Promise<User | ApiResponse> {
    const passwordHash = crypto.createHash('sha512');
    passwordHash.update(data.password);
    const passwordHashString = passwordHash.digest('hex').toUpperCase();

    const newUser: User = new User();
    newUser.email = data.email;
    newUser.passwordHash = passwordHashString;
    newUser.name = data.forename;
    newUser.surname = data.surname;
    newUser.phoneNumber = data.phone;
    newUser.postalAdress = data.postalAdress;
    try {
      const savedUser = await this.user.save(newUser);
      if (!savedUser) {
        throw new Error('');
      }

      return savedUser;
    } catch (e) {
      return new ApiResponse('error', -6001, 'User acc cant be created');
    }
  }

  async getById(id) {
    return await this.user.findOneBy(id);
  }

  async getByEmail(emailString: string): Promise<User | undefined> {
    const user = await this.user.findOne({
      where: {
        email: emailString,
      },
    });
    if (user) {
      return user;
    } else {
      return undefined;
    }
  }

  async addToken(userId: number, token: string, expiresAt: string) {
    const userToken = new UserToken();
    userToken.userId = userId;
    userToken.token = token;
    userToken.expiresAt = expiresAt;

    return await this.userToken.save(userToken);
  }

  async getUserToken(token: string): Promise<UserToken> {
    return await this.userToken.findOneBy({ token: token });
  }

  async invalidateToken(token: string): Promise<UserToken | ApiResponse> {
    const userToken = await this.userToken.findOneBy({ token: token });

    if (!userToken) {
      return new ApiResponse('error', -10001, 'No such refresh token');
    }

    userToken.isValid = 0;

    await this.userToken.save(userToken);

    return await this.getUserToken(token);
  }

  async invalidateUserTokens(
    userId: number,
  ): Promise<(UserToken | ApiResponse)[]> {
    const userTokens = await this.userToken.findBy({ userId: userId });

    const results = [];

    for (const userToken of userTokens) {
      results.push(this.invalidateToken(userToken.token));
    }

    return results;
  }
}
