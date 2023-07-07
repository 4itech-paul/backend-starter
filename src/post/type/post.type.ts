import { Field, ID, ObjectType } from '@nestjs/graphql';
import { GraphNode } from 'src/common/graph-node.type';
import { UserType } from 'src/user/type/user.type';

@ObjectType('Post', {
  implements: [GraphNode],
})
export class PostType extends GraphNode {
  @Field(() => String)
  title!: string;

  @Field(() => String)
  content!: string;

  @Field(() => ID)
  userId!: string;

  // TODO: study user required
  @Field(() => UserType, { nullable: true })
  user?: UserType;
}
