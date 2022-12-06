import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { NestExpressApplication } from "@nestjs/platform-express";
import { StorageConfig } from "../config/storage.config";
import { ValidationPipe } from "@nestjs/common";
const cors=require("cors");

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule);

  app.useStaticAssets(StorageConfig.photo.destination,{
    prefix:StorageConfig.photo.urlPrefix,
    maxAge:1000*60*60*24*7,
    index:false,
  });

  app.use(cors())

  app.useGlobalPipes(new ValidationPipe())

  app.enableCors();
  await app.listen(3000);
}
bootstrap();
