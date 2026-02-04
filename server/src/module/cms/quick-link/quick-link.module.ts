import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { QuickLinkService } from './quick-link.service';
import { QuickLinkController } from './quick-link.controller';
import { QuickLinkEntity } from './entities/quick-link.entity';

@Module({
  imports: [TypeOrmModule.forFeature([QuickLinkEntity])],
  controllers: [QuickLinkController],
  providers: [QuickLinkService],
  exports: [QuickLinkService],
})
export class QuickLinkModule {}
