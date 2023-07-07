import { Field, ID, InputType } from '@nestjs/graphql';

@InputType()
export class CreatePostInput {
  @Field(() => String)
  title!: string;

  @Field(() => String)
  content!: string;

  @Field(() => ID)
  userId!: string;
}
