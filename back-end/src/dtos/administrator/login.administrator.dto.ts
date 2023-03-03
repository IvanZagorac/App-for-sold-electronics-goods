import * as Validator from "class-validator";

export class LoginAdministratorDto{
      @Validator.IsNotEmpty()
      @Validator.IsString()
      @Validator.Length(5,128)
      username:string;
      @Validator.IsNotEmpty()
      @Validator.IsString()
      @Validator.Length(6,128)
      password:string;
}