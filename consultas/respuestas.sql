-- Paso 1: Busque la fecha en la cual se realizo el crimen para asi poder obtener algunas pisas

SELECT * FROM crime_scene_report 
WHERE date = 20180115 
  AND city = 'SQL City' 
  AND type = 'murder';


-- Paso 2: Segun lo que salio en la vista ya se puede investigar a los testigos
-- Testigo 1: Vive en la última casa de Northwestern Dr.

SELECT * FROM person 
WHERE address_street_name = 'Northwestern Dr' 
ORDER BY address_number DESC 
LIMIT 1;

-- Testigo 2: Annabel en Franklin Ave.

SELECT * FROM person 
WHERE name LIKE 'Annabel%' 
  AND address_street_name = 'Franklin Ave';

--- Paso 3: Investigar las declaraciones de los testigos

SELECT * FROM interview 
WHERE person_id IN (14887, 16371);  

--- Paso 4: Buscando al sospechoso segun la pista del gimnasio

SELECT * FROM get_fit_now_member 
WHERE membership_status = 'gold' 
  AND id LIKE '48Z%';

--- Paso 5: Asistencia al gimnasio el dia del crimen

SELECT membership_id, check_in_date 
FROM get_fit_now_check_in 
WHERE check_in_date = 20180109 
  AND membership_id LIKE '48Z%';        

--- Paso 6: Buscar registros de placa

SELECT p.name, dl.plate_number, p.id AS person_id
FROM person p
JOIN drivers_license dl ON p.license_id = dl.id
WHERE dl.plate_number LIKE '%H42W%';   

--- Paso 7: Identificar al Asesino

SELECT 
    p.id, 
    p.name, 
    g.membership_status, 
    p.license_id, 
    dl.plate_number
FROM person p
JOIN get_fit_now_member g ON p.id = g.person_id
JOIN drivers_license dl ON p.license_id = dl.id
WHERE g.membership_status = 'gold' 
  AND g.id LIKE '48Z%' 
  AND dl.plate_number LIKE '%H42W%'; 

  
