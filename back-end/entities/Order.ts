import {
  Column,
  Entity,
  Index,
  JoinColumn, ManyToOne,
  OneToOne,
  PrimaryGeneratedColumn
} from "typeorm";
import { Cart } from "./Cart";
import *  as Validator from 'class-validator'
import { User } from "./User";

@Index("uq_order_cart_id", ["cartId"], { unique: true })
@Entity("order", { schema: "web_app" })
export class Order {
  @PrimaryGeneratedColumn({ type: "int", name: "order_id", unsigned: true })
  orderId: number;

  @Column("timestamp", {
    name: "created_at",
    default: () => "CURRENT_TIMESTAMP",
  })
  createdAt: Date;

  @Column("int", { name: "cart_id", unique: true, unsigned: true })
  cartId: number;

  @Column("int", { name: "user_id", unique: true, unsigned: true })
  userId: number;

  @Column("enum", {
    name: "status",
    enum: ["rejected", "accepted", "send", "pending"],
    default: () => "'pending'",
  })
  @Validator.IsNotEmpty()
  @Validator.IsString()
  @Validator.IsIn(["rejected" , "accepted" , "send" , "pending"])
  status: "rejected" | "accepted" | "send" | "pending";

  @OneToOne(() => Cart, (cart) => cart.order, {
    onDelete: "RESTRICT",
    onUpdate: "CASCADE",
  })

  @JoinColumn([{ name: "cart_id", referencedColumnName: "cartId" }])
  cart: Cart;

  @ManyToOne(() => User, (user) => user.orders, {
    onDelete: 'RESTRICT',
    onUpdate: 'CASCADE',
  })

  @JoinColumn([{ name: 'user_id', referencedColumnName: 'userId' }])
  user: User;
}
