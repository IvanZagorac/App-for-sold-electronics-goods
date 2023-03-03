import {
  Column,
  Entity,
  PrimaryGeneratedColumn,
} from "typeorm";
import *  as Validator from 'class-validator'


@Entity("administrator_token", { schema: "web_app" })
export class AdministratorToken {
  @PrimaryGeneratedColumn({ type: "int", name: "administrator_token_id", unsigned: true })
  administratorTokenId: number;

  @Column("int", { name: "administrator_id", unique: true})
  administratorId: number;

  @Column("timestamp", { name: "created_at"})
  createdAt: string;

  @Column("text", { name: "token"})
  @Validator.IsNotEmpty()
  @Validator.IsString()
  token: string;

  @Column("datetime", { name: "expires_at"})
  expiresAt: string;

  @Column( {type:"tinyint", name: "is_valid",default:1})
  @Validator.IsNotEmpty()
  @Validator.IsIn([0,1])
  isValid: number;



}
