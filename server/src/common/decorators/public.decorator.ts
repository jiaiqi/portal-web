import { SetMetadata, UseGuards } from '@nestjs/common';
import { ApiBearerAuth } from '@nestjs/swagger';
import { AuthGuard } from 'src/common/guards/auth.guard';

export const Public = () => SetMetadata('isPublic', true);

export const PublicApi = () => {
  const decorators = [
    Public(),
    ApiBearerAuth(),
  ];
  return (target, propertyKey, descriptor) => {
    decorators.forEach((decorator) => {
      decorator(target, propertyKey, descriptor);
    });
  };
};
