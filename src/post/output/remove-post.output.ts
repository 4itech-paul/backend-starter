import { Field, ObjectType } from '@nestjs/graphql';

import { PostType } from '../type/post.type';

@ObjectType()
export class RemovePostOutput {
  @Field(() => PostType)
  post!: PostType;
}
