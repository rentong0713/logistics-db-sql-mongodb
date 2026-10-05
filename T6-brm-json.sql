/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T6-brm-json.sql

--Student ID: 35672722
--Student Name: Low Ren Tong

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/

   SET PAGESIZE 100
SET WRAP OFF
SET HEADING OFF

-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

-- Generate a JSON document for each customer, containing their details, aggregated statistics, and an array of their quotes.
-- Use NVL and CASE within the SUM functions to accurately calculate paid/unpaid totals, falling back to quote_cost if the final job_cost is NULL.
-- A trailing comma ',' is appended to each row to format the output for easy insertion into MongoDB.

SELECT
    JSON_OBJECT(
        '_id' VALUE c.cust_no,
                'customer_name' VALUE TRIM(c.cust_gname
                                           || ' ' || c.cust_fname),
                'customer_business' VALUE nvl(
            c.cust_bname,
            '-'
        ),
                'customer_address' VALUE c.cust_street
                                         || ', '
                                         || c.cust_town
                                         || ', '
                                         || c.cust_pcode,
                'customer_phone' VALUE c.cust_contact_no,
                'customer_stats' VALUE
            JSON_OBJECT(
                'number_of_quotes' VALUE COUNT(q.quote_no),
                        'number_of_jobs' VALUE COUNT(j.job_no),
                        'total_paid_jobcost' VALUE nvl(
                    to_char(
                        sum(
                            CASE
                                WHEN j.job_payment_made = 'Y' THEN
                                    nvl(
                                        j.job_cost,
                                        q.quote_cost
                                    )
                            END
                        ),
                        'fm$99,999,990.00'
                    ),
                    '-'
                ),
                        'total_unpaid_jobcost' VALUE nvl(
                    to_char(
                        sum(
                            CASE
                                WHEN j.job_payment_made = 'N' THEN
                                    nvl(
                                        j.job_cost,
                                        q.quote_cost
                                    )
                            END
                        ),
                        'fm$99,999,990.00'
                    ),
                    '-'
                )
            ),
                'quotes' VALUE JSON_ARRAYAGG(
            JSON_OBJECT(
                'quote_no' VALUE q.quote_no,
                        'quote_prepared_on' VALUE to_char(
                    q.quote_prepared_date,
                    'dd-Mon-yyyy'
                ),
                        'preferred_start_date' VALUE to_char(
                    q.quote_pref_start_date,
                    'dd-Mon-yyyy'
                ),
                        'start_location' VALUE q.quote_start_location,
                        'end_location' VALUE q.quote_end_location,
                        'quote_cost' VALUE to_char(
                    q.quote_cost,
                    'fm$99,999,990.00'
                ),
                        'assigned_to_job' VALUE
                    CASE
                        WHEN j.job_no IS NOT NULL THEN
                            'Y'
                        ELSE
                            'N'
                    END,
                        'job_cost' VALUE
                    CASE
                        WHEN j.job_no IS NOT NULL THEN
                            to_char(
                                nvl(
                                    j.job_cost,
                                    q.quote_cost
                                ),
                                'fm$99,999,990.00'
                            )
                        ELSE
                            '-'
                    END
            )
        )
    FORMAT JSON)
    || ','
  FROM customer c
  JOIN quote q
ON c.cust_no = q.cust_no -- INNER JOIN to filter out customers with 0 quotes
  LEFT OUTER JOIN job j
ON q.quote_no = j.quote_no
 GROUP BY c.cust_no,
          c.cust_gname,
          c.cust_fname,
          c.cust_bname,
          c.cust_street,
          c.cust_town,
          c.cust_pcode,
          c.cust_contact_no;