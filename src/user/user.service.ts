import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { In, Repository } from 'typeorm';

import { User } from '../entity/user.entity';
import { UserArgs } from './args/user.args';
import { CreateUserInput } from './input/create-user.input';
import { UpdateUserInput } from './input/update-user.input';
import { CreateUserOutput } from './output/create-user.output';
import { RemoveUserOutput } from './output/remove-user.output';
import { UpdateUserOutput } from './output/update-user.output';

@Injectable()
export class UserService {
  constructor(
    @InjectRepository(User)
    private readonly userRepository: Repository<User>,
  ) {}

  async createUser(input: CreateUserInput): Promise<CreateUserOutput> {
    const user = await this.userRepository.save(input);
    return { user };
  }

  findByUserArgs(args: UserArgs): Promise<User[]> {
    return this.userRepository.findBy(args);
  }

  findById(id: string): Promise<User | null> {
    return this.userRepository.findOneBy({ id });
  }

  findByIds(ids: string[]): Promise<User[]> {
    return this.userRepository.findBy({ id: In(ids) });
  }

  async updateUser(
    id: string,
    updateUserInput: UpdateUserInput,
  ): Promise<UpdateUserOutput> {
    const updateResult = await this.userRepository.update(id, updateUserInput);

    return {
      affectedCount: updateResult.affected,
    };
  }

  async removeUser(id: string): Promise<RemoveUserOutput> {
    return {
      user: await this.userRepository.softRemove({
        id,
      }),
    };
  }
}
