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

Date: 2017-02-19 21:52:13
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
SELECT setval('"public"."escala_id_seq"', 1, true);

-- ----------------------------
-- Sequence structure for lugar_id_seq
-- ----------------------------
DROP SEQUENCE "public"."lugar_id_seq";
CREATE SEQUENCE "public"."lugar_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 4
 CACHE 1;
SELECT setval('"public"."lugar_id_seq"', 4, true);

-- ----------------------------
-- Sequence structure for vuelo_id_seq
-- ----------------------------
DROP SEQUENCE "public"."vuelo_id_seq";
CREATE SEQUENCE "public"."vuelo_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 8
 CACHE 1;
SELECT setval('"public"."vuelo_id_seq"', 8, true);

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
-- Records of escala
-- ----------------------------
INSERT INTO "public"."escala" VALUES ('1', '1', '3');

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
-- Records of lugar
-- ----------------------------
INSERT INTO "public"."lugar" VALUES ('1', 'Lima, Peru');
INSERT INTO "public"."lugar" VALUES ('2', 'Piura, Peru');
INSERT INTO "public"."lugar" VALUES ('3', 'Arequipa, Peru');

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
-- Records of ticket
-- ----------------------------

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
-- Records of vuelo
-- ----------------------------
INSERT INTO "public"."vuelo" VALUES ('1', '2017-03-01 17:26:04', '1', '2');
INSERT INTO "public"."vuelo" VALUES ('3', '2017-07-20 17:26:33', '3', '2');
INSERT INTO "public"."vuelo" VALUES ('4', '2017-07-20 17:26:44', '3', '1');
INSERT INTO "public"."vuelo" VALUES ('5', '2017-03-24 17:27:14', '2', '3');
INSERT INTO "public"."vuelo" VALUES ('6', '2017-02-23 17:27:24', '2', '1');

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
