import { Module } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { OrganizationProfile } from './entity/organization-profile.entity';
import { OrganizationRevision } from './entity/organization-revision.entity';
import { Organization } from './entity/organization.entity';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    TypeOrmModule.forRootAsync({
      imports: [ConfigModule],
      inject: [ConfigService],
      useFactory: (configService: ConfigService) => ({
        type: 'postgres',
        host: configService.get('DB_HOST'),
        port: +configService.get('DB_PORT'),
        username: configService.get('DB_USERNAME'),
        password: configService.get('DB_PASSWORD'),
        database: configService.get('DB_NAME'),
        autoLoadEntities: true, // every entity registered through the forFeature() method will be automatically added to the entities array of the configuration object.
        synchronize: true, // Setting synchronize: true shouldn't be used in production - otherwise you can lose production data.
        logging: true, // Setting logging: true shouldn't be used in production - it's just for debugging purposes.
      }),
    }),
    TypeOrmModule.forFeature([
      Organization,
      OrganizationRevision,
      OrganizationProfile,
    ]),
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
