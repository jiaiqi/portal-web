import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { SpecialService } from './special.service';
import { SpecialController } from './special.controller';
import { SpecialEntity } from './entities/special.entity';

@Module({
  imports: [TypeOrmModule.forFeature([SpecialEntity])],
  controllers: [SpecialController],
  providers: [SpecialService],
  exports: [SpecialService],
})
export class SpecialModule {}
