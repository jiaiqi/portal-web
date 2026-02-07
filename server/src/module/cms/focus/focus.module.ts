import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { FocusService } from './focus.service';
import { FocusController } from './focus.controller';
import { FocusEntity } from './entities/focus.entity';

@Module({
  imports: [TypeOrmModule.forFeature([FocusEntity])],
  controllers: [FocusController],
  providers: [FocusService],
  exports: [FocusService],
})
export class FocusModule {}
