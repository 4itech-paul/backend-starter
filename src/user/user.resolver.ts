import { Args, ID, Mutation, Query, Resolver } from '@nestjs/graphql';
import { Maybe } from 'graphql/jsutils/Maybe';

import { UserArgs } from './args/user.args';
import { CreateUserInput } from './input/create-user.input';
import { UpdateUserInput } from './input/update-user.input';
import { CreateUserOutput } from './output/create-user.output';
import { RemoveUserOutput } from './output/remove-user.output';
import { UpdateUserOutput } from './output/update-user.output';
import { UserType } from './type/user.type';
import { UserService } from './user.service';

@Resolver(() => UserType)
export class UserResolver {
  constructor(private readonly userService: UserService) {}

  @Mutation(() => CreateUserOutput)
  async createUser(
    @Args('input') input: CreateUserInput,
  ): Promise<CreateUserOutput> {
    return this.userService.createUser(input);
  }

  @Query(() => [UserType])
  users(@Args() args: UserArgs): Promise<Maybe<UserType[]>> {
    return this.userService.findByUserArgs(args);
  }

  @Query(() => UserType)
  user(@Args('id', { type: () => ID }) id: string): Promise<Maybe<UserType>> {
    return this.userService.findById(id);
  }

  @Mutation(() => UpdateUserOutput)
  updateUser(@Args('input') input: UpdateUserInput): Promise<UpdateUserOutput> {
    return this.userService.updateUser(input.id, input);
  }

  @Mutation(() => RemoveUserOutput)
  removeUser(
    @Args('id', { type: () => ID }) id: string,
  ): Promise<RemoveUserOutput> {
    return this.userService.removeUser(id);
  }
}
