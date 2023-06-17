import { Column, Entity, JoinColumn, ManyToOne } from 'typeorm';
import { CustomBaseEntity } from './custom-base.entity';
import { Customer } from './customer.entity';

@Entity()
export class CustomerContact extends CustomBaseEntity {
  @Column({ type: 'varchar', length: 36 })
  name: string;

  @Column({ type: 'varchar', length: 36 })
  fax: string;

  @Column({ type: 'varchar', length: 36 })
  phone: string;

  @Column({ type: 'varchar', length: 36 })
  email: string;

  @ManyToOne(() => Customer, (customer) => customer.contacts)
  @JoinColumn({ name: 'customer_id' })
  customer: Customer;
}
