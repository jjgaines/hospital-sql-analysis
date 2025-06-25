-- 1. How many total appointments are there for each appointment status?

SELECT status, COUNT(*) as appointments
FROM appointments
GROUP BY status;

-- 2. Which cities have the most patients? What are the Top 5?

SELECT city, COUNT(*) as patients
FROM patients p 
GROUP by city
ORDER by patients DESC
LIMIT 5;

-- 3. What percentage of appointments were No-Shows by department?

SELECT 
  department,
  ROUND(
    SUM(CASE WHEN status = 'No-Show' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
    2
  ) AS no_show_rate_percent
FROM appointments
GROUP BY department;

-- 4. Find the number of unique patients who had more than one appointment.

SELECT 
  COUNT(*) AS repeat_patient_count
FROM (
  SELECT patient_id
  FROM appointments
  GROUP BY patient_id
  HAVING COUNT(*) > 1
) AS sub;

-- 5. Most common department for appointments?

SELECT department, COUNT(*) AS apt_amount
FROM appointments
GROUP by department
ORDER by apt_amount DESC
LIMIT 1;

-- 7. How many appointments were scheduled but never completed?

SELECT COUNT(*) AS appointments_never_completed
FROM appointments
WHERE status = 'Cancelled' OR status = 'No-Show';

-- 8. Which patients have had appointments in more than one department? List their names and the departments they've visited.

SELECT 
  p.name AS patient_name,
  COUNT(DISTINCT a.department) AS departments_visited
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
GROUP BY p.name
HAVING COUNT(DISTINCT a.department) > 1
ORDER BY departments_visited DESC;

-- 9. List the names and cities of patients who had a No-Show appointment, including the appointment date and department.

SELECT p.name, p.city, a.appointment_date, a.department, a.status
FROM patients p 
	JOIN appointments a
	ON p.patient_id = a.patient_id
WHERE status = 'No-Show';

-- 10. For each department, list the number of unique patients from each city who had appointments

SELECT p.city, COUNT(DISTINCT p.patient_id) AS unique_patients, department
FROM appointments a 
	JOIN patients p 
	ON a.patient_id = p.patient_id
GROUP by p.city, department;