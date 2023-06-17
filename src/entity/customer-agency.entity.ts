import { Column, Entity, JoinColumn, ManyToOne } from 'typeorm';
import { CustomBaseEntity } from './custom-base.entity';
import { Customer } from './customer.entity';

@Entity()
export class CustomerAgency extends CustomBaseEntity {
  @Column({ type: 'varchar', length: 36 })
  name: string;

  @Column({ type: 'varchar', length: 36 })
  legalPersonIdentity: string;

  @ManyToOne(() => Customer, (customer) => customer.agencies)
  @JoinColumn({ name: 'customer_id' })
  customer: Customer;
}
