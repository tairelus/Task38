/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 12.0 		*/
/*  Created On : 10-Feb-2016 10:16:21 				*/
/*  DBMS       : PostgreSQL 						*/
/* ---------------------------------------------------- */

/* Drop Tables */

DROP TABLE IF EXISTS "computers" CASCADE
;

DROP TABLE IF EXISTS "computer_vendors" CASCADE
;

DROP TABLE IF EXISTS "computer_types" CASCADE
;

DROP TABLE IF EXISTS "computer_providers" CASCADE
;

DROP TABLE IF EXISTS "components" CASCADE
;

/* Create Tables */

CREATE TABLE "computers"
(
	"computerid" INTEGER NOT NULL,
	"typeid" INTEGER NULL,
	"computername" VARCHAR(50)	 NULL,
	"computerprice" INTEGER NULL,
	"balance" INTEGER NULL,
	"vendorid" CHAR(10)	 NULL,
	"providerid" CHAR(10)	 NULL
)
;

CREATE TABLE "computer_vendors"
(
	"vendorid" CHAR(10)	 NOT NULL,
	"vendorname" VARCHAR(50)	 NULL,
	"vendoraddress" VARCHAR(50)	 NULL,
	"vendorphone" VARCHAR(50)	 NULL
)
;

CREATE TABLE "computer_types"
(
	"typeid" INTEGER NOT NULL,
	"typename" VARCHAR(50)	 NULL
)
;

CREATE TABLE "computer_providers"
(
	"providerid" CHAR(10)	 NOT NULL,
	"providername" VARCHAR(50)	 NULL,
	"provideraddress" VARCHAR(50)	 NULL,
	"providerphone" VARCHAR(50)	 NULL
)
;

CREATE TABLE "components"
(
	"componentid" INTEGER NOT NULL,
	"computerid" INTEGER NULL,
	"componentname" VARCHAR(50)	 NULL,
	"componentnum" INTEGER NULL
)
;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE "computers" ADD CONSTRAINT "PK_computers"
	PRIMARY KEY ("computerid")
;

CREATE INDEX "IXFK_computers_computer_providers" ON "computers" ("providerid" ASC)
;

CREATE INDEX "IXFK_computers_computer_types" ON "computers" ("typeid" ASC)
;

CREATE INDEX "IXFK_computers_computer_vendors" ON "computers" ("vendorid" ASC)
;

ALTER TABLE "computer_vendors" ADD CONSTRAINT "PK_computer_vendors"
	PRIMARY KEY ("vendorid")
;

ALTER TABLE "computer_types" ADD CONSTRAINT "PK_computer_types"
	PRIMARY KEY ("typeid")
;

ALTER TABLE "computer_providers" ADD CONSTRAINT "PK_computer_providers"
	PRIMARY KEY ("providerid")
;

ALTER TABLE "components" ADD CONSTRAINT "PK_components"
	PRIMARY KEY ("componentid")
;

CREATE INDEX "IXFK_components_computers" ON "components" ("computerid" ASC)
;

/* Create Foreign Key Constraints */

ALTER TABLE "computers" ADD CONSTRAINT "FK_computers_computer_providers"
	FOREIGN KEY ("providerid") REFERENCES "computer_providers" ("providerid") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "computers" ADD CONSTRAINT "FK_computers_computer_types"
	FOREIGN KEY ("typeid") REFERENCES "computer_types" ("typeid") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "computers" ADD CONSTRAINT "FK_computers_computer_vendors"
	FOREIGN KEY ("vendorid") REFERENCES "computer_vendors" ("vendorid") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "components" ADD CONSTRAINT "FK_components_computers"
	FOREIGN KEY ("computerid") REFERENCES "computers" ("computerid") ON DELETE No Action ON UPDATE No Action
;
