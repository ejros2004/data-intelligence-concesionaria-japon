# End-to-End Data Pipeline & BI: Concesionaria Automotriz

## Descripción del Proyecto
Este ecosistema integra el ciclo de vida completo de los datos: desde la ingesta de **196,000 registros**, pasando por una zona de Staging, hasta un modelo relacional normalizado alojado en **AWS EC2** para analítica avanzada.

---

## Arquitectura del Pipeline

### 1. Saneamiento de Datos (Data Cleansing)
Uso del proceso `jp1_cleansing.ktr` para filtrar dimensiones y eliminar duplicados.

![Flujo de Limpieza](https://github.com/user-attachments/assets/1718d36d-903d-4d85-b698-874cc322c628)

### 2. Ingesta Masiva (Staging Area)
Carga masiva (*Bulk Load*) mediante SQL para mover el dataset limpio al motor PostgreSQL.

**Reto:** Manejo de delimitadores regionales (`;`) y encoding UTF8.

![Exito Ingesta](https://github.com/user-attachments/assets/04dc8f37-9179-4b26-8b99-05bb6a9353e9)

---

## 3. Proceso de Modelado (Normalización 3NF)

La arquitectura de la base de datos no fue accidental. Se siguió un proceso de diseño de tres etapas para garantizar un modelo robusto y eficiente.

**A. Borrador y Lógica Inicial**

![Diseño en Papel](https://github.com/user-attachments/assets/e46cdf46-89d6-4376-a7eb-6ed5cf6473a3)

**B. Diagrama Lógico de Relaciones**

![Modelo Logico](https://github.com/user-attachments/assets/bbc56029-be15-4e18-9660-230ca826ee74)

**C. Modelo Entidad-Relación Final (ERD)**

![ERD Digital](https://github.com/user-attachments/assets/cc70935a-70a3-48e3-a33e-497fb7522959)

---

## 4. Orquestación ETL Detallada (Pentaho PDI)

Cada entidad del modelo relacional cuenta con su propio flujo de transformación y carga para asegurar la integridad de las llaves foráneas.

| Entidad | Descripción del Proceso | Evidencia |
| :--- | :--- | :--- |
| **Sucursal** | Mapeo de coordenadas y datos geográficos. | ![ETL Sucursal](https://github.com/user-attachments/assets/c273ca52-0d89-43af-bdf9-273be45b3e3b) |
| **Auto** | Clasificación por tipo de combustible y rodado. | ![ETL Auto](https://github.com/user-attachments/assets/69a1f19a-8e19-4f59-8b7a-adbdd29552ee) |
| **Cliente** | Segmentación demográfica y estado civil. | ![ETL Cliente](https://github.com/user-attachments/assets/33aa04a4-9de1-48b5-ab97-c760b9efb74f) |
| **Servicio** | Vinculación transaccional entre entidades. | ![ETL Servicio](https://github.com/user-attachments/assets/77f4d46b-180e-4ca5-8b62-efb0736c333c) |
| **Encuesta** | Carga de métricas NPS y fechas de servicio. | ![ETL Encuesta](https://github.com/user-attachments/assets/090b84a9-8f67-4624-8a65-5c0d63600cb9) |

---

## 5. Infraestructura Cloud (AWS)

Diagrama de flujo que detalla la configuración de la instancia **EC2 (Ubuntu Server)** y las reglas de red para permitir la persistencia y conectividad de la base de datos.

![Arquitectura Cloud](https://github.com/user-attachments/assets/29e5e797-c1c8-45bf-9db8-bf3cd91c9095)

---

## 6. Estrategia de Visualización (BI)

Diagrama de flujo del ecosistema de Business Intelligence, conectando el origen de datos en AWS con los tableros de control para la toma de decisiones.

![Estrategia BI](https://github.com/user-attachments/assets/cb7034ae-88e1-4c62-b588-3a51969e4c5e)

---

## Estructura del Repositorio
* `/data/`: Dataset original (muestra).
* `/pentaho_scripts/`: Archivos `.ktr` de cada fase.
* `/database/`: Scripts SQL de Staging y Modelo Final.
* `/images/`: Evidencia visual de todo el pipeline.
