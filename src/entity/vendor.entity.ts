import { ConditionRemark } from 'src/enum/condition-remark.enum';
import { MediaServiceKind } from 'src/enum/media-service-kind.enum';
import { Column, Entity, JoinColumn, OneToMany, OneToOne } from 'typeorm';
import { CustomBaseEntity } from './custom-base.entity';
import { OrganizationProfile } from './organization-profile.entity';
import { VendorFinanceContact } from './vendor-finance-contact.entity';
import { VendorReceiptTarget } from './vendor-receipt-target.entity';
import { VendorTool } from './vendor-tool.entity';

@Entity('vendor')
export class Vendor extends CustomBaseEntity {
  @Column({ type: 'varchar', length: 255, nullable: false })
  alias: string;

  @Column({ type: 'boolean', default: true })
  isActive: boolean;

  @Column({ type: 'enum', enum: MediaServiceKind })
  mediaServiceKind: MediaServiceKind;

  @Column({ type: 'enum', enum: ConditionRemark })
  conditionRemark: ConditionRemark;

  @OneToOne(
    () => OrganizationProfile,
    (organizationProfile) => organizationProfile.vendor,
  )
  @JoinColumn({ name: 'organization_profile_id' })
  organizationProfile: OrganizationProfile;

  @OneToMany(() => VendorReceiptTarget, (receiptTarget) => receiptTarget.vendor)
  receiptTargets: VendorReceiptTarget[];

  @OneToMany(() => VendorReceiptTarget, (receiptTarget) => receiptTarget.vendor)
  invoiceTargets: VendorReceiptTarget[];

  @OneToMany(
    () => VendorFinanceContact,
    (financeContact) => financeContact.vendor,
  )
  financeContacts: VendorFinanceContact[];

  @OneToMany(() => VendorTool, (vendorTool) => vendorTool.vendor)
  vendorTools: VendorTool[];
}
