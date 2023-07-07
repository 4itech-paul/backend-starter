import { Field, Int, ObjectType } from '@nestjs/graphql';

@ObjectType()
export class UpdatePostOutput {
  @Field(() => Int, { nullable: true })
  affectedCount?: number;
}
