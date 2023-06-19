SELECT *
FROM current_schema() CREATE EXTENSION IF NOT EXISTS "uuid-ossp"
SELECT version();
START TRANSACTION
SELECT *
FROM current_schema()
SELECT *
FROM current_database()
SELECT "table_schema",
  "table_name"
FROM "information_schema"."tables"
WHERE (
    "table_schema" = 'public'
    AND "table_name" = 'customer_contact'
  )
  OR (
    "table_schema" = 'public'
    AND "table_name" = 'customer_finance_contact'
  )
  OR (
    "table_schema" = 'public'
    AND "table_name" = 'customer_invoice_target'
  )
  OR (
    "table_schema" = 'public'
    AND "table_name" = 'customer_receipt_target'
  )
  OR (
    "table_schema" = 'public'
    AND "table_name" = 'organization'
  )
  OR (
    "table_schema" = 'public'
    AND "table_name" = 'organization_revision'
  )
  OR (
    "table_schema" = 'public'
    AND "table_name" = 'vendor_finance_contact'
  )
  OR (
    "table_schema" = 'public'
    AND "table_name" = 'vendor_receipt_target'
  )
  OR (
    "table_schema" = 'public'
    AND "table_name" = 'vendor_tool'
  )
  OR (
    "table_schema" = 'public'
    AND "table_name" = 'vendor'
  )
  OR (
    "table_schema" = 'public'
    AND "table_name" = 'organization_profile'
  )
  OR (
    "table_schema" = 'public'
    AND "table_name" = 'customer'
  )
  OR (
    "table_schema" = 'public'
    AND "table_name" = 'customer_agency'
  )
  OR (
    "table_schema" = 'public'
    AND "table_name" = 'vendor_invoice_target'
  )
SELECT *
FROM "information_schema"."tables"
WHERE "table_schema" = 'public'
  AND "table_name" = 'typeorm_metadata' CREATE TABLE "customer_contact" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP NOT NULL DEFAULT now(),
    "updatedAt" TIMESTAMP DEFAULT now(),
    "deletedAt" TIMESTAMP,
    "createdBy" character varying(36),
    "updatedBy" character varying(36),
    "deletedBy" character varying(36),
    "name" character varying(36) NOT NULL,
    "fax" character varying(36) NOT NULL,
    "phone" character varying(36) NOT NULL,
    "email" character varying(36) NOT NULL,
    "customer_id" uuid,
    CONSTRAINT "PK_2595307eaefa572e332a43f8b88" PRIMARY KEY ("id")
  ) CREATE TABLE "customer_finance_contact" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP NOT NULL DEFAULT now(),
    "updatedAt" TIMESTAMP DEFAULT now(),
    "deletedAt" TIMESTAMP,
    "createdBy" character varying(36),
    "updatedBy" character varying(36),
    "deletedBy" character varying(36),
    "name" character varying(36) NOT NULL,
    "fax" character varying(36) NOT NULL,
    "phone" character varying(36) NOT NULL,
    "email" character varying(36) NOT NULL,
    "customer_id" uuid,
    CONSTRAINT "PK_0ff92368af5a74dd50055816d96" PRIMARY KEY ("id")
  ) CREATE TABLE "customer_invoice_target" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP NOT NULL DEFAULT now(),
    "updatedAt" TIMESTAMP DEFAULT now(),
    "deletedAt" TIMESTAMP,
    "createdBy" character varying(36),
    "updatedBy" character varying(36),
    "deletedBy" character varying(36),
    "condition" character varying(255) NOT NULL,
    "bankName" character varying(50) NOT NULL,
    "accountName" character varying(100) NOT NULL,
    "accountNumber" character varying(100) NOT NULL,
    "invoiceTitle" character varying(100) NOT NULL,
    "customer_id" uuid,
    CONSTRAINT "PK_a92e642f9ca82eae382b50c9a21" PRIMARY KEY ("id")
  ) CREATE TABLE "customer_receipt_target" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP NOT NULL DEFAULT now(),
    "updatedAt" TIMESTAMP DEFAULT now(),
    "deletedAt" TIMESTAMP,
    "createdBy" character varying(36),
    "updatedBy" character varying(36),
    "deletedBy" character varying(36),
    "name" character varying(36) NOT NULL,
    "legalPersonIdentity" character varying(100) NOT NULL,
    "invoiceTitle" character varying(100) NOT NULL,
    "englishName" character varying(100) NOT NULL,
    "hasForeignParentCompany" boolean NOT NULL,
    "foreignParentCompanyName" character varying(100) NOT NULL,
    "foreignParentCompanyAddress" character varying(100) NOT NULL,
    "customer_id" uuid,
    CONSTRAINT "PK_549d6f653326c123b2d1556ea73" PRIMARY KEY ("id")
  ) CREATE TABLE "organization" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP NOT NULL DEFAULT now(),
    "updatedAt" TIMESTAMP DEFAULT now(),
    "deletedAt" TIMESTAMP,
    "createdBy" character varying(36),
    "updatedBy" character varying(36),
    "deletedBy" character varying(36),
    "name" character varying(36) NOT NULL,
    "isForeign" boolean NOT NULL DEFAULT true,
    "systemNumber" character varying(36) NOT NULL,
    "wanpieNumber" character varying(36) NOT NULL,
    "individualIdentity" character varying(36) NOT NULL,
    "legalPersonIdentity" character varying(36) NOT NULL,
    "shortName" character varying(36) NOT NULL,
    CONSTRAINT "PK_472c1f99a32def1b0abb219cd67" PRIMARY KEY ("id")
  )
