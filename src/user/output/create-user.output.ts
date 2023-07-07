import { Field, ObjectType } from '@nestjs/graphql';

import { UserType } from '../type/user.type';

@ObjectType()
export class CreateUserOutput {
  @Field(() => UserType)
  user!: UserType;
}
