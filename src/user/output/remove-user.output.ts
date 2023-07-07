import { Field, ObjectType } from '@nestjs/graphql';

import { UserType } from '../type/user.type';

@ObjectType()
export class RemoveUserOutput {
  @Field(() => UserType)
  user!: UserType;
}
