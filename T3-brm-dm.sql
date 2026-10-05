--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T3-brm-dm.sql

--Student ID: 35672722
--Student Name: Low Ren Tong

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/

--3(a)
DROP SEQUENCE employee_seq;
DROP SEQUENCE quote_seq;
DROP SEQUENCE job_seq;

-- Create sequences starting at 300 and incrementing by 5
CREATE SEQUENCE employee_seq START WITH 300 INCREMENT BY 5;
CREATE SEQUENCE quote_seq START WITH 300 INCREMENT BY 5;
CREATE SEQUENCE job_seq START WITH 300 INCREMENT BY 5;

--3(b)
INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES ( employee_seq.NEXTVAL,
           'Aurello',
           'Brown',
           '0431952053',
           NULL,
           'T',
    -- Subquery to dynamically find Sarah Mitchell's ID without hardcoding
           (
               SELECT emp_no
                 FROM employee
                WHERE upper(emp_gname) = upper('Sarah')
                  AND upper(emp_fname) = upper('Mitchell')
                  AND upper(emp_role) = 'B'
           ) );

COMMIT;

--3(c)
-- 1. Insert the Quote
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( quote_seq.NEXTVAL,
           TO_DATE('17-May-2026','dd-Mon-yyyy'),
           TO_DATE('25-May-2026','dd-Mon-yyyy'),
           '29 Kuranda Road, Adelaide SA 5030',
           '9 Albatros Drive, Mount Gambier SA 5270',
           1000.00,
    -- Locate Customer VICTORIA ELLA
           (
               SELECT cust_no
                 FROM customer
                WHERE upper(cust_gname) = upper('VICTORIA')
                  AND upper(cust_fname) = upper('ELLA')
                  AND upper(cust_bname) = upper('Flintstone Store')
           ),
    -- Locate Employee Aurello Brown
           (
               SELECT emp_no
                 FROM employee
                WHERE upper(emp_gname) = upper('Aurello')
                  AND upper(emp_fname) = upper('Brown')
                  AND upper(emp_role) = 'T'
           ) );

-- 2. Insert the Job
INSERT INTO job (
    job_no,
    job_pickup_dt,
    job_intended_dropoff_dt,
    job_cost,
    job_payment_made,
    quote_no,
    sched_emp_no,
    driver_emp_no,
    truck_vin,
    trailer_code
) VALUES ( job_seq.NEXTVAL,
           TO_DATE('25-May-2026 09:00','dd-Mon-yyyy hh24:mi'),
    -- Calculate dropoff time as exactly 5 hours later (5 / 24 of a day)
           TO_DATE('25-May-2026 09:00','dd-Mon-yyyy hh24:mi') + ( 5 / 24 ),
           NULL, -- Set to NULL because cost is the same as the quote initially
           'Y',
    -- Subquery to get the quote_no from the quote just inserted above
           (
               SELECT quote_no
                 FROM quote
                WHERE cust_no = (
                       SELECT cust_no
                         FROM customer
                        WHERE upper(cust_gname) = upper('VICTORIA')
                          AND upper(cust_fname) = upper('ELLA')
                          AND upper(cust_bname) = upper('Flintstone Store')
                   )
                  AND quote_prepared_date = TO_DATE('17-May-2026','dd-Mon-yyyy')
           ),
           (
               SELECT emp_no
                 FROM employee
                WHERE upper(emp_gname) = upper('Aurello')
                  AND upper(emp_fname) = upper('Brown')
                  AND upper(emp_role) = 'T'
           ),
           (
               SELECT emp_no
                 FROM employee
                WHERE upper(emp_gname) = upper('Michael')
                  AND upper(emp_fname) = upper('Johnson')
                  AND upper(emp_role) = 'D'
           ),
           '1HGBH41JXMN109186',
           'TRL08' );

-- Both inserts complete, commit the transaction
COMMIT;

--3(d)
UPDATE job
   SET job_pickup_dt = TO_DATE('25-May-2026 14:00','dd-Mon-yyyy hh24:mi'),
    -- Keep the 5 hour driving duration
       job_intended_dropoff_dt = TO_DATE('25-May-2026 14:00','dd-Mon-yyyy hh24:mi') +
       ( 5 / 24 ),
       job_cost = (
        -- Calculate 20% higher than the quoted cost
           SELECT quote_cost * 1.20
             FROM quote
            WHERE cust_no = (
                   SELECT cust_no
                     FROM customer
                    WHERE upper(cust_gname) = upper('VICTORIA')
                      AND upper(cust_fname) = upper('ELLA')
                      AND upper(cust_bname) = upper('Flintstone Store')
               )
              AND quote_prepared_date = TO_DATE('17-May-2026','dd-Mon-yyyy')
       )
 WHERE quote_no = (
    SELECT quote_no
      FROM quote
     WHERE cust_no = (
            SELECT cust_no
              FROM customer
             WHERE upper(cust_gname) = upper('VICTORIA')
               AND upper(cust_fname) = upper('ELLA')
               AND upper(cust_bname) = upper('Flintstone Store')
        )
       AND quote_prepared_date = TO_DATE('17-May-2026','dd-Mon-yyyy')
);

COMMIT;

--3(e)
-- Cancel the scheduled job for Victoria Ella by deleting it based on her specific quote details
DELETE FROM job
 WHERE quote_no = (
    SELECT quote_no
      FROM quote
     WHERE cust_no = (
            SELECT cust_no
              FROM customer
             WHERE upper(cust_gname) = upper('VICTORIA')
               AND upper(cust_fname) = upper('ELLA')
               AND upper(cust_bname) = upper('Flintstone Store')
        )
       AND quote_prepared_date = TO_DATE('17-May-2026','dd-Mon-yyyy')
);

COMMIT;