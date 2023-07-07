// user-loader.service.ts
import { Injectable, Scope } from '@nestjs/common';
import * as DataLoader from 'dataloader';
import { Maybe } from 'graphql/jsutils/Maybe';
import { Post } from 'src/entity/post.entity';

import { PostService } from './post.service';

@Injectable({ scope: Scope.REQUEST })
export class PostLoader {
  private idLoader?: DataLoader<string, Maybe<Post>>;
  private userIdLoader?: DataLoader<string, Maybe<Post[]>>;

  constructor(private readonly postService: PostService) {}

  getIdLoader(): DataLoader<string, Maybe<Post>> {
    if (!this.idLoader) {
      this.idLoader = new DataLoader(async (keys: string[]) => {
        const posts = await this.postService.findByIds(keys);
        const postsMap = new Map(posts.map((post) => [post.id, post]));
        return keys.map((key) => postsMap.get(key));
      });
    }
    return this.idLoader;
  }

  getUserIdLoader(): DataLoader<string, Maybe<Post[]>> {
    if (!this.userIdLoader) {
      this.userIdLoader = new DataLoader(async (keys: string[]) => {
        const posts = await this.postService.findByUserIds(keys);
        return keys.map((key) => posts.filter(({ userId }) => key === userId));
      });
    }
    return this.userIdLoader;
  }
}
