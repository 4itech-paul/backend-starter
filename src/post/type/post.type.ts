import { Field, ObjectType } from '@nestjs/graphql';
import { GraphNode } from 'src/common/graph-node.type';

@ObjectType('Post', {
  implements: [GraphNode],
})
export class PostType extends GraphNode {
  @Field(() => String)
  title!: string;

  @Field(() => String)
  content!: string;
}
