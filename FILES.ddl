-- 生成者Oracle SQL Developer Data Modeler 21.2.0.183.1957
--   时间:        2021-10-05 15:51:03 CST
--   站点:      Oracle Database 21c
--   类型:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE entity_chunk (
    file_id              INTEGER NOT NULL,
    file_chunk           INTEGER NOT NULL,
    file_data            BLOB NOT NULL,
    chunk_id             INTEGER NOT NULL,
    entity_files_file_id INTEGER NOT NULL
);

CREATE INDEX entity_chunk__idx ON
    entity_chunk (
        file_id
    ASC,
        chunk_id
    ASC );

ALTER TABLE entity_chunk ADD CONSTRAINT entity_chunk_pk PRIMARY KEY ( chunk_id );

CREATE TABLE entity_file (
    name   VARCHAR2(1024 CHAR) NOT NULL,
    data   BLOB NOT NULL,
    md5sum VARCHAR2(40 CHAR) NOT NULL,
    chunk  INTEGER NOT NULL,
    chunks INTEGER NOT NULL,
    id     INTEGER NOT NULL
);

CREATE INDEX entity_file__idx ON
    entity_file (
        name
    ASC,
        md5sum
    ASC );

ALTER TABLE entity_file ADD CONSTRAINT entity_file_pk PRIMARY KEY ( id );

CREATE TABLE entity_files (
    file_id     INTEGER NOT NULL,
    file_name   VARCHAR2(1024 CHAR),
    file_chunks INTEGER,
    file_md5sum VARCHAR2(40 CHAR),
    file_size   INTEGER,
    file_date   DATE NOT NULL
);

CREATE INDEX entity_files__idx ON
    entity_files (
        file_id
    ASC,
        file_name
    ASC,
        file_md5sum
    ASC );

ALTER TABLE entity_files ADD CONSTRAINT entity_files_pk PRIMARY KEY ( file_id );

ALTER TABLE entity_chunk
    ADD CONSTRAINT entity_chunk_entity_files_fk FOREIGN KEY ( entity_files_file_id )
        REFERENCES entity_files ( file_id );

CREATE OR REPLACE VIEW VIEW_FILES ( FILE_ID, FILE_NAME, FILE_CHUNKS, FILE_MD5SUM, FILE_SIZE, FILE_DATE, file_id1, file_chunk, file_data ) AS
SELECT
    entity_files.*,
    entity_chunk.file_id AS file_id1,
    entity_chunk.file_chunk,
    entity_chunk.file_data
FROM
         entity_files
    INNER JOIN entity_chunk ON entity_files.file_id = entity_chunk.entity_files_file_id 
;



-- Oracle SQL Developer Data Modeler 概要报告: 
-- 
-- CREATE TABLE                             3
-- CREATE INDEX                             3
-- ALTER TABLE                              4
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
