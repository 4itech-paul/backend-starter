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
    AND "table_name" = 'customer_agency'
  )
  OR (
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
    AND "table_name" = 'customer'
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
    AND "table_name" = 'enter_prise_group'
  )
  OR (
    "table_schema" = 'public'
    AND "table_name" = 'service_line'
  )
  OR (
    "table_schema" = 'public'
    AND "table_name" = 'cue_template'
  )
  OR (
    "table_schema" = 'public'
    AND "table_name" = 'ad_category'
  )
  OR (
    "table_schema" = 'public'
    AND "table_name" = 'industry_category'
  )
  OR (
    "table_schema" = 'public'
    AND "table_name" = 'media_channel'
  )
  OR (
    "table_schema" = 'public'
    AND "table_name" = 'platform'
  )
  OR (
    "table_schema" = 'public'
    AND "table_name" = 'service_channel'
  )
  OR (
    "table_schema" = 'public'
    AND "table_name" = 'vendor_invoice_target'
  )
SELECT *
FROM "information_schema"."tables"
WHERE "table_schema" = 'public'
  AND "table_name" = 'typeorm_metadata' CREATE TABLE "customer_agency" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMP NOT NULL DEFAULT now(),
    "updated_at" TIMESTAMP DEFAULT now(),
    "deleted_at" TIMESTAMP,
    "created_by" character varying(36),
    "updated_by" character varying(36),
    "deleted_by" character varying(36),
    "name" character varying(36) NOT NULL,
    "legal_person_identity" character varying(36) NOT NULL,
    "customer_id" uuid,
    CONSTRAINT "PK_10fbf80d38775ddaf9d33f6f202" PRIMARY KEY ("id")
  ) CREATE TABLE "customer_contact" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMP NOT NULL DEFAULT now(),
    "updated_at" TIMESTAMP DEFAULT now(),
    "deleted_at" TIMESTAMP,
    "created_by" character varying(36),
    "updated_by" character varying(36),
    "deleted_by" character varying(36),
    "name" character varying(36) NOT NULL,
    "fax" character varying(36) NOT NULL,
    "phone" character varying(36) NOT NULL,
    "email" character varying(36) NOT NULL,
    "customer_id" uuid,
    CONSTRAINT "PK_2595307eaefa572e332a43f8b88" PRIMARY KEY ("id")
  ) CREATE TABLE "customer_finance_contact" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMP NOT NULL DEFAULT now(),
    "updated_at" TIMESTAMP DEFAULT now(),
    "deleted_at" TIMESTAMP,
    "created_by" character varying(36),
    "updated_by" character varying(36),
    "deleted_by" character varying(36),
    "name" character varying(36) NOT NULL,
    "fax" character varying(36) NOT NULL,
    "phone" character varying(36) NOT NULL,
    "email" character varying(36) NOT NULL,
    "customer_id" uuid,
    CONSTRAINT "PK_0ff92368af5a74dd50055816d96" PRIMARY KEY ("id")
  ) CREATE TABLE "customer_invoice_target" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMP NOT NULL DEFAULT now(),
    "updated_at" TIMESTAMP DEFAULT now(),
    "deleted_at" TIMESTAMP,
    "created_by" character varying(36),
    "updated_by" character varying(36),
    "deleted_by" character varying(36),
    "condition" character varying(255) NOT NULL,
    "bank_name" character varying(50) NOT NULL,
    "account_name" character varying(100) NOT NULL,
    "account_number" character varying(100) NOT NULL,
    "invoice_title" character varying(100) NOT NULL,
    "customer_id" uuid,
    CONSTRAINT "PK_a92e642f9ca82eae382b50c9a21" PRIMARY KEY ("id")
  ) CREATE TABLE "customer_receipt_target" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMP NOT NULL DEFAULT now(),
    "updated_at" TIMESTAMP DEFAULT now(),
    "deleted_at" TIMESTAMP,
    "created_by" character varying(36),
    "updated_by" character varying(36),
    "deleted_by" character varying(36),
    "name" character varying(36) NOT NULL,
    "legal_person_identity" character varying(100) NOT NULL,
    "invoice_title" character varying(100) NOT NULL,
    "english_name" character varying(100) NOT NULL,
    "has_foreign_parent_company" boolean NOT NULL,
    "foreign_parent_company_name" character varying(100) NOT NULL,
    "foreign_parent_company_address" character varying(100) NOT NULL,
    "customer_id" uuid,
    CONSTRAINT "PK_549d6f653326c123b2d1556ea73" PRIMARY KEY ("id")
  )
