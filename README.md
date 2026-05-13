# 📘 Exámen Módulo 2 – SQL (Sakila)

> **Autora:** Sabrina Giselle Gómez Trujillo  
> **Bootcamp:** Data Analytics e IA – Adalab  
> **Fecha:** Mayo 2026

## 📝 Descripción

Este repositorio contiene la resolución completa del **Examen Final del Módulo 2**, que evalúa habilidades en SQL utilizando la base de datos **Sakila** (tienda de alquiler de películas). Se han respondido **24 ejercicios** que abarcan desde consultas básicas hasta subconsultas, funciones de agregación, joins y operadores lógicos.

## 🗂️ Estructura del repositorio

```text
📁 bda-modulo-2-evaluacion-final-sabri667/
│
├── README.md
└── EvaluacionSGGT.sql
```
## ⚙️ Requisitos previos

- **MySQL** (versión 5.7 o superior) o **MariaDB**.
- Base de datos **Sakila** instalada y cargada.  
  Si no la tienes, descárgala desde:  
  👉 [MySQL Sakila Sample Database](https://dev.mysql.com/doc/sakila/en/)
- Un cliente SQL (MySQL Workbench, DBeaver, línea de comandos, etc.).

## 🚀 Cómo ejecutar el script

1. **Clona este repositorio** o descarga el archivo `EvaluacionSGGT.sql`.

2. **Abre tu cliente SQL** y conéctate a tu servidor MySQL.

3. **Carga el script** y ejecútalo completo. Puedes hacerlo de dos formas:

   - **Opción A (recomendada):**  
     Copia y pega el contenido completo del archivo en tu cliente y ejecútalo.  
     El script ya contiene `USE sakila;` y separadores visuales para cada ejercicio.

   - **Opción B (por partes):**  
     Ejecuta cada bloque `Ejercicio X` por separado si quieres analizar los resultados paso a paso.

4. **Verifica que la base de datos Sakila está disponible** – si no, ejecuta antes los scripts de instalación oficiales.

5. **Resultados esperados:**  
   Cada consulta devolverá un conjunto de filas. Al final del script se incluyen **consultas auxiliares** para corroborar los resultados, pero están comentadas (`/* ... */`). Si deseas ejecutarlas, descoméntalas.

## 📄 Contenido del examen

El script cubre los siguientes ejercicios (enumerados del 1 al 24):

| Nº | Enunciado resumido |
|----|--------------------|
| 1  | Seleccionar títulos de películas sin duplicados |
| 2  | Películas con clasificación "PG-13" |
| 3  | Películas que contienen "amazing" en la descripción |
| 4  | Películas con duración > 120 minutos |
| 5  | Nombre y apellido de todos los actores |
| 6  | Actores con "Gibson" en el apellido |
| 7  | Actores con `actor_id` entre 10 y 20 |
| 8  | Películas que NO son "R" ni "PG-13" |
| 9  | Cantidad de películas por clasificación |
| 10 | Cantidad de alquileres por cliente |
| 11 | Cantidad de alquileres por categoría |
| 12 | Promedio de duración por clasificación |
| 13 | Actores que aparecen en "Indian Love" |
| 14 | Películas con "dog" o "cat" en descripción |
| 15 | Actores sin ninguna película asignada |
| 16 | Películas lanzadas entre 2005 y 2010 |
| 17 | Películas de la misma categoría que "Family" |
| 18 | Actores que aparecen en más de 10 películas |
| 19 | Películas "R" con duración > 2 horas |
| 20 | Categorías con promedio de duración > 120 min |
| 21 | Actores que han actuado en al menos 5 películas |
| 22 | Películas alquiladas por más de 5 días (con subconsulta) |
| 23 | Actores que NO han actuado en películas de Horror |
| 24 | Películas de Comedia con duración > 180 min |

## 🛠️ Buenas prácticas implementadas

- **Separadores visuales** (`SELECT '========== Ejercicio X =========='`) para identificar cada respuesta.
- **Comentarios explicativos** y consultas auxiliares para validar resultados.
- **Uso de `NOT EXISTS`** en lugar de `NOT IN` para evitar errores con valores nulos.
- **Filtros eficientes**: primero las condiciones más restrictivas.
- **Alias claros** y formato consistente.

## 📌 Notas importantes

- El script **no modifica** los datos de Sakila, solo realiza consultas `SELECT`.
- Las consultas auxiliares están comentadas para no interferir con la salida principal.
- Para ejecutar solo una parte, copia el bloque correspondiente.

## ✅ Criterios de evaluación cubiertos

- [x] Creación y clonación de repositorio GitHub (este README)
- [x] Queries básicas (SELECT, FROM)
- [x] Filtros con `WHERE`, `AND`, `OR`, `NOT`, `IN`, `BETWEEN`, `LIKE`
- [x] Funciones agregadas: `COUNT`, `AVG`, `ROUND`, `MIN`, `MAX`
- [x] `GROUP BY` y `HAVING`
- [x] Joins: `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`
- [x] Subconsultas y `EXISTS`

---

¡Gracias por la revisión! Cualquier duda, quedo atenta.  
✍️ **Sabrina Giselle Gómez Trujillo**