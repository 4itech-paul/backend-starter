import { Column, Entity, JoinColumn, ManyToOne } from 'typeorm';
import { CustomBaseEntity } from './custom-base.entity';
import { Vendor } from './vendor.entity';

@Entity('vendor_finance_contact')
export class VendorFinanceContact extends CustomBaseEntity {
  @Column({ type: 'varchar', length: 36 })
  name: string;

  @Column({ type: 'varchar', length: 36 })
  fax: string;

  @Column({ type: 'varchar', length: 36 })
  phone: string;

  @Column({ type: 'varchar', length: 36 })
  email: string;

  @ManyToOne(() => Vendor, (vendor) => vendor.financeContacts)
  @JoinColumn({ name: 'vendor_id' })
  vendor: Vendor;
}
