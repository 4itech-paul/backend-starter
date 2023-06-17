import { OrganizationKind } from 'src/enum/organization-kind.enum';
import { Column, Entity, OneToMany, OneToOne } from 'typeorm';
import { CustomBaseEntity } from './custom-base.entity';
import { Customer } from './customer.entity';
import { OrganizationRevision } from './organization-revision.entity';

@Entity('organization_profile')
export class OrganizationProfile extends CustomBaseEntity {
  @Column({ type: 'varchar', length: 36 })
  serviceLineId: string;

  @Column({ type: 'enum', enum: OrganizationKind })
  organizationKind: OrganizationKind;

  @OneToMany(
    () => OrganizationRevision,
    (organizationRevision) => organizationRevision.organizationProfile,
  )
  organizationRevisions: OrganizationRevision[];

  @OneToOne(() => Customer, (customer) => customer.organizationProfile)
  customer: Customer;
}
