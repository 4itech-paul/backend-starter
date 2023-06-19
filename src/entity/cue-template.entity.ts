import { Column, Entity, JoinColumn, OneToMany, OneToOne } from 'typeorm';
import { CustomBaseEntity } from './custom-base.entity';
import { OrganizationProfile } from './organization-profile.entity';
import { EnterPriseGroup } from './enterprise-group.entity';
import { MediaServiceKind } from 'src/enum/media-service-kind.enum';
import { ServiceLine } from './service-line.entity';

@Entity()
export class CueTemplate extends CustomBaseEntity {
  @Column({ type: 'enum', enum: MediaServiceKind })
  mediaServiceKind: string;

  @Column({ type: 'varchar', length: 36 })
  title: string;

  @Column({ type: 'varchar', length: 36 })
  channel: string;

  @Column({ type: 'varchar', length: 36 })
  platform: Date;

  @Column({ type: 'varchar', length: 36 })
  adCategory: string;

  @Column({ type: 'date', nullable: true })
  adStartAt: Date;

  @Column({ type: 'date', nullable: true })
  adEndAt: Date;

  @Column({ type: 'varchar', length: 36 })
  totalCost: number;

  @Column({ type: 'varchar', length: 36 })
  accountsReceivable: number;

  @Column({ type: 'varchar', length: 36 })
  customerSignAmount: number;

  @Column({ type: 'jsonb' })
  customColumn: JSON;

  @OneToOne(() => ServiceLine, (serviceLine) => serviceLine.cueTemplate)
  serviceLine: ServiceLine;
}
