import {
  Body,
  Controller,
  Get,
  Patch,
  Post,
  Req,
  UseGuards,
} from '@nestjs/common';
import { RoleCheckedGuard } from '../../mlnsc/role.checker.guard';
import { AllowToRolesDescriptor } from '../../mlnsc/allow.to.roles.descriptor';
import { CartService } from '../../services/cart/cart.service';
import { Cart } from '../../../entities/Cart';
import { AddArticleToCartDto } from '../../dtos/cart/add.article.to.cart.dto';
import { Request } from 'express';
import { EditQuantityInCartDto } from '../../dtos/cart/edit.quantity.in.cart.dto';
import { AddOrderDto } from '../../dtos/order/add.order.dto';
import { Order } from '../../../entities/Order';
import { ApiResponse } from '../../mlnsc/api/response.class';
import { OrderService } from '../../services/order/order.service';
import { OrderMailerService } from '../../services/order/order.mailer.service';

@Controller('api/user/cart')
export class UserCartController {
  constructor(
    private orderService: OrderService,
    private cartService: CartService,
    private orderMailerService: OrderMailerService,
  ) {}

  private async getActiveCartByUserId(userId: number): Promise<Cart> {
    let cart = await this.cartService.getLastCartByUserId(userId);

    console.log(userId + ' GetActiveCartByUserId' + cart.userId);

    if (!cart) {
      cart = await this.cartService.createNewCartForUser(userId);
    }

    return await this.cartService.getById(cart.cartId);
  }

  @Get()
  @UseGuards(RoleCheckedGuard)
  @AllowToRolesDescriptor('user')
  async getCurrentCart(@Req() req: Request): Promise<Cart> {
    console.log(req.token.id + ' token Id');
    return await this.getActiveCartByUserId(req.token.id);
  }

  @Post('addToCart')
  @UseGuards(RoleCheckedGuard)
  @AllowToRolesDescriptor('user')
  async addToCart(
    @Body() data: AddArticleToCartDto,
    @Req() req: Request,
  ): Promise<Cart> {
    let curCart = await this.getActiveCartByUserId(req.token.id);

    if (!curCart) {
      curCart = await this.cartService.createNewCartForUser(req.token.id);
    }

    return await this.cartService.addArticleToCart(
      curCart.cartId,
      data.articleId,
      data.quantity,
    );
  }

  @Post('makeCart')
  @UseGuards(RoleCheckedGuard)
  @AllowToRolesDescriptor('user')
  async makeNewCartForUser(@Req() req: Request): Promise<Cart> {
    return await this.cartService.createNewCartForUser(req.token.id);
  }

  @Patch()
  @UseGuards(RoleCheckedGuard)
  @AllowToRolesDescriptor('user')
  async editQuantity(
    @Body() data: EditQuantityInCartDto,
    @Req() req: Request,
  ): Promise<Cart> {
    const cart = await this.getActiveCartByUserId(req.token.id);
    return await this.cartService.editQuantityInCart(
      cart.cartId,
      data.articleId,
      data.quantity,
    );
  }

  @Post('makeOrder')
  @UseGuards(RoleCheckedGuard)
  @AllowToRolesDescriptor('user')
  async addOrder(@Req() req: Request): Promise<Order | ApiResponse> {
    const cart = await this.getActiveCartByUserId(req.token.id);
    console.log(cart.userId);
    const order = await this.orderService.makeOrder(cart.cartId, cart.userId);
    console.log(order);

    if (order instanceof ApiResponse) {
      return order;
    }
    await this.orderMailerService.sendOrderEmail(order);

    return order;
  }

  @Get('orders')
  @UseGuards(RoleCheckedGuard)
  @AllowToRolesDescriptor('user')
  async getOrders(@Req() req: Request): Promise<Order[]> {
    return await this.orderService.getAllByUserId(req.token.id);
  }
}
