CREATE SCHEMA DW;

CREATE TABLE DW.DIM_MUNICIPIO (
    id_municipio NUMERIC(7) NOT NULL,
    municipio VARCHAR(50) NULL,
    PRIMARY KEY (id_municipio)
);

CREATE TABLE DW.DIM_PORTE_MUNICIPIO (
    id_porte NUMERIC(1) NOT NULL,
    porte VARCHAR(15) NULL,
    PRIMARY KEY (id_porte)
);

CREATE TABLE DW.DIM_UNIDADE_FEDERATIVA (
    id_uf NUMERIC(2) NOT NULL,
    uf VARCHAR(2) NULL,
    PRIMARY KEY (id_uf)
);

CREATE TABLE DW.DIM_REGIAO (
    id_regiao NUMERIC(1) NOT NULL,
    regiao VARCHAR(15) NULL,
    PRIMARY KEY (id_regiao)
);

CREATE TABLE DW.FACT_POP_RUA (
    id_municipio NUMERIC(7) REFERENCES DW.DIM_MUNICIPIO(id_municipio),
    id_porte NUMERIC(1) REFERENCES DW.DIM_PORTE_MUNICIPIO(id_porte),
    id_uf NUMERIC(2) REFERENCES DW.DIM_UNIDADE_FEDERATIVA(id_uf),
    id_regiao NUMERIC(1) REFERENCES DW.DIM_REGIAO(id_regiao),
    populacao_censo_2010 INT,
    latitude VARCHAR(20),
    longitude VARCHAR(20),
    moradores_rua INT,
    ano_levantamento INT
);
