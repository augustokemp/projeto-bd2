CREATE TABLE CLUBE (
    clube_pk SERIAL PRIMARY KEY,
    nome VARCHAR
);

CREATE TABLE MEMBRO (
    membro_pk SERIAL PRIMARY KEY,
    nome VARCHAR,
    cpf VARCHAR,
    data_nasc DATE,
    fone VARCHAR,
    email VARCHAR
);

CREATE TABLE MENSALIDADE (
    mensalidade_pk SERIAL PRIMARY KEY,
    data DATE,
    valor NUMERIC,
    vencimento DATE
);

CREATE TABLE EVENTO (
    evento_pk SERIAL PRIMARY KEY,
    data_inicio TIMESTAMP,
    data_fim TIMESTAMP,
    tipo VARCHAR,
    localizacao VARCHAR
);

CREATE TABLE MOTOCICLETA (
    motocicleta_pk SERIAL PRIMARY KEY,
    marca VARCHAR,
    modelo VARCHAR,
    ano INTEGER,
    cilindrada INTEGER,
    cor VARCHAR,
    final_placa INTEGER
);

CREATE TABLE PAGAMENTO_MENSALIDADE (
    membro_fk INTEGER,
    mensalidade_fk INTEGER,
    pago boolean,
    PRIMARY KEY (mensalidade_fk, membro_fk),
    FOREIGN KEY (mensalidade_fk) REFERENCES MENSALIDADE (mensalidade_pk),
   	FOREIGN KEY (membro_fk) REFERENCES MEMBRO (membro_pk)
);

CREATE TABLE MEMBRO_MOTOCICLETA (
    membro_fk INTEGER,
    motocicleta_fk INTEGER,
    PRIMARY KEY (motocicleta_fk, membro_fk),
    FOREIGN KEY (membro_fk) REFERENCES MEMBRO (membro_pk),
    FOREIGN KEY (motocicleta_fk) REFERENCES MOTOCICLETA (motocicleta_pk)
);

CREATE TABLE CLUBE_MEMBRO (
    membro_fk INTEGER,
    clube_fk INTEGER,
    cargo VARCHAR,
    PRIMARY KEY (clube_fk, membro_fk),
    FOREIGN KEY (membro_fk) REFERENCES MEMBRO (membro_pk),
    FOREIGN KEY (clube_fk) REFERENCES CLUBE (clube_pk)
);


CREATE TABLE CLUBE_EVENTO (
    clube_fk SERIAL,
    evento_fk SERIAL,
    PRIMARY KEY (clube_fk, evento_fk),
    FOREIGN KEY (clube_fk) REFERENCES CLUBE (clube_pk),
    FOREIGN KEY (evento_fk) REFERENCES EVENTO (evento_pk)
);

CREATE TABLE PARTICIPACAO_EVENTO (
    evento_fk SERIAL,
    membro_fk SERIAL,
    status INTEGER,
    PRIMARY KEY (evento_fk, membro_fk),
    FOREIGN KEY (evento_fk) REFERENCES EVENTO (evento_pk),
    FOREIGN KEY (membro_fk) REFERENCES MEMBRO (membro_pk)
);
 
