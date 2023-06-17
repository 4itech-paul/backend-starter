import { Column, Entity, JoinColumn, ManyToOne } from 'typeorm';
import { CustomBaseEntity } from './custom-base.entity';
import { Vendor } from './vendor.entity';

@Entity('vendor_tool')
export class VendorTool extends CustomBaseEntity {
  @Column({ type: 'varchar', length: 100 })
  mediaTool: string;

  @Column({ type: 'varchar', length: 100 })
  platform: string;

  @ManyToOne(() => Vendor, (vendor) => vendor.vendorTools)
  @JoinColumn({ name: 'vendor_id' })
  vendor: Vendor;
}
