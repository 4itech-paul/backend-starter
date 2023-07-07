import { Field, ID, InterfaceType } from '@nestjs/graphql';

/**
 * @link https://graphql.org/learn/global-object-identification/
 */
@InterfaceType('Node')
export abstract class GraphNode {
  @Field(() => ID)
  id!: string;
}
