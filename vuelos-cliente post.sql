/*
Navicat PGSQL Data Transfer

Source Server         : post
Source Server Version : 90404
Source Host           : localhost:5432
Source Database       : vuelos-cliente
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90404
File Encoding         : 65001

Date: 2017-02-10 01:23:51
*/


-- ----------------------------
-- Sequence structure for escala_id_seq
-- ----------------------------
DROP SEQUENCE "public"."escala_id_seq";
CREATE SEQUENCE "public"."escala_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for lugar_id_seq
-- ----------------------------
DROP SEQUENCE "public"."lugar_id_seq";
CREATE SEQUENCE "public"."lugar_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for vuelo_id_seq
-- ----------------------------
DROP SEQUENCE "public"."vuelo_id_seq";
CREATE SEQUENCE "public"."vuelo_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Table structure for escala
-- ----------------------------
DROP TABLE IF EXISTS "public"."escala";
CREATE TABLE "public"."escala" (
"id" int4 DEFAULT nextval('escala_id_seq'::regclass) NOT NULL,
"vuelo" int4 NOT NULL,
"lugar" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for lugar
-- ----------------------------
DROP TABLE IF EXISTS "public"."lugar";
CREATE TABLE "public"."lugar" (
"id" int4 DEFAULT nextval('lugar_id_seq'::regclass) NOT NULL,
"nombre" varchar COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS "public"."ticket";
CREATE TABLE "public"."ticket" (
"id" int4 NOT NULL,
"vuelo" int4 NOT NULL,
"asiento" int4 NOT NULL,
"precio" float8 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Table structure for vuelo
-- ----------------------------
DROP TABLE IF EXISTS "public"."vuelo";
CREATE TABLE "public"."vuelo" (
"id" int4 DEFAULT nextval('vuelo_id_seq'::regclass) NOT NULL,
"fecha" timestamp(6) NOT NULL,
"destino" int4 NOT NULL,
"origen" int4 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
ALTER SEQUENCE "public"."escala_id_seq" OWNED BY "escala"."id";
ALTER SEQUENCE "public"."lugar_id_seq" OWNED BY "lugar"."id";
ALTER SEQUENCE "public"."vuelo_id_seq" OWNED BY "vuelo"."id";

-- ----------------------------
-- Primary Key structure for table escala
-- ----------------------------
ALTER TABLE "public"."escala" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table lugar
-- ----------------------------
ALTER TABLE "public"."lugar" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table ticket
-- ----------------------------
ALTER TABLE "public"."ticket" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table vuelo
-- ----------------------------
ALTER TABLE "public"."vuelo" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Key structure for table "public"."escala"
-- ----------------------------
ALTER TABLE "public"."escala" ADD FOREIGN KEY ("vuelo") REFERENCES "public"."vuelo" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."escala" ADD FOREIGN KEY ("lugar") REFERENCES "public"."lugar" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."ticket"
-- ----------------------------
ALTER TABLE "public"."ticket" ADD FOREIGN KEY ("vuelo") REFERENCES "public"."vuelo" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."vuelo"
-- ----------------------------
ALTER TABLE "public"."vuelo" ADD FOREIGN KEY ("origen") REFERENCES "public"."lugar" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."vuelo" ADD FOREIGN KEY ("destino") REFERENCES "public"."lugar" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