SELECT "n"."nspname",
  "t"."typname"
FROM "pg_type" "t"
  INNER JOIN "pg_namespace" "n" ON "n"."oid" = "t"."typnamespace"
WHERE "n"."nspname" = 'public'
  AND "t"."typname" = 'customer_receipt_days_enum'
SELECT "n"."nspname",
  "t"."typname"
FROM "pg_type" "t"
  INNER JOIN "pg_namespace" "n" ON "n"."oid" = "t"."typnamespace"
WHERE "n"."nspname" = 'public'
  AND "t"."typname" = 'customer_condition_remark_enum' CREATE TYPE "public"."customer_receipt_days_enum" AS ENUM('45', '60', '90') CREATE TYPE "public"."customer_condition_remark_enum" AS ENUM('red', 'yellow', 'none') CREATE TABLE "customer" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMP NOT NULL DEFAULT now(),
    "updated_at" TIMESTAMP DEFAULT now(),
    "deleted_at" TIMESTAMP,
    "created_by" character varying(36),
    "updated_by" character varying(36),
    "deleted_by" character varying(36),
    "alias" character varying(36) NOT NULL,
    "parent_group_customer_id" character varying(36) NOT NULL,
    "product_kind" character varying(36) NOT NULL,
    "industry_category" character varying(36) NOT NULL,
    "is_agency" boolean NOT NULL DEFAULT true,
    "is_transparent" boolean NOT NULL DEFAULT true,
    "po_number_required" boolean NOT NULL DEFAULT true,
    "address" character varying(100) NOT NULL,
    "is_intercompany" boolean NOT NULL DEFAULT true,
    "commission_note" character varying(100) NOT NULL,
    "receipt_days" "public"."customer_receipt_days_enum" NOT NULL,
    "receipt_days_note" character varying(36) NOT NULL,
    "condition_remark" "public"."customer_condition_remark_enum" NOT NULL,
    "organization_profile_id" uuid,
    CONSTRAINT "REL_c5016230f51efe72f3d85f7f41" UNIQUE ("organization_profile_id"),
    CONSTRAINT "PK_a7a13f4cacb744524e44dfdad32" PRIMARY KEY ("id")
  ) CREATE TABLE "organization" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMP NOT NULL DEFAULT now(),
    "updated_at" TIMESTAMP DEFAULT now(),
    "deleted_at" TIMESTAMP,
    "created_by" character varying(36),
    "updated_by" character varying(36),
    "deleted_by" character varying(36),
    "name" character varying(36) NOT NULL,
    "is_foreign" boolean NOT NULL DEFAULT true,
    "system_number" character varying(36) NOT NULL,
    "wanpie_number" character varying(36) NOT NULL,
    "individual_identity" character varying(36) NOT NULL,
    "legal_person_identity" character varying(36) NOT NULL,
    "short_name" character varying(36) NOT NULL,
    CONSTRAINT "PK_472c1f99a32def1b0abb219cd67" PRIMARY KEY ("id")
  )
SELECT "n"."nspname",
  "t"."typname"
FROM "pg_type" "t"
  INNER JOIN "pg_namespace" "n" ON "n"."oid" = "t"."typnamespace"