SELECT "n"."nspname",
  "t"."typname"
FROM "pg_type" "t"
  INNER JOIN "pg_namespace" "n" ON "n"."oid" = "t"."typnamespace"
WHERE "n"."nspname" = 'public'
  AND "t"."typname" = 'organization_revision_status_enum' CREATE TYPE "public"."organization_revision_status_enum" AS ENUM('customer', 'pending', 'rejected') CREATE TABLE "organization_revision" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP NOT NULL DEFAULT now(),
    "updatedAt" TIMESTAMP DEFAULT now(),
    "deletedAt" TIMESTAMP,
    "createdBy" character varying(36),
    "updatedBy" character varying(36),
    "deletedBy" character varying(36),
    "version" character varying(36) NOT NULL,
    "relationId" character varying(36) NOT NULL,
    "status" "public"."organization_revision_status_enum" NOT NULL,
    "organizationId" uuid,
    "organizationProfileId" uuid,
    CONSTRAINT "PK_b5a45f27fe7e30f8d50765323a7" PRIMARY KEY ("id")
  ) CREATE TABLE "vendor_finance_contact" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP NOT NULL DEFAULT now(),
    "updatedAt" TIMESTAMP DEFAULT now(),
    "deletedAt" TIMESTAMP,
    "createdBy" character varying(36),
    "updatedBy" character varying(36),
    "deletedBy" character varying(36),
    "name" character varying(36) NOT NULL,
    "fax" character varying(36) NOT NULL,
    "phone" character varying(36) NOT NULL,
    "email" character varying(36) NOT NULL,
    "vendor_id" uuid,
    CONSTRAINT "PK_f76dad7078898ba4e00739bcb4c" PRIMARY KEY ("id")
  ) CREATE TABLE "vendor_receipt_target" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP NOT NULL DEFAULT now(),
    "updatedAt" TIMESTAMP DEFAULT now(),
    "deletedAt" TIMESTAMP,
    "createdBy" character varying(36),
    "updatedBy" character varying(36),
    "deletedBy" character varying(36),
    "name" character varying(36) NOT NULL,
    "legalPersonIdentity" character varying(100) NOT NULL,
    "invoiceTitle" character varying(100) NOT NULL,
    "englishName" character varying(100) NOT NULL,
    "hasForeignParentCompany" boolean NOT NULL,
    "foreignParentCompanyName" character varying(100) NOT NULL,
    "foreignParentCompanyAddress" character varying(100) NOT NULL,
    "vendor_id" uuid,
    CONSTRAINT "PK_49b8e6ff6b0764b36e4d7dded52" PRIMARY KEY ("id")
  ) CREATE TABLE "vendor_tool" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP NOT NULL DEFAULT now(),
    "updatedAt" TIMESTAMP DEFAULT now(),
    "deletedAt" TIMESTAMP,
    "createdBy" character varying(36),
    "updatedBy" character varying(36),
    "deletedBy" character varying(36),
    "mediaTool" character varying(100) NOT NULL,
    "platform" character varying(100) NOT NULL,
    "vendor_id" uuid,
    CONSTRAINT "PK_b2aacc119a8b4a9a91a5135b72a" PRIMARY KEY ("id")
  )
SELECT "n"."nspname",
  "t"."typname"
FROM "pg_type" "t"
  INNER JOIN "pg_namespace" "n" ON "n"."oid" = "t"."typnamespace"
WHERE "n"."nspname" = 'public'
  AND "t"."typname" = 'vendor_mediaservicekind_enum'
