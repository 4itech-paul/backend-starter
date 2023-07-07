import { ArgsType, Field, ID } from '@nestjs/graphql';

@ArgsType()
export class PostArgs {
  @Field(() => String, { nullable: true })
  title?: string;

  @Field(() => ID, { nullable: true })
  userId?: string;
}
