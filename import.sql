DROP TABLE IF EXISTS
    sagre_fiere;
CREATE TABLE sagre_fiere(
    id_customer SERIAL PRIMARY KEY,
    id INTEGER,
    denom VARCHAR(150),
    tipo VARCHAR(15),
    n_ediz VARCHAR(150),
    descriz TEXT,
    data_in TEXT,
    ora_in TIME,
    data_fine TEXT,
    ora_fine TIME,
    anno INTEGER,
    prov VARCHAR(10),
    istat INTEGER,
    comune VARCHAR(100),
    toponimo VARCHAR(50),
    indirizzo VARCHAR(150),
    civico TEXT,
    cap VARCHAR(15),
    somminis VARCHAR(150),
    sito_web TEXT,
    nome_org VARCHAR(150),
    programma TEXT,
    gen_automatica_programma TEXT,
    geo_x TEXT,
    geo_y TEXT,
    location VARCHAR(150)
);


LOAD DATA LOCAL INFILE  
'/Users/elena/Documents/LM/Big Data Management/Project /Sagre_e_fiere_su_area_pubblica_20240826.csv'
INTO TABLE sagre_fiere  
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, denom, tipo, n_ediz, descriz, data_in, ora_in, data_fine,
    ora_fine, anno, prov, istat, comune, toponimo, indirizzo, civico, cap, somminis ,
    sito_web, nome_org, programma, gen_automatica_programma, geo_x, geo_y,location);
    
    