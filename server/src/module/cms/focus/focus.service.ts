import { Injectable, NotFoundException, BadRequestException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { FocusEntity } from './entities/focus.entity';
import { FocusHistoryEntity } from './entities/focus-history.entity';
import {
  UpdateFocusDto,
  FocusListDto,
  FocusHistoryListDto,
  RestoreFocusDto,
} from './dto/focus.dto';

@Injectable()
export class FocusService {
  constructor(
    @InjectRepository(FocusEntity)
    private focusRepository: Repository<FocusEntity>,
    @InjectRepository(FocusHistoryEntity)
    private focusHistoryRepository: Repository<FocusHistoryEntity>,
  ) {}

  /**
   * 获取焦点图列表
   */
  async findList(query: FocusListDto) {
    const { pageNum = 1, pageSize = 10 } = query;

    const queryBuilder = this.focusRepository.createQueryBuilder('focus');
    queryBuilder.orderBy('focus.sortOrder', 'ASC');

    const [list, total] = await queryBuilder
      .skip((pageNum - 1) * pageSize)
      .take(pageSize)
      .getManyAndCount();

    return {
      list,
      total,
      pageNum,
      pageSize,
    };
  }

  /**
   * 获取所有焦点图（用于前端展示）
   */
  async findAll() {
    return this.focusRepository.find({
      order: { sortOrder: 'ASC' },
    });
  }

  /**
   * 获取焦点图详情
   */
  async findById(id: number) {
    const focus = await this.focusRepository.findOne({
      where: { focusId: id },
    });

    if (!focus) {
      throw new NotFoundException('焦点图不存在');
    }

    return focus;
  }

  /**
   * 更新焦点图
   */
  async update(dto: UpdateFocusDto, userId: string) {
    const { focusId, remark, ...updateData } = dto;

    const focus = await this.findById(focusId);

    // 保存历史记录
    await this.saveHistory(focus, userId, remark);

    // 更新数据
    Object.assign(focus, updateData);
    focus.updateBy = userId;

    await this.focusRepository.save(focus);
    return focus;
  }

  /**
   * 保存历史记录
   */
  private async saveHistory(focus: FocusEntity, userId: string, remark?: string) {
    const history = this.focusHistoryRepository.create({
      focusId: focus.focusId,
      focusKey: focus.focusKey,
      focusName: focus.focusName,
      imageUrl: focus.imageUrl,
      imageSourceType: focus.imageSourceType,
      linkType: focus.linkType,
      linkValue: focus.linkValue,
      openType: focus.openType,
      remark: remark || '自动保存',
      createBy: userId,
    });

    await this.focusHistoryRepository.save(history);
  }

  /**
   * 获取历史记录列表
   */
  async findHistoryList(query: FocusHistoryListDto) {
    const { focusId, pageNum = 1, pageSize = 10 } = query;

    const queryBuilder = this.focusHistoryRepository.createQueryBuilder('history');
    queryBuilder.where('history.focusId = :focusId', { focusId });
    queryBuilder.orderBy('history.createTime', 'DESC');

    const [list, total] = await queryBuilder
      .skip((pageNum - 1) * pageSize)
      .take(pageSize)
      .getManyAndCount();

    return {
      list,
      total,
      pageNum,
      pageSize,
    };
  }

  /**
   * 从历史记录恢复
   */
  async restoreFromHistory(dto: RestoreFocusDto, userId: string) {
    const { historyId, remark } = dto;

    const history = await this.focusHistoryRepository.findOne({
      where: { historyId },
    });

    if (!history) {
      throw new NotFoundException('历史记录不存在');
    }

    const focus = await this.findById(history.focusId);

    // 保存当前状态到历史
    await this.saveHistory(focus, userId, `恢复前自动备份 - ${remark || ''}`);

    // 从历史记录恢复
    focus.imageUrl = history.imageUrl;
    focus.imageSourceType = history.imageSourceType;
    focus.linkType = history.linkType;
    focus.linkValue = history.linkValue;
    focus.openType = history.openType;
    focus.updateBy = userId;

    await this.focusRepository.save(focus);

    // 记录恢复操作
    await this.focusHistoryRepository.save({
      focusId: focus.focusId,
      focusKey: focus.focusKey,
      focusName: focus.focusName,
      imageUrl: focus.imageUrl,
      imageSourceType: focus.imageSourceType,
      linkType: focus.linkType,
      linkValue: focus.linkValue,
      openType: focus.openType,
      remark: `从历史版本恢复 - ${remark || ''}`,
      createBy: userId,
    });

    return focus;
  }

  /**
   * 删除历史记录
   */
  async deleteHistory(historyId: number) {
    const history = await this.focusHistoryRepository.findOne({
      where: { historyId },
    });

    if (!history) {
      throw new NotFoundException('历史记录不存在');
    }

    await this.focusHistoryRepository.remove(history);
    return { message: '删除成功' };
  }
}
