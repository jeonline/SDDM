-- 生成者Oracle SQL Developer Data Modeler 21.2.0.183.1957
--   时间:        2021-10-05 09:40:06 CST
--   站点:      Oracle Database 21c
--   类型:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE entity_files (
    file_id     INTEGER NOT NULL,
    file_name   VARCHAR2(1024 CHAR) NOT NULL,
    file_data   LONG RAW NOT NULL,
    file_md5sum VARCHAR2(40 CHAR) NOT NULL,
    chunk       INTEGER NOT NULL,
    chunks      INTEGER NOT NULL
);

CREATE INDEX entity_files__idx ON
    entity_files (
        file_md5sum
    ASC,
        file_name
    ASC );

ALTER TABLE entity_files ADD CONSTRAINT entity_files_pk PRIMARY KEY ( file_id );

ALTER TABLE entity_files ADD CONSTRAINT entity_files__un UNIQUE ( file_id );

CREATE TABLE entity_filetest (
    id     INTEGER,
    name   VARCHAR2(1024 CHAR),
    data   LONG RAW,
    md5sum VARCHAR2(40 CHAR),
    chunk  INTEGER,
    chunks INTEGER
);

CREATE OR REPLACE VIEW VIEW_file  AS
SELECT
    entity_files.*
FROM
    entity_files 
;



-- Oracle SQL Developer Data Modeler 概要报告: 
-- 
-- CREATE TABLE                             2
-- CREATE INDEX                             1
-- ALTER TABLE                              2
-- CREATE VIEW                              1
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
