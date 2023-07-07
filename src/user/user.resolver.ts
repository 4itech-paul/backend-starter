import { Inject, forwardRef } from '@nestjs/common';
import {
  Args,
  ID,
  Mutation,
  Parent,
  Query,
  ResolveField,
  Resolver,
} from '@nestjs/graphql';
import { Maybe } from 'graphql/jsutils/Maybe';
import { PostLoader } from 'src/post/post.loader';

import { PostService } from '../post/post.service';
import { PostType } from '../post/type/post.type';
import { UserArgs } from './args/user.args';
import { CreateUserInput } from './input/create-user.input';
import { UpdateUserInput } from './input/update-user.input';
import { CreateUserOutput } from './output/create-user.output';
import { RemoveUserOutput } from './output/remove-user.output';
import { UpdateUserOutput } from './output/update-user.output';
import { UserType } from './type/user.type';
import { UserLoader } from './user.loader';
import { UserService } from './user.service';

@Resolver(() => UserType)
export class UserResolver {
  constructor(
    private readonly userService: UserService,
    private readonly userLoaderService: UserLoader,
    private readonly postLoaderService: PostLoader,

    @Inject(forwardRef(() => PostService))
    private readonly postService: PostService,
  ) {}

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
    return this.userLoaderService.getIdLoader().load(id);
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

  @ResolveField(() => [PostType])
  posts(@Parent() { id }: UserType): Promise<Maybe<PostType[]>> {
    return this.postLoaderService.getUserIdLoader().load(id);
  }
}