WHERE "n"."nspname" = 'public'
  AND "t"."typname" = 'organization_revision_status_enum' CREATE TYPE "public"."organization_revision_status_enum" AS ENUM('customer', 'pending', 'rejected') CREATE TABLE "organization_revision" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMP NOT NULL DEFAULT now(),
    "updated_at" TIMESTAMP DEFAULT now(),
    "deleted_at" TIMESTAMP,
    "created_by" character varying(36),
    "updated_by" character varying(36),
    "deleted_by" character varying(36),
    "version" character varying(36) NOT NULL,
    "relation_id" character varying(36) NOT NULL,
    "status" "public"."organization_revision_status_enum" NOT NULL,
    "organizationId" uuid,
    "organizationProfileId" uuid,
    CONSTRAINT "PK_b5a45f27fe7e30f8d50765323a7" PRIMARY KEY ("id")
  ) CREATE TABLE "vendor_finance_contact" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMP NOT NULL DEFAULT now(),
    "updated_at" TIMESTAMP DEFAULT now(),
    "deleted_at" TIMESTAMP,
    "created_by" character varying(36),
    "updated_by" character varying(36),
    "deleted_by" character varying(36),
    "name" character varying(36) NOT NULL,
    "fax" character varying(36) NOT NULL,
    "phone" character varying(36) NOT NULL,
    "email" character varying(36) NOT NULL,
    "vendor_id" uuid,
    CONSTRAINT "PK_f76dad7078898ba4e00739bcb4c" PRIMARY KEY ("id")
  ) CREATE TABLE "vendor_receipt_target" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMP NOT NULL DEFAULT now(),
    "updated_at" TIMESTAMP DEFAULT now(),
    "deleted_at" TIMESTAMP,
    "created_by" character varying(36),
    "updated_by" character varying(36),
    "deleted_by" character varying(36),
    "name" character varying(36) NOT NULL,
    "legal_person_identity" character varying(100) NOT NULL,
    "invoice_title" character varying(100) NOT NULL,
    "english_name" character varying(100) NOT NULL,
    "has_foreign_parent_company" boolean NOT NULL,
    "foreign_parent_company_name" character varying(100) NOT NULL,
    "foreign_parent_company_address" character varying(100) NOT NULL,
    "vendor_id" uuid,
    CONSTRAINT "PK_49b8e6ff6b0764b36e4d7dded52" PRIMARY KEY ("id")
  ) CREATE TABLE "vendor_tool" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMP NOT NULL DEFAULT now(),
    "updated_at" TIMESTAMP DEFAULT now(),
    "deleted_at" TIMESTAMP,
    "created_by" character varying(36),
    "updated_by" character varying(36),
    "deleted_by" character varying(36),
    "media_tool" character varying(100) NOT NULL,
    "platform" character varying(100) NOT NULL,
    "vendor_id" uuid,
    CONSTRAINT "PK_b2aacc119a8b4a9a91a5135b72a" PRIMARY KEY ("id")
  )
SELECT "n"."nspname",
  "t"."typname"
FROM "pg_type" "t"
  INNER JOIN "pg_namespace" "n" ON "n"."oid" = "t"."typnamespace"
WHERE "n"."nspname" = 'public'
  AND "t"."typname" = 'vendor_media_service_kind_enum'
SELECT "n"."nspname",
  "t"."typname"
FROM "pg_type" "t"
  INNER JOIN "pg_namespace" "n" ON "n"."oid" = "t"."typnamespace"
WHERE "n"."nspname" = 'public'
  AND "t"."typname" = 'vendor_condition_remark_enum' CREATE TYPE "public"."vendor_media_service_kind_enum" AS ENUM('media', 'service') CREATE TYPE "public"."vendor_condition_remark_enum" AS ENUM('red', 'yellow', 'none') CREATE TABLE "vendor" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMP NOT NULL DEFAULT now(),
    "updated_at" TIMESTAMP DEFAULT now(),
    "deleted_at" TIMESTAMP,
    "created_by" character varying(36),
    "updated_by" character varying(36),
    "deleted_by" character varying(36),
    "alias" character varying(255) NOT NULL,
    "is_active" boolean NOT NULL DEFAULT true,
    "media_service_kind" "public"."vendor_media_service_kind_enum" NOT NULL,
    "condition_remark" "public"."vendor_condition_remark_enum" NOT NULL,
    "organization_profile_id" uuid,
    CONSTRAINT "REL_e496dafaa55d3f9efd1899a7e6" UNIQUE ("organization_profile_id"),
    CONSTRAINT "PK_931a23f6231a57604f5a0e32780" PRIMARY KEY ("id")
  )
SELECT "n"."nspname",
  "t"."typname"
FROM "pg_type" "t"
  INNER JOIN "pg_namespace" "n" ON "n"."oid" = "t"."typnamespace"
WHERE "n"."nspname" = 'public'
  AND "t"."typname" = 'organization_profile_organization_kind_enum' CREATE TYPE "public"."organization_profile_organization_kind_enum" AS ENUM('customer', 'vendor') CREATE TABLE "organization_profile" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMP NOT NULL DEFAULT now(),
    "updated_at" TIMESTAMP DEFAULT now(),
    "deleted_at" TIMESTAMP,
    "created_by" character varying(36),
    "updated_by" character varying(36),
    "deleted_by" character varying(36),
    "organization_kind" "public"."organization_profile_organization_kind_enum" NOT NULL,
    "service_line_id" uuid,
    CONSTRAINT "PK_a459f7af77cb9a0fd82286f661a" PRIMARY KEY ("id")
  ) CREATE TABLE "enter_prise_group" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMP NOT NULL DEFAULT now(),
    "updated_at" TIMESTAMP DEFAULT now(),
    "deleted_at" TIMESTAMP,
    "created_by" character varying(36),
    "updated_by" character varying(36),
    "deleted_by" character varying(36),
    "name" character varying(36) NOT NULL,
    CONSTRAINT "PK_6f6da00378f96eb07e933f5bd03" PRIMARY KEY ("id")
  )
