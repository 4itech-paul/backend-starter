import { Column, Entity, OneToOne } from 'typeorm';
import { ServiceLine } from './service-line.entity';
import { CustomBaseEntity } from './custom-base.entity';

@Entity()
export class EnterPriseGroup extends CustomBaseEntity {
  @Column({ type: 'varchar', length: 36 })
  name: string;

  @OneToOne(() => ServiceLine, (serviceLine) => serviceLine.enterpriseGroup)
  serviceLine: ServiceLine;
}
