import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Cart } from '../../../entities/Cart';
import { Repository } from 'typeorm';
import { Order } from '../../../entities/Order';
import { ApiResponse } from '../../mlnsc/api/response.class';

@Injectable()
export class OrderService {
  constructor(
    @InjectRepository(Cart)
    private readonly cart: Repository<Cart>,
    @InjectRepository(Order)
    private readonly order: Repository<Order>,
  ) {}

  async makeOrder(
    cartId: number,
    userId: number,
  ): Promise<Order | ApiResponse> {
    const order = await this.order.findOne({
      where: {
        cartId: cartId,
      },
    });
    console.log('makeOrder ' + order);

    if (order) {
      throw new ApiResponse('error', -7001, 'Order for this cart not exist');
    }

    const cart = await this.cart.findOne({
      where: { cartId },
      relations: ['cartArticles'],
    });
    if (!cart) {
      throw new ApiResponse('error', -7002, 'Cart not found');
    }

    if (cart.cartArticles.length === 0) {
      throw new ApiResponse('error', -7003, 'Cart is empty');
    }
    const newOrder: Order = new Order();
    newOrder.cartId = cartId;
    newOrder.userId = userId;
    const savedOrder = await this.order.save(newOrder);

    cart.createdAt = new Date();
    cart.userId = userId;
    console.log(userId + 'OrderServiceUSId');
    await this.cart.save(cart);

    return await this.getById(savedOrder.orderId);
  }

  async getById(orderId: number) {
    return await this.order.findOne({
      where: { orderId },
      relations: [
        'cart',
        'cart.user',
        'cart.cartArticles',
        'cart.cartArticles.article',
        'cart.cartArticles.article.category',
        'cart.cartArticles.article.articlePrices',
      ],
    });
  }

  async getAll() {
    return await this.order.find({
      relations: [
        'cart',
        'cart.user',
        'cart.cartArticles',
        'cart.cartArticles.article',
        'cart.cartArticles.article.category',
        'cart.cartArticles.article.articlePrices',
      ],
    });
  }

  async getAllByUserId(userId: number) {
    return await this.order.find({
      where: { userId },
      relations: [
        'cart',
        'cart.user',
        'cart.cartArticles',
        'cart.cartArticles.article',
        'cart.cartArticles.article.category',
        'cart.cartArticles.article.articlePrices',
      ],
    });
  }

  async changeStatus(
    orderId: number,
    newStatus: 'accepted' | 'rejected' | 'pending' | 'send',
  ) {
    const order = await this.getById(orderId);

    if (!order) {
      return new ApiResponse('error', -9001, 'No such order found');
    }

    order.status = newStatus;

    await this.order.save(order);

    return await this.getById(orderId);
  }
}
