-- Created by Redgate Data Modeler (https://datamodeler.redgate-platform.com)
-- Last modification date: 2026-04-06 06:23:36.796

-- tables
-- Table: COMPACT_DISCS
CREATE TABLE COMPACT_DISCS (
    cd_code integer NOT NULL CONSTRAINT COMPACT_DISCS_pk PRIMARY KEY,
    manufacture_date date NOT NULL,
    manufacturer text NOT NULL,
    price real NOT NULL
);

-- Table: OPERATIONS
CREATE TABLE OPERATIONS (
    id integer NOT NULL CONSTRAINT OPERATIONS_pk PRIMARY KEY AUTOINCREMENT,
    cd_code integer NOT NULL,
    operation_date date NOT NULL,
    operation_type text NOT NULL,
    quantity integer NOT NULL,
    CONSTRAINT cd_code_operations UNIQUE (cd_code),
    CONSTRAINT COMPACT_DISCS_OPERATIONS FOREIGN KEY (cd_code)
    REFERENCES COMPACT_DISCS (cd_code)
);

-- Table: PERIOD_REPORTS
CREATE TABLE PERIOD_REPORTS (
    id integer NOT NULL CONSTRAINT PERIOD_REPORTS_pk PRIMARY KEY AUTOINCREMENT,
    period_start date NOT NULL,
    period_end date NOT NULL,
    cd_code integer NOT NULL,
    received_qty integer NOT NULL,
    sold_qty integer NOT NULL,
    CONSTRAINT cd_code_reports UNIQUE (cd_code),
    CONSTRAINT COMPACT_DISCS_PERIOD_REPORTS FOREIGN KEY (cd_code)
    REFERENCES COMPACT_DISCS (cd_code)
);

-- Table: TRACKS
CREATE TABLE TRACKS (
    id integer NOT NULL CONSTRAINT TRACKS_pk PRIMARY KEY AUTOINCREMENT,
    title text NOT NULL,
    author text NOT NULL,
    performer text NOT NULL,
    cd_code integer NOT NULL,
    CONSTRAINT COMPACT_DISCS_TRACKS FOREIGN KEY (cd_code)
    REFERENCES COMPACT_DISCS (cd_code)
);

-- Table: USERS
CREATE TABLE USERS (
    id integer NOT NULL CONSTRAINT USERS_pk PRIMARY KEY AUTOINCREMENT,
    username text NOT NULL,
    password_hash text NOT NULL,
    role text NOT NULL
);

-- End of file.

