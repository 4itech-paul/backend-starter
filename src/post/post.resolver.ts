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

import { UserType } from '../user/type/user.type';
import { UserService } from '../user/user.service';
import { PostArgs } from './args/post.args';
import { CreatePostInput } from './input/create-post.input';
import { UpdatePostInput } from './input/update-post.input';
import { CreatePostOutput } from './output/create-post.output';
import { RemovePostOutput } from './output/remove-post.output';
import { UpdatePostOutput } from './output/update-post.output';
import { PostService } from './post.service';
import { PostType } from './type/post.type';

@Resolver(() => PostType)
export class PostResolver {
  constructor(
    @Inject(forwardRef(() => UserService))
    private readonly userService: UserService,
    private readonly postService: PostService,
  ) {}

  @Mutation(() => CreatePostOutput)
  async createPost(
    @Args('input') input: CreatePostInput,
  ): Promise<CreatePostOutput> {
    return this.postService.createPost(input);
  }

  @Query(() => [PostType])
  posts(@Args() args: PostArgs): Promise<Maybe<PostType[]>> {
    return this.postService.findByPostArgs(args);
  }

  @Query(() => PostType)
  post(@Args('id', { type: () => ID }) id: string): Promise<Maybe<PostType>> {
    return this.postService.findById(id);
  }

  @Mutation(() => UpdatePostOutput)
  updatePost(
    @Args('input') input: UpdatePostInput,
  ): Promise<Maybe<UpdatePostOutput>> {
    return this.postService.updatePost(input.id, input);
  }

  @Mutation(() => RemovePostOutput)
  removePost(
    @Args('id', { type: () => ID }) id: string,
  ): Promise<Maybe<RemovePostOutput>> {
    return this.postService.removePost(id);
  }

  @ResolveField(() => UserType)
  user(@Parent() { userId }: PostType): Promise<Maybe<UserType>> {
    return this.userService.findById(userId);
  }
}
