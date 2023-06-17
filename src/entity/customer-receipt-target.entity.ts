import { Column, Entity, JoinColumn, ManyToOne } from 'typeorm';
import { CustomBaseEntity } from './custom-base.entity';
import { Customer } from './customer.entity';

@Entity('customer_receipt_target')
export class CustomerReceiptTarget extends CustomBaseEntity {
  @Column({ type: 'varchar', length: 36 })
  name: string;

  @Column({ type: 'varchar', length: 100 })
  legalPersonIdentity: string;

  @Column({ type: 'varchar', length: 100 })
  invoiceTitle: string;

  @Column({ type: 'varchar', length: 100 })
  englishName: string;

  @Column({ type: 'boolean' })
  hasForeignParentCompany: boolean;

  @Column({ type: 'varchar', length: 100 })
  foreignParentCompanyName: string;

  @Column({ type: 'varchar', length: 100 })
  foreignParentCompanyAddress: string;

  @ManyToOne(() => Customer, (customer) => customer.receiptTargets)
  @JoinColumn({ name: 'customer_id' })
  customer: Customer;
}
