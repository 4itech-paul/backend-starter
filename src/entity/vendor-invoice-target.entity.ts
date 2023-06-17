import { Column, Entity, JoinColumn, ManyToOne } from 'typeorm';
import { CustomBaseEntity } from './custom-base.entity';
import { Vendor } from './vendor.entity';

@Entity('vendor_invoice_target')
export class VendorInvoiceTarget extends CustomBaseEntity {
  @Column({ type: 'varchar', length: 255 })
  condition: string;

  @Column({ type: 'varchar', length: 50 })
  bankName: string;

  @Column({ type: 'varchar', length: 100 })
  accountName: string;

  @Column({ type: 'varchar', length: 100 })
  accountNumber: string;

  @Column({ type: 'varchar', length: 100 })
  invoiceTitle: string;

  @ManyToOne(() => Vendor, (vendor) => vendor.invoiceTargets)
  @JoinColumn({ name: 'vendor_id' })
  vendor: Vendor;
}
