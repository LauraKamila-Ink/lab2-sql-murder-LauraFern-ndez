-- Paso 1: Busque la fecha en la cual se realizo el crimen para asi poder obtener algunas pisas

SELECT * FROM crime_scene_report 
WHERE date = 20180115 
  AND city = 'SQL City' 
  AND type = 'murder';