SELECT "n"."nspname",
  "t"."typname"
FROM "pg_type" "t"
  INNER JOIN "pg_namespace" "n" ON "n"."oid" = "t"."typnamespace"
WHERE "n"."nspname" = 'public'
  AND "t"."typname" = 'vendor_conditionremark_enum' CREATE TYPE "public"."vendor_mediaservicekind_enum" AS ENUM('media', 'service') CREATE TYPE "public"."vendor_conditionremark_enum" AS ENUM('red', 'yellow', 'none') CREATE TABLE "vendor" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP NOT NULL DEFAULT now(),
    "updatedAt" TIMESTAMP DEFAULT now(),
    "deletedAt" TIMESTAMP,
    "createdBy" character varying(36),
    "updatedBy" character varying(36),
    "deletedBy" character varying(36),
    "alias" character varying(255) NOT NULL,
    "isActive" boolean NOT NULL DEFAULT true,
    "mediaServiceKind" "public"."vendor_mediaservicekind_enum" NOT NULL,
    "conditionRemark" "public"."vendor_conditionremark_enum" NOT NULL,
    "organization_profile_id" uuid,
    CONSTRAINT "REL_e496dafaa55d3f9efd1899a7e6" UNIQUE ("organization_profile_id"),
    CONSTRAINT "PK_931a23f6231a57604f5a0e32780" PRIMARY KEY ("id")
  )
SELECT "n"."nspname",
  "t"."typname"
FROM "pg_type" "t"
  INNER JOIN "pg_namespace" "n" ON "n"."oid" = "t"."typnamespace"
WHERE "n"."nspname" = 'public'
  AND "t"."typname" = 'organization_profile_organizationkind_enum' CREATE TYPE "public"."organization_profile_organizationkind_enum" AS ENUM('customer', 'vendor') CREATE TABLE "organization_profile" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP NOT NULL DEFAULT now(),
    "updatedAt" TIMESTAMP DEFAULT now(),
    "deletedAt" TIMESTAMP,
    "createdBy" character varying(36),
    "updatedBy" character varying(36),
    "deletedBy" character varying(36),
    "serviceLineId" character varying(36) NOT NULL,
    "organizationKind" "public"."organization_profile_organizationkind_enum" NOT NULL,
    CONSTRAINT "PK_a459f7af77cb9a0fd82286f661a" PRIMARY KEY ("id")
  )
SELECT "n"."nspname",
  "t"."typname"
FROM "pg_type" "t"
  INNER JOIN "pg_namespace" "n" ON "n"."oid" = "t"."typnamespace"
WHERE "n"."nspname" = 'public'
  AND "t"."typname" = 'customer_receiptdays_enum'
SELECT "n"."nspname",
  "t"."typname"
FROM "pg_type" "t"
  INNER JOIN "pg_namespace" "n" ON "n"."oid" = "t"."typnamespace"
WHERE "n"."nspname" = 'public'
  AND "t"."typname" = 'customer_conditionremark_enum' CREATE TYPE "public"."customer_receiptdays_enum" AS ENUM('45', '60', '90') CREATE TYPE "public"."customer_conditionremark_enum" AS ENUM('red', 'yellow', 'none') CREATE TABLE "customer" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP NOT NULL DEFAULT now(),
    "updatedAt" TIMESTAMP DEFAULT now(),
    "deletedAt" TIMESTAMP,
    "createdBy" character varying(36),
    "updatedBy" character varying(36),
    "deletedBy" character varying(36),
    "alias" character varying(36) NOT NULL,
    "parentGroupCustomerId" character varying(36) NOT NULL,
    "productKind" character varying(36) NOT NULL,
    "isAgency" boolean NOT NULL DEFAULT true,
    "isTransparent" boolean NOT NULL DEFAULT true,
    "poNumberRequired" boolean NOT NULL DEFAULT true,
    "address" character varying(100) NOT NULL,
    "isIntercompany" boolean NOT NULL DEFAULT true,
    "commissionNote" character varying(100) NOT NULL,
    "receiptDays" "public"."customer_receiptdays_enum" NOT NULL,
    "receiptDaysNote" character varying(36) NOT NULL,
    "conditionRemark" "public"."customer_conditionremark_enum" NOT NULL,
    "organization_profile_id" uuid,
    CONSTRAINT "REL_c5016230f51efe72f3d85f7f41" UNIQUE ("organization_profile_id"),
    CONSTRAINT "PK_a7a13f4cacb744524e44dfdad32" PRIMARY KEY ("id")
  ) CREATE TABLE "customer_agency" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP NOT NULL DEFAULT now(),
    "updatedAt" TIMESTAMP DEFAULT now(),
    "deletedAt" TIMESTAMP,
    "createdBy" character varying(36),
    "updatedBy" character varying(36),
    "deletedBy" character varying(36),
    "name" character varying(36) NOT NULL,
    "legalPersonIdentity" character varying(36) NOT NULL,
    "customer_id" uuid,
    CONSTRAINT "PK_10fbf80d38775ddaf9d33f6f202" PRIMARY KEY ("id")
  ) CREATE TABLE "vendor_invoice_target" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP NOT NULL DEFAULT now(),
    "updatedAt" TIMESTAMP DEFAULT now(),
    "deletedAt" TIMESTAMP,
    "createdBy" character varying(36),
    "updatedBy" character varying(36),
    "deletedBy" character varying(36),
    "condition" character varying(255) NOT NULL,
    "bankName" character varying(50) NOT NULL,
    "accountName" character varying(100) NOT NULL,
    "accountNumber" character varying(100) NOT NULL,
    "invoiceTitle" character varying(100) NOT NULL,
    "vendor_id" uuid,
    CONSTRAINT "PK_6a1332c7a0de84bf312d970897b" PRIMARY KEY ("id")
  )
