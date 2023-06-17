import {
  Column,
  CreateDateColumn,
  DeleteDateColumn,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';

export abstract class CustomBaseEntity {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @CreateDateColumn()
  createdAt: Date;

  @UpdateDateColumn({ nullable: true })
  updatedAt: Date;

  @DeleteDateColumn({ nullable: true })
  deletedAt: Date;

  @Column({ type: 'varchar', length: 36, nullable: true })
  createdBy: string;

  @Column({ type: 'varchar', length: 36, nullable: true })
  updatedBy: string;

  @Column({ type: 'varchar', length: 36, nullable: true })
  deletedBy: string;
}
