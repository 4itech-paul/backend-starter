import { Column, Entity } from 'typeorm';
import { CustomBaseEntity } from './custom-base.entity';

@Entity()
export class Platform extends CustomBaseEntity {
  @Column({ type: 'varchar', length: 36 })
  name: string;
}
