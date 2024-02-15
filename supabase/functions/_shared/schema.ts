import { pgTable, boolean, serial, real, timestamp, text, varchar, uuid } from "drizzle-orm/pg-core";
import { relations, sql } from "drizzle-orm";
import { integer } from "drizzle-orm/sqlite-core";

export const company = pgTable('company', {
  id: serial('id').primaryKey(),
  name: varchar('name'),
  img: varchar('img'),
  country: varchar('country'),
  createdAt: timestamp('createdAt', { mode: "string" }).default(sql`now()`),
});

export const users = pgTable('users', {
  id: serial('id').primaryKey(),
  name: varchar('name'),
  lastName: varchar('lastName'),
  userId: uuid('userId').defaultRandom(),
  companyId: integer('companyId').references(() => company.id),
  createdAt: timestamp('createdAt', { mode: "string" }).default(sql`now()`),
});

export const mission = pgTable('mission', {
  id: serial('id').primaryKey(),
  title: varchar('title'),
  description: varchar('description'),
  img: varchar('img'),
  code: varchar('code'),
  toReddem: real('toReddem'),
  reddemed: real('reddemed'),
  companyId: integer('companyId').references(() => company.id),
  createdAt: timestamp('createdAt', { mode: "string" }).default(sql`now()`),
});
export const submition = pgTable('submition', {
  id: serial('id').primaryKey(),
  phone: varchar('phone'),
  email: varchar('email'),
  url: varchar('url'),
  missionId: integer('missionId').references(() => mission.id),
  status: varchar('status'),
  createdAt: timestamp('createdAt', { mode: "string" }).default(sql`now()`),
});

