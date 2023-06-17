import { ConditionRemark } from 'src/enum/condition-remark.enum';
import { ReceiptDays } from 'src/enum/receipt-days.enum';
import { Column, Entity, JoinColumn, OneToMany, OneToOne } from 'typeorm';
import { CustomBaseEntity } from './custom-base.entity';
import { CustomerAgency } from './customer-agency.entity';
import { CustomerContact } from './customer-contact.entity';
import { CustomerFinanceContact } from './customer-finance-contact.entity';
import { CustomerInvoiceTarget } from './customer-invoice-target.entity';
import { CustomerReceiptTarget } from './customer-receipt-target.entity';
import { OrganizationProfile } from './organization-profile.entity';

@Entity('customer')
export class Customer extends CustomBaseEntity {
  @Column({ type: 'varchar', length: 36 })
  alias: string;

  @Column({ type: 'varchar', length: 36 })
  parentGroupCustomerId: string;

  @Column({ type: 'varchar', length: 36 })
  productKind: string;

  @Column({ type: 'boolean', default: true })
  isAgency: boolean;

  @Column({ type: 'boolean', default: true })
  isTransparent: boolean;

  @Column({ type: 'boolean', default: true })
  poNumberRequired: boolean;

  @Column({ type: 'varchar', length: 100 })
  address: string;

  @Column({ type: 'boolean', default: true })
  isIntercompany: boolean;

  @Column({ type: 'varchar', length: 100 })
  commissionNote: string;

  @Column({ type: 'enum', enum: ReceiptDays })
  receiptDays: ReceiptDays;

  @Column({ type: 'varchar', length: 36 })
  receiptDaysNote: string;

  @Column({ type: 'enum', enum: ConditionRemark })
  conditionRemark: ConditionRemark;

  @OneToOne(
    () => OrganizationProfile,
    (organizationProfile) => organizationProfile.customer,
  )
  @JoinColumn({ name: 'organization_profile_id' })
  organizationProfile: string;

  @OneToMany(() => CustomerContact, (contact) => contact.customer)
  contacts: CustomerContact[];

  @OneToMany(
    () => CustomerInvoiceTarget,
    (invoiceTarget) => invoiceTarget.customer,
  )
  invoiceTargets: CustomerInvoiceTarget[];

  @OneToMany(
    () => CustomerReceiptTarget,
    (receiptTarget) => receiptTarget.customer,
  )
  receiptTargets: CustomerReceiptTarget[];

  @OneToMany(() => CustomerAgency, (agency) => agency.customer)
  agencies: CustomerAgency[];

  @OneToMany(() => CustomerFinanceContact, (agency) => agency.customer)
  financeContacts: CustomerFinanceContact[];
}
