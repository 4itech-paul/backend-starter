import { Field, ID, ObjectType } from '@nestjs/graphql';
import { GraphNode } from 'src/common/graph-node.type';

@ObjectType('User', {
  implements: [GraphNode],
})
export class UserType extends GraphNode {
  @Field(() => ID)
  id!: string;

  @Field(() => String)
  name!: string;
}
