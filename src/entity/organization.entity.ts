import { Column, Entity, OneToMany } from 'typeorm';
import { CustomBaseEntity } from './custom-base.entity';
import { OrganizationRevision } from './organization-revision.entity';

@Entity('organization')
export class Organization extends CustomBaseEntity {
  @Column({ type: 'varchar', length: 36 })
  name: string;

  @Column({ type: 'boolean', default: true })
  isForeign: boolean;

  @Column({ type: 'varchar', length: 36 })
  systemNumber: string;

  @Column({ type: 'varchar', length: 36 })
  wanpieNumber: string;

  @Column({ type: 'varchar', length: 36 })
  individualIdentity: string;

  @Column({ type: 'varchar', length: 36 })
  legalPersonIdentity: string;

  @Column({ type: 'varchar', length: 36 })
  shortName: string;

  @OneToMany(
    () => OrganizationRevision,
    (organizationRevision) => organizationRevision.organization,
  )
  organizationRevision: OrganizationRevision[];
}
