import { Column, Entity, JoinColumn, ManyToOne } from 'typeorm';
import { CustomBaseEntity } from './custom-base.entity';
import { Customer } from './customer.entity';

@Entity('customer_invoice_target')
export class CustomerInvoiceTarget extends CustomBaseEntity {
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

  @ManyToOne(() => Customer, (customer) => customer.invoiceTargets)
  @JoinColumn({ name: 'customer_id' })
  customer: Customer;
}