SELECT "n"."nspname",
  "t"."typname"
FROM "pg_type" "t"
  INNER JOIN "pg_namespace" "n" ON "n"."oid" = "t"."typnamespace"
WHERE "n"."nspname" = 'public'
  AND "t"."typname" = 'service_line_media_service_kind_enum' CREATE TYPE "public"."service_line_media_service_kind_enum" AS ENUM('media', 'service') CREATE TABLE "service_line" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMP NOT NULL DEFAULT now(),
    "updated_at" TIMESTAMP DEFAULT now(),
    "deleted_at" TIMESTAMP,
    "created_by" character varying(36),
    "updated_by" character varying(36),
    "deleted_by" character varying(36),
    "name" character varying(36) NOT NULL,
    "system_number" character varying(36) NOT NULL,
    "legal_person_identity" character varying(36) NOT NULL,
    "media_service_kind" "public"."service_line_media_service_kind_enum" NOT NULL,
    "enterprise_group_id" uuid,
    "cue_template_id" uuid,
    CONSTRAINT "REL_e2a42086adc90eb1f9ffb8f158" UNIQUE ("enterprise_group_id"),
    CONSTRAINT "REL_a5fbbf9b074a082762837f030c" UNIQUE ("cue_template_id"),
    CONSTRAINT "PK_33963e88ff5a2bf335e5086c681" PRIMARY KEY ("id")
  )
SELECT "n"."nspname",
  "t"."typname"
FROM "pg_type" "t"
  INNER JOIN "pg_namespace" "n" ON "n"."oid" = "t"."typnamespace"
WHERE "n"."nspname" = 'public'
  AND "t"."typname" = 'cue_template_media_service_kind_enum' CREATE TYPE "public"."cue_template_media_service_kind_enum" AS ENUM('media', 'service') CREATE TABLE "cue_template" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMP NOT NULL DEFAULT now(),
    "updated_at" TIMESTAMP DEFAULT now(),
    "deleted_at" TIMESTAMP,
    "created_by" character varying(36),
    "updated_by" character varying(36),
    "deleted_by" character varying(36),
    "media_service_kind" "public"."cue_template_media_service_kind_enum" NOT NULL,
    "title" character varying(36) NOT NULL,
    "channel" character varying(36) NOT NULL,
    "platform" character varying(36) NOT NULL,
    "ad_category" character varying(36) NOT NULL,
    "ad_start_at" date,
    "ad_end_at" date,
    "total_cost" character varying(36) NOT NULL,
    "accounts_receivable" character varying(36) NOT NULL,
    "customer_sign_amount" character varying(36) NOT NULL,
    "custom_column" jsonb NOT NULL,
    CONSTRAINT "PK_067f4b2aed2950036a28e4a6790" PRIMARY KEY ("id")
  ) CREATE TABLE "ad_category" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMP NOT NULL DEFAULT now(),
    "updated_at" TIMESTAMP DEFAULT now(),
    "deleted_at" TIMESTAMP,
    "created_by" character varying(36),
    "updated_by" character varying(36),
    "deleted_by" character varying(36),
    "name" character varying(36) NOT NULL,
    CONSTRAINT "PK_0a7dda8d426e57781b0c45b759a" PRIMARY KEY ("id")
  ) CREATE TABLE "industry_category" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMP NOT NULL DEFAULT now(),
    "updated_at" TIMESTAMP DEFAULT now(),
    "deleted_at" TIMESTAMP,
    "created_by" character varying(36),
    "updated_by" character varying(36),
    "deleted_by" character varying(36),
    "name" character varying(36) NOT NULL,
    CONSTRAINT "PK_f94637fd1e0b8b100d336b7760f" PRIMARY KEY ("id")
  ) CREATE TABLE "media_channel" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMP NOT NULL DEFAULT now(),
    "updated_at" TIMESTAMP DEFAULT now(),
    "deleted_at" TIMESTAMP,
    "created_by" character varying(36),
    "updated_by" character varying(36),
    "deleted_by" character varying(36),
    "name" character varying(36) NOT NULL,
    CONSTRAINT "PK_fbf993c35ae54ad2506f49b8878" PRIMARY KEY ("id")
  ) CREATE TABLE "platform" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMP NOT NULL DEFAULT now(),
    "updated_at" TIMESTAMP DEFAULT now(),
    "deleted_at" TIMESTAMP,
    "created_by" character varying(36),
    "updated_by" character varying(36),
    "deleted_by" character varying(36),
    "name" character varying(36) NOT NULL,
    CONSTRAINT "PK_c33d6abeebd214bd2850bfd6b8e" PRIMARY KEY ("id")
  ) CREATE TABLE "service_channel" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMP NOT NULL DEFAULT now(),
    "updated_at" TIMESTAMP DEFAULT now(),
    "deleted_at" TIMESTAMP,
    "created_by" character varying(36),
    "updated_by" character varying(36),
    "deleted_by" character varying(36),
    "name" character varying(36) NOT NULL,
    CONSTRAINT "PK_b3011513d0c271d33560789ecca" PRIMARY KEY ("id")
  ) CREATE TABLE "vendor_invoice_target" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "created_at" TIMESTAMP NOT NULL DEFAULT now(),
    "updated_at" TIMESTAMP DEFAULT now(),
    "deleted_at" TIMESTAMP,
    "created_by" character varying(36),
    "updated_by" character varying(36),
    "deleted_by" character varying(36),
    "condition" character varying(255) NOT NULL,
    "bank_name" character varying(50) NOT NULL,
    "account_name" character varying(100) NOT NULL,
    "account_number" character varying(100) NOT NULL,
    "invoice_title" character varying(100) NOT NULL,
    "vendor_id" uuid,
    CONSTRAINT "PK_6a1332c7a0de84bf312d970897b" PRIMARY KEY ("id")
  )
