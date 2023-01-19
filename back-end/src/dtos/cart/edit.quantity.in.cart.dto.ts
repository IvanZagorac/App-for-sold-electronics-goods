import * as Validator from "class-validator";

export class EditQuantityInCartDto{
  @Validator.IsNotEmpty()
  @Validator.IsNumber({
    allowInfinity:false,
    allowNaN:false,
    maxDecimalPlaces:0
  })
  quantity:number;
  articleId:number;
}