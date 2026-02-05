import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { FocusService } from './focus.service';
import { FocusEntity } from './entities/focus.entity';

@Module({
  imports: [TypeOrmModule.forFeature([FocusEntity])],
  providers: [FocusService],
  exports: [FocusService],
})
export class FocusModule {}
