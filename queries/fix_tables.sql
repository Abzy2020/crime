-- Active: 1680326086543@@localhost@3306@crime

DESCRIBE crime_stats;

ALTER TABLE crime_stats
RENAME COLUMN `Vict Descent` TO race,
RENAME COLUMN `Vict Age` TO `age`,
RENAME COLUMN `Vict Sex` TO gender,
RENAME COLUMN `Date Rptd` TO date_reported,
RENAME COLUMN `Crm Cd Desc` TO crime,
RENAME COLUMN `Date OCC` TO date_occured;

ALTER TABLE crime_stats
DROP `Cross Street`,
DROP `Premis Desc`,
DROP `Weapon Desc`,
DROP `Status Desc`,
DROP `Area`,
DROP `Area Name`,
DROP `Crm Cd`,
DROP `LOCATION`,
DROP `Crm Cd 1`,
DROP `Crm Cd 2`,
DROP `Crm Cd 3`,
DROP `Crm Cd 4`,
DROP Mocodes,
DROP `Rpt Dist No`,
DROP `Part 1-2`,
DROP `TIME OCC`,
DROP `Premis cd`,
DROP `Weapon Used Cd`,
DROP `Date Rptd`,
DROP DR_NO;