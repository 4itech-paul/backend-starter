import { Column, Entity, JoinColumn, OneToMany, OneToOne } from 'typeorm';
import { CustomBaseEntity } from './custom-base.entity';
import { OrganizationProfile } from './organization-profile.entity';
import { MediaServiceKind } from 'src/enum/media-service-kind.enum';
import { EnterPriseGroup } from './enterprise-group.entity';
import { CueTemplate } from './cue-template.entity';

@Entity()
export class ServiceLine extends CustomBaseEntity {
  @Column({ type: 'varchar', length: 36 })
  name: string;

  @Column({ type: 'varchar', length: 36 })
  systemNumber: string;

  @Column({ type: 'varchar', length: 36 })
  legalPersonIdentity: string;

  @Column({ type: 'enum', enum: MediaServiceKind })
  mediaServiceKind: string;

  @OneToMany(
    () => OrganizationProfile,
    (organizationProfile) => organizationProfile.serviceLine,
  )
  organizationProfile: OrganizationProfile[];

  @OneToOne(
    () => EnterPriseGroup,
    (enterpriseGroup) => enterpriseGroup.serviceLine,
  )
  @JoinColumn({ name: 'enterprise_group_id' })
  enterpriseGroup: EnterPriseGroup;

  @OneToOne(() => CueTemplate, (cueTemplate) => cueTemplate.serviceLine)
  @JoinColumn({ name: 'cue_template_id' })
  cueTemplate: CueTemplate;
}
