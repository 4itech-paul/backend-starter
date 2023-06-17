import { OrganizationRevisionStatus } from 'src/enum/organization-revision-status.enum';
import { Column, Entity, JoinColumn, ManyToOne } from 'typeorm';
import { CustomBaseEntity } from './custom-base.entity';
import { OrganizationProfile } from './organization-profile.entity';
import { Organization } from './organization.entity';

@Entity('organization_revision')
export class OrganizationRevision extends CustomBaseEntity {
  @Column({ type: 'varchar', length: 36 })
  version: string;

  @Column({ type: 'varchar', length: 36 })
  relationId: string;

  @Column({ type: 'enum', enum: OrganizationRevisionStatus })
  status: OrganizationRevisionStatus;

  @ManyToOne(
    () => Organization,
    (organization) => organization.organizationRevisions,
  )
  @JoinColumn({ name: 'organizationId' })
  organization: Organization;

  @ManyToOne(
    () => OrganizationProfile,
    (organizationProfile) => organizationProfile.organizationRevisions,
  )
  @JoinColumn({ name: 'organizationProfileId' })
  organizationProfile: OrganizationProfile;
}
