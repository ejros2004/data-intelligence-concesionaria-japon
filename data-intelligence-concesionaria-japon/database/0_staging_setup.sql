-- ====================================================================
-- PASO 0: CREACIÓN DE INFRAESTRUCTURA Y STAGING AREA
-- ====================================================================

-- 1. Crear la base de datos principal (Ejecutar conectado a la BD 'postgres' por defecto)
CREATE DATABASE "Consesionaria_Japon"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

-- 2. Conectarse a la nueva base de datos y usar la query tool para ingresar el siguiente script:

-- 3. Crear la tabla temporal (Staging Area) para la ingesta cruda
CREATE TABLE public.staging_survey_data (
    country VARCHAR(50),
    state VARCHAR(100),
    city VARCHAR(100),
    survey_id VARCHAR(50),
    survey_dat BIGINT,      -- Formato Timestamp Unix
    lat NUMERIC(9,6),       -- Precisión geográfica óptima
    lon NUMERIC(9,6),
    gender VARCHAR(20),
    marital_st VARCHAR(50),
    age_range VARCHAR(20),
    card_brand VARCHAR(50),
    tire_size VARCHAR(20),
    avg_servic VARCHAR(50),
    fuel_type VARCHAR(50),
    type_of_se VARCHAR(150),
    nps INTEGER
);

-- 4. Ingesta Masiva de Datos (Bulk Load) desde el Excel/CSV limpio
-- Nota: Actualizar el string de la ruta a la ubicación real de la carpeta del repositorio en tu entorno local/servidor
COPY public.staging_survey_data (country, state, city, survey_id, survey_dat, lat, lon, gender, marital_st, age_range, card_brand, tire_size, avg_servic, fuel_type, type_of_se, nps)
FROM 'E:\ETL REPO\data_inicial\Project_Data_HN_Survey.csv'
DELIMITER ';'
CSV HEADER;