ALTER TABLE "customer_contact"
ADD CONSTRAINT "FK_a55a990ae910799bf80b04b5a8d" FOREIGN KEY ("customer_id") REFERENCES "customer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION
ALTER TABLE "customer_finance_contact"
ADD CONSTRAINT "FK_633a8778b0f64fbaacb878c779e" FOREIGN KEY ("customer_id") REFERENCES "customer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION
ALTER TABLE "customer_invoice_target"
ADD CONSTRAINT "FK_fd8e290d036e269d5a03d2d072b" FOREIGN KEY ("customer_id") REFERENCES "customer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION
ALTER TABLE "customer_receipt_target"
ADD CONSTRAINT "FK_69d36da0960a404e4263a1f3e95" FOREIGN KEY ("customer_id") REFERENCES "customer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION
ALTER TABLE "organization_revision"
ADD CONSTRAINT "FK_7310f8f620bd5c0e3dc8b34f3e7" FOREIGN KEY ("organizationId") REFERENCES "organization"("id") ON DELETE NO ACTION ON UPDATE NO ACTION
ALTER TABLE "organization_revision"
ADD CONSTRAINT "FK_e2537f1dce03e44bb8b91d69d73" FOREIGN KEY ("organizationProfileId") REFERENCES "organization_profile"("id") ON DELETE NO ACTION ON UPDATE NO ACTION
ALTER TABLE "vendor_finance_contact"
ADD CONSTRAINT "FK_2665a7183617cc234909c088e79" FOREIGN KEY ("vendor_id") REFERENCES "vendor"("id") ON DELETE NO ACTION ON UPDATE NO ACTION
ALTER TABLE "vendor_receipt_target"
ADD CONSTRAINT "FK_c63f2d2d1d4e3fb227f56312983" FOREIGN KEY ("vendor_id") REFERENCES "vendor"("id") ON DELETE NO ACTION ON UPDATE NO ACTION
ALTER TABLE "vendor_tool"
ADD CONSTRAINT "FK_e228e27a9dbb14bb490d9ce9da7" FOREIGN KEY ("vendor_id") REFERENCES "vendor"("id") ON DELETE NO ACTION ON UPDATE NO ACTION
ALTER TABLE "vendor"
ADD CONSTRAINT "FK_e496dafaa55d3f9efd1899a7e66" FOREIGN KEY ("organization_profile_id") REFERENCES "organization_profile"("id") ON DELETE NO ACTION ON UPDATE NO ACTION
ALTER TABLE "customer"
ADD CONSTRAINT "FK_c5016230f51efe72f3d85f7f41c" FOREIGN KEY ("organization_profile_id") REFERENCES "organization_profile"("id") ON DELETE NO ACTION ON UPDATE NO ACTION
ALTER TABLE "customer_agency"
ADD CONSTRAINT "FK_3419a06b2a3a68e333df9e69e39" FOREIGN KEY ("customer_id") REFERENCES "customer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION
ALTER TABLE "vendor_invoice_target"
ADD CONSTRAINT "FK_cb814aafc812b4b1c8252017600" FOREIGN KEY ("vendor_id") REFERENCES "vendor"("id") ON DELETE NO ACTION ON UPDATE NO ACTION COMMIT
