// user-loader.service.ts
import { Injectable, Scope } from '@nestjs/common';
import * as DataLoader from 'dataloader';
import { Maybe } from 'graphql/jsutils/Maybe';
import { User } from 'src/entity/user.entity';

import { UserService } from './user.service';

@Injectable({ scope: Scope.REQUEST })
export class UserLoader {
  private idLoader?: DataLoader<string, Maybe<User>>;

  constructor(private readonly userService: UserService) {}

  getIdLoader(): DataLoader<string, Maybe<User>> {
    if (!this.idLoader) {
      this.idLoader = new DataLoader(async (keys: string[]) => {
        const users = await this.userService.findByIds(keys);
        const usersMap = new Map(users.map((user) => [user.id, user]));
        return keys.map((key) => usersMap.get(key));
      });
    }
    return this.idLoader;
  }
}
