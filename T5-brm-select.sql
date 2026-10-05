--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T5-brm-select.sql

--Student ID: 35672722
--Student Name: Low Ren Tong

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/

/* (a) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

-- Retrieve customers with multiple quotes whose average quote cost exceeds the global average.
-- Use NVL to display the business name if available; otherwise, default to the concatenated full name.
SELECT c.cust_no,
       nvl(
           c.cust_bname,
           trim(c.cust_gname
                || ' ' || c.cust_fname)
       ) AS customer_name,
       COUNT(q.quote_no) AS num_quotes,
       to_char(
           avg(q.quote_cost),
           'fm$999,990.00'
       ) AS avg_quoted_cost
  FROM customer c
  JOIN quote q
ON c.cust_no = q.cust_no
 GROUP BY c.cust_no,
          nvl(
              c.cust_bname,
              trim(c.cust_gname
                   || ' ' || c.cust_fname)
          )
HAVING COUNT(q.quote_no) > 1
   AND AVG(q.quote_cost) > (
    SELECT AVG(quote_cost)
      FROM quote
)
 ORDER BY AVG(q.quote_cost) DESC,
          c.cust_no;


/* (b) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

-- Display employee details, translating single-character role codes into full descriptions.
-- A LEFT OUTER JOIN is used to find the manager's name, ensuring employees without managers are still included.
-- The job count is conditionally calculated only for Truck Dispatchers ('T').
SELECT e.emp_no,
       TRIM(e.emp_gname
            || ' ' || e.emp_fname) AS emp_name,
       CASE e.emp_role
           WHEN 'B' THEN
               'Manager'
           WHEN 'T' THEN
               'Truck Dispatcher'
           WHEN 'M' THEN
               'Mechanic'
           WHEN 'D' THEN
               'Driver'
       END AS emp_role_full,
       nvl(
           trim(m.emp_gname
                || ' ' || m.emp_fname),
           'No Manager'
       ) AS manager_name,
       CASE
           WHEN e.emp_role = 'T' THEN
               to_char(count(j.job_no))
           ELSE
               NULL
       END AS jobs_dispatched
  FROM employee e
  LEFT OUTER JOIN employee m
ON e.emp_no_manager = m.emp_no
  LEFT OUTER JOIN job j
ON e.emp_no = j.sched_emp_no
 GROUP BY e.emp_no,
          TRIM(e.emp_gname
               || ' ' || e.emp_fname),
          e.emp_role,
          nvl(
              trim(m.emp_gname
                   || ' ' || m.emp_fname),
              'No Manager'
          )
 ORDER BY e.emp_no;


/* (c) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

-- Summarize usage statistics for all truck and trailer combinations.
-- Apply LPAD to ensure strict right-aligned fixed-width formatting for values and 'No jobs' strings.
-- Calculate the average number of jobs per used combination to accurately classify 'High Use' vs 'Standard Use'.
SELECT c.truck_vin,
       tr.truck_rego,
       c.trailer_code,
       lpad(
           to_char(
               tl.trailer_purchase_cost,
               'fm$99,999,990.00'
           ),
           21,
           ' '
       ) AS trailer_purchase_cost,
       COUNT(j.job_no) AS num_jobs,
       lpad(
           nvl(
               to_char(
                   sum(q.quote_cost),
                   'fm$99,999,990.00'
               ),
               'No jobs'
           ),
           17,
           ' '
       ) AS total_quoted_cost,
       CASE
           WHEN COUNT(j.job_no) = 0 THEN
               'Never Used'
           WHEN COUNT(j.job_no) > (
               SELECT COUNT(job_no) / COUNT(DISTINCT truck_vin || trailer_code)
                 FROM job
           )                   THEN
               'High Use'
           ELSE
               'Standard Use'
       END AS usage
  FROM combination c
  JOIN truck tr
ON c.truck_vin = tr.truck_vin
  JOIN trailer tl
ON c.trailer_code = tl.trailer_code
  LEFT OUTER JOIN job j
ON c.truck_vin = j.truck_vin
   AND c.trailer_code = j.trailer_code
  LEFT OUTER JOIN quote q
ON j.quote_no = q.quote_no
 GROUP BY c.truck_vin,
          tr.truck_rego,
          c.trailer_code,
          tl.trailer_purchase_cost
 ORDER BY num_jobs DESC,
          c.truck_vin,
          c.trailer_code;