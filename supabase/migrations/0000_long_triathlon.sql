CREATE TABLE IF NOT EXISTS "company" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar,
	"img" varchar,
	"country" varchar,
	"createdAt" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "mission" (
	"id" serial PRIMARY KEY NOT NULL,
	"title" varchar,
	"description" varchar,
	"img" varchar,
	"promotionalCode" varchar,
	"toReddem" real,
	"reddemed" real,
	"companyId" integer,
	"createdAt" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "submition" (
	"id" serial PRIMARY KEY NOT NULL,
	"phone" varchar,
	"email" varchar,
	"url" varchar,
	"missionId" integer,
	"status" varchar,
	"createdAt" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "users" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" varchar,
	"lastName" varchar,
	"userId" uuid DEFAULT gen_random_uuid(),
	"companyId" integer,
	"createdAt" timestamp DEFAULT now()
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "mission" ADD CONSTRAINT "mission_companyId_company_id_fk" FOREIGN KEY ("companyId") REFERENCES "company"("id");
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "submition" ADD CONSTRAINT "submition_missionId_mission_id_fk" FOREIGN KEY ("missionId") REFERENCES "mission"("id");
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "users" ADD CONSTRAINT "users_companyId_company_id_fk" FOREIGN KEY ("companyId") REFERENCES "company"("id");
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
