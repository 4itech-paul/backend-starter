import { ArgsType, Field } from '@nestjs/graphql';

@ArgsType()
export class PostArgs {
  @Field(() => String, { nullable: true })
  title?: string;
}
