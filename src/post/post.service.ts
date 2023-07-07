import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Post } from 'src/entity/post.entity';
import { In, Repository } from 'typeorm';

import { PostArgs } from './args/post.args';
import { CreatePostInput } from './input/create-post.input';
import { UpdatePostInput } from './input/update-post.input';
import { CreatePostOutput } from './output/create-post.output';
import { RemovePostOutput } from './output/remove-post.output';
import { UpdatePostOutput } from './output/update-post.output';

@Injectable()
export class PostService {
  constructor(
    @InjectRepository(Post)
    private readonly postRepository: Repository<Post>,
  ) {}

  async createPost(input: CreatePostInput): Promise<CreatePostOutput> {
    const post = await this.postRepository.save(input);
    return { post };
  }

  findByPostArgs(args: PostArgs): Promise<Post[]> {
    return this.postRepository.findBy(args);
  }

  findById(id: string): Promise<Post | null> {
    return this.postRepository.findOneBy({ id });
  }

  findByIds(ids: string[]): Promise<Post[]> {
    return this.postRepository.findBy({ id: In(ids) });
  }

  findByUserIds(ids: string[]): Promise<Post[]> {
    return this.postRepository.findBy({ userId: In(ids) });
  }

  async updatePost(
    id: string,
    updatePostInput: UpdatePostInput,
  ): Promise<UpdatePostOutput> {
    const updateResult = await this.postRepository.update(id, updatePostInput);

    return {
      affectedCount: updateResult.affected,
    };
  }

  async removePost(id: string): Promise<RemovePostOutput> {
    return {
      post: await this.postRepository.softRemove({
        id,
      }),
    };
  }
}
