import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { NoticeService } from './notice.service';
import { NoticeEntity } from './entities/notice.entity';

@Module({
  imports: [TypeOrmModule.forFeature([NoticeEntity])],
  providers: [NoticeService],
  exports: [NoticeService],
})
export class NoticeModule {}
