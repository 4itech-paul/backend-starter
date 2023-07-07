import { Field, Int, ObjectType } from '@nestjs/graphql';

@ObjectType()
export class UpdateUserOutput {
  @Field(() => Int, { nullable: true })
  affectedCount?: number;
}