ALTER TABLE "customer_agency"
ADD CONSTRAINT "FK_3419a06b2a3a68e333df9e69e39" FOREIGN KEY ("customer_id") REFERENCES "customer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION
ALTER TABLE "customer_contact"
ADD CONSTRAINT "FK_a55a990ae910799bf80b04b5a8d" FOREIGN KEY ("customer_id") REFERENCES "customer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION
ALTER TABLE "customer_finance_contact"
ADD CONSTRAINT "FK_633a8778b0f64fbaacb878c779e" FOREIGN KEY ("customer_id") REFERENCES "customer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION
ALTER TABLE "customer_invoice_target"
ADD CONSTRAINT "FK_fd8e290d036e269d5a03d2d072b" FOREIGN KEY ("customer_id") REFERENCES "customer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION
ALTER TABLE "customer_receipt_target"
ADD CONSTRAINT "FK_69d36da0960a404e4263a1f3e95" FOREIGN KEY ("customer_id") REFERENCES "customer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION
ALTER TABLE "customer"
ADD CONSTRAINT "FK_c5016230f51efe72f3d85f7f41c" FOREIGN KEY ("organization_profile_id") REFERENCES "organization_profile"("id") ON DELETE NO ACTION ON UPDATE NO ACTION
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
ALTER TABLE "organization_profile"
ADD CONSTRAINT "FK_37d20417f99923a7e5ab0a49331" FOREIGN KEY ("service_line_id") REFERENCES "service_line"("id") ON DELETE NO ACTION ON UPDATE NO ACTION
ALTER TABLE "service_line"
ADD CONSTRAINT "FK_e2a42086adc90eb1f9ffb8f158f" FOREIGN KEY ("enterprise_group_id") REFERENCES "enter_prise_group"("id") ON DELETE NO ACTION ON UPDATE NO ACTION
ALTER TABLE "service_line"
ADD CONSTRAINT "FK_a5fbbf9b074a082762837f030cb" FOREIGN KEY ("cue_template_id") REFERENCES "cue_template"("id") ON DELETE NO ACTION ON UPDATE NO ACTION
ALTER TABLE "vendor_invoice_target"
ADD CONSTRAINT "FK_cb814aafc812b4b1c8252017600" FOREIGN KEY ("vendor_id") REFERENCES "vendor"("id") ON DELETE NO ACTION ON UPDATE NO ACTION COMMIT
