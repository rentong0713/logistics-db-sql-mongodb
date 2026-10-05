/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-brm-insert.sql

--Student ID: 35672722
--Student Name: Low Ren Tong

/*
Indicate if AI was used (Yes/No): Yes

If AI was used:
I used <<Gemini>>
I used these prompts:
Generate 10 employees, 30 quotes, and 20 jobs conforming to the assignment rules for BRM. Ensure dates are between May 1 2026 and July 31 2026. PKs must be below 100. Adhere to the minimum count rules for roles, combinations, and cost differences.
*/


--------------------------------------
--INSERT INTO employee
--------------------------------------
-- Managers (Role 'B'). They report to the owner (NULL).
INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES ( 1,
           'Alice',
           'Smith',
           '0400000001',
           NULL,
           'B',
           NULL );

INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES ( 2,
           'Bob',
           'Jones',
           '0400000002',
           NULL,
           'B',
           NULL );

-- Dispatchers (Role 'T'). They report to Managers.
INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES ( 3,
           'Charlie',
           'Brown',
           '0400000003',
           NULL,
           'T',
           1 );

INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES ( 4,
           'Diana',
           'Prince',
           '0400000004',
           NULL,
           'T',
           2 );

-- Mechanics (Role 'M').
INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES ( 5,
           'Evan',
           'Wright',
           '0400000005',
           NULL,
           'M',
           1 );

INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES ( 6,
           'Fiona',
           'Gallagher',
           '0400000006',
           NULL,
           'M',
           2 );

INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES ( 7,
           'George',
           'Miller',
           '0400000007',
           NULL,
           'M',
           1 );

-- Drivers (Role 'D'). Must have license numbers.
INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES ( 8,
           'Harry',
           'Potter',
           '0400000008',
           'LIC00000001',
           'D',
           1 );

INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES ( 9,
           'Ian',
           'Malcolm',
           '0400000009',
           'LIC00000002',
           'D',
           2 );

INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES ( 10,
           'Julia',
           'Roberts',
           '0400000010',
           'LIC00000003',
           'D',
           1 );

-- Required Manager for Task 3
INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES ( 11,
           'Sarah',
           'Mitchell',
           '0400000011',
           NULL,
           'B',
           NULL );

-- Required Driver for Task 3
INSERT INTO employee (
    emp_no,
    emp_gname,
    emp_fname,
    emp_contact_no,
    emp_licenceno,
    emp_role,
    emp_no_manager
) VALUES ( 12,
           'Michael',
           'Johnson',
           '0400000012',
           'LIC00000004',
           'D',
           1 );

--------------------------------------
--INSERT INTO quote
--------------------------------------
-- Using Customers 1, 2, 3, 4, 5. Customers 1 and 2 will place multiple quotes.
-- Using Dispatchers 3 and 4.
-- Dates between 01-May-2026 and 31-Jul-2026.

-- Customer 1 (Places 10 quotes)
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 1,
           TO_DATE('01-May-2026','dd-Mon-yyyy'),
           TO_DATE('05-May-2026','dd-Mon-yyyy'),
           'Melbourne',
           'Sydney',
           1500.00,
           1,
           3 );
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 2,
           TO_DATE('02-May-2026','dd-Mon-yyyy'),
           TO_DATE('06-May-2026','dd-Mon-yyyy'),
           'Sydney',
           'Brisbane',
           1600.00,
           1,
           4 );
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 3,
           TO_DATE('03-May-2026','dd-Mon-yyyy'),
           TO_DATE('10-May-2026','dd-Mon-yyyy'),
           'Brisbane',
           'Perth',
           3500.00,
           1,
           3 );
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 4,
           TO_DATE('04-May-2026','dd-Mon-yyyy'),
           TO_DATE('12-May-2026','dd-Mon-yyyy'),
           'Perth',
           'Adelaide',
           2200.00,
           1,
           4 );
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 5,
           TO_DATE('05-May-2026','dd-Mon-yyyy'),
           TO_DATE('15-May-2026','dd-Mon-yyyy'),
           'Adelaide',
           'Melbourne',
           1200.00,
           1,
           3 );
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 21,
           TO_DATE('15-May-2026','dd-Mon-yyyy'),
           TO_DATE('20-May-2026','dd-Mon-yyyy'),
           'Melbourne',
           'Geelong',
           500.00,
           1,
           3 );
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 22,
           TO_DATE('16-May-2026','dd-Mon-yyyy'),
           TO_DATE('22-May-2026','dd-Mon-yyyy'),
           'Sydney',
           'Newcastle',
           600.00,
           1,
           4 );
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 23,
           TO_DATE('17-May-2026','dd-Mon-yyyy'),
           TO_DATE('25-May-2026','dd-Mon-yyyy'),
           'Brisbane',
           'Gold Coast',
           400.00,
           1,
           3 );
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 24,
           TO_DATE('18-May-2026','dd-Mon-yyyy'),
           TO_DATE('28-May-2026','dd-Mon-yyyy'),
           'Perth',
           'Fremantle',
           300.00,
           1,
           4 );
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 25,
           TO_DATE('19-May-2026','dd-Mon-yyyy'),
           TO_DATE('30-May-2026','dd-Mon-yyyy'),
           'Adelaide',
           'Port Lincoln',
           800.00,
           1,
           3 );

-- Customer 2 (Places 10 quotes)
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 6,
           TO_DATE('06-May-2026','dd-Mon-yyyy'),
           TO_DATE('20-May-2026','dd-Mon-yyyy'),
           'Sydney',
           'Canberra',
           850.00,
           2,
           4 );
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 7,
           TO_DATE('07-May-2026','dd-Mon-yyyy'),
           TO_DATE('22-May-2026','dd-Mon-yyyy'),
           'Canberra',
           'Melbourne',
           900.00,
           2,
           3 );
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 8,
           TO_DATE('08-May-2026','dd-Mon-yyyy'),
           TO_DATE('25-May-2026','dd-Mon-yyyy'),
           'Melbourne',
           'Hobart',
           2500.00,
           2,
           4 );
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 9,
           TO_DATE('09-May-2026','dd-Mon-yyyy'),
           TO_DATE('28-May-2026','dd-Mon-yyyy'),
           'Hobart',
           'Launceston',
           600.00,
           2,
           3 );
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 10,
           TO_DATE('10-May-2026','dd-Mon-yyyy'),
           TO_DATE('30-May-2026','dd-Mon-yyyy'),
           'Launceston',
           'Melbourne',
           2400.00,
           2,
           4 );
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 26,
           TO_DATE('01-Jun-2026','dd-Mon-yyyy'),
           TO_DATE('10-Jun-2026','dd-Mon-yyyy'),
           'Sydney',
           'Wollongong',
           450.00,
           2,
           4 );
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 27,
           TO_DATE('02-Jun-2026','dd-Mon-yyyy'),
           TO_DATE('12-Jun-2026','dd-Mon-yyyy'),
           'Melbourne',
           'Ballarat',
           400.00,
           2,
           3 );
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 28,
           TO_DATE('03-Jun-2026','dd-Mon-yyyy'),
           TO_DATE('15-Jun-2026','dd-Mon-yyyy'),
           'Brisbane',
           'Toowoomba',
           550.00,
           2,
           4 );
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 29,
           TO_DATE('04-Jun-2026','dd-Mon-yyyy'),
           TO_DATE('18-Jun-2026','dd-Mon-yyyy'),
           'Perth',
           'Bunbury',
           600.00,
           2,
           3 );
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 30,
           TO_DATE('05-Jun-2026','dd-Mon-yyyy'),
           TO_DATE('20-Jun-2026','dd-Mon-yyyy'),
           'Adelaide',
           'Mount Gambier',
           700.00,
           2,
           4 );

-- Customer 3
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 11,
           TO_DATE('11-May-2026','dd-Mon-yyyy'),
           TO_DATE('01-Jun-2026','dd-Mon-yyyy'),
           'Brisbane',
           'Cairns',
           3200.00,
           3,
           3 );
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 12,
           TO_DATE('12-May-2026','dd-Mon-yyyy'),
           TO_DATE('05-Jun-2026','dd-Mon-yyyy'),
           'Cairns',
           'Townsville',
           900.00,
           3,
           4 );
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 13,
           TO_DATE('13-May-2026','dd-Mon-yyyy'),
           TO_DATE('10-Jun-2026','dd-Mon-yyyy'),
           'Townsville',
           'Mackay',
           800.00,
           3,
           3 );

-- Customer 4
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 14,
           TO_DATE('14-May-2026','dd-Mon-yyyy'),
           TO_DATE('15-Jun-2026','dd-Mon-yyyy'),
           'Perth',
           'Broome',
           4500.00,
           4,
           4 );
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 15,
           TO_DATE('15-May-2026','dd-Mon-yyyy'),
           TO_DATE('20-Jun-2026','dd-Mon-yyyy'),
           'Broome',
           'Darwin',
           2800.00,
           4,
           3 );
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 16,
           TO_DATE('16-May-2026','dd-Mon-yyyy'),
           TO_DATE('25-Jun-2026','dd-Mon-yyyy'),
           'Darwin',
           'Alice Springs',
           3100.00,
           4,
           4 );
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 17,
           TO_DATE('17-May-2026','dd-Mon-yyyy'),
           TO_DATE('30-Jun-2026','dd-Mon-yyyy'),
           'Alice Springs',
           'Adelaide',
           2900.00,
           4,
           3 );

-- Customer 5
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 18,
           TO_DATE('18-May-2026','dd-Mon-yyyy'),
           TO_DATE('05-Jul-2026','dd-Mon-yyyy'),
           'Adelaide',
           'Broken Hill',
           1100.00,
           5,
           4 );
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 19,
           TO_DATE('19-May-2026','dd-Mon-yyyy'),
           TO_DATE('10-Jul-2026','dd-Mon-yyyy'),
           'Broken Hill',
           'Mildura',
           850.00,
           5,
           3 );
INSERT INTO quote (
    quote_no,
    quote_prepared_date,
    quote_pref_start_date,
    quote_start_location,
    quote_end_location,
    quote_cost,
    cust_no,
    emp_no
) VALUES ( 20,
           TO_DATE('20-May-2026','dd-Mon-yyyy'),
           TO_DATE('15-Jul-2026','dd-Mon-yyyy'),
           'Mildura',
           'Melbourne',
           950.00,
           5,
           4 );

--------------------------------------
--INSERT INTO job
--------------------------------------
-- Uses 10 different Combinations based on the supplied data. Each combination is used twice.
-- Jobs 1-5 have the SAME cost as the quote (job_cost is left NULL as per requirements).
-- Jobs 6-20 have DIFFERENT costs.
-- Uses Quotes 1-20 (Quotes 21-30 remain unfulfilled).
-- Drivers are 8, 9, 10. Schedulers are 3, 4.

-- Same cost as quote (job_cost is NULL)
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
) VALUES ( 1,
           TO_DATE('05-May-2026 08:00','dd-Mon-yyyy hh24:mi'),
           TO_DATE('06-May-2026 17:00','dd-Mon-yyyy hh24:mi'),
           NULL,
           'Y',
           1,
           4,
           8,
           '1HGBH41JXMN109186',
           'TRL01' );

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
) VALUES ( 2,
           TO_DATE('06-May-2026 09:00','dd-Mon-yyyy hh24:mi'),
           TO_DATE('08-May-2026 14:00','dd-Mon-yyyy hh24:mi'),
           NULL,
           'N',
           2,
           3,
           9,
           '2FMDK3GC8BBA12345',
           'TRL02' );

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
) VALUES ( 3,
           TO_DATE('10-May-2026 07:00','dd-Mon-yyyy hh24:mi'),
           TO_DATE('14-May-2026 18:00','dd-Mon-yyyy hh24:mi'),
           NULL,
           'Y',
           3,
           4,
           10,
           '3VWFE21C04M000001',
           'TRL03' );

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
) VALUES ( 4,
           TO_DATE('12-May-2026 10:00','dd-Mon-yyyy hh24:mi'),
           TO_DATE('15-May-2026 16:00','dd-Mon-yyyy hh24:mi'),
           NULL,
           'N',
           4,
           3,
           8,
           '4T1BF1FK5CU123456',
           'TRL04' );

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
) VALUES ( 5,
           TO_DATE('15-May-2026 08:30','dd-Mon-yyyy hh24:mi'),
           TO_DATE('16-May-2026 15:30','dd-Mon-yyyy hh24:mi'),
           NULL,
           'Y',
           5,
           4,
           9,
           '5FNRL5H40BB098765',
           'TRL05' );

-- Different cost from quote (job_cost is provided)
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
) VALUES ( 6,
           TO_DATE('20-May-2026 09:00','dd-Mon-yyyy hh24:mi'),
           TO_DATE('20-May-2026 14:00','dd-Mon-yyyy hh24:mi'),
           870.00,
           'Y',
           6,
           3,
           10,
           '1FTFW1ET5DFC10112',
           'TRL06' );

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
) VALUES ( 7,
           TO_DATE('22-May-2026 11:00','dd-Mon-yyyy hh24:mi'),
           TO_DATE('23-May-2026 11:00','dd-Mon-yyyy hh24:mi'),
           925.00,
           'N',
           7,
           4,
           8,
           '2C4RDGCG8ER123789',
           'TRL07' );

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
) VALUES ( 8,
           TO_DATE('25-May-2026 06:00','dd-Mon-yyyy hh24:mi'),
           TO_DATE('28-May-2026 16:00','dd-Mon-yyyy hh24:mi'),
           2450.00,
           'Y',
           8,
           3,
           9,
           '5XYKT3A69CG234567',
           'TRL08' );

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
) VALUES ( 9,
           TO_DATE('28-May-2026 08:00','dd-Mon-yyyy hh24:mi'),
           TO_DATE('29-May-2026 10:00','dd-Mon-yyyy hh24:mi'),
           620.00,
           'N',
           9,
           4,
           10,
           '1HGBH41JXMN109186',
           'TRL05' );

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
) VALUES ( 10,
           TO_DATE('30-May-2026 07:30','dd-Mon-yyyy hh24:mi'),
           TO_DATE('31-May-2026 19:30','dd-Mon-yyyy hh24:mi'),
           2380.00,
           'Y',
           10,
           3,
           8,
           '2FMDK3GC8BBA12345',
           'TRL08' );

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
) VALUES ( 11,
           TO_DATE('01-Jun-2026 09:00','dd-Mon-yyyy hh24:mi'),
           TO_DATE('04-Jun-2026 12:00','dd-Mon-yyyy hh24:mi'),
           3250.00,
           'Y',
           11,
           4,
           9,
           '1HGBH41JXMN109186',
           'TRL01' );

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
) VALUES ( 12,
           TO_DATE('05-Jun-2026 10:00','dd-Mon-yyyy hh24:mi'),
           TO_DATE('06-Jun-2026 15:00','dd-Mon-yyyy hh24:mi'),
           880.00,
           'N',
           12,
           3,
           10,
           '2FMDK3GC8BBA12345',
           'TRL02' );

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
) VALUES ( 13,
           TO_DATE('10-Jun-2026 08:00','dd-Mon-yyyy hh24:mi'),
           TO_DATE('11-Jun-2026 11:00','dd-Mon-yyyy hh24:mi'),
           810.00,
           'Y',
           13,
           4,
           8,
           '3VWFE21C04M000001',
           'TRL03' );

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
) VALUES ( 14,
           TO_DATE('15-Jun-2026 07:00','dd-Mon-yyyy hh24:mi'),
           TO_DATE('18-Jun-2026 18:00','dd-Mon-yyyy hh24:mi'),
           4600.00,
           'Y',
           14,
           3,
           9,
           '4T1BF1FK5CU123456',
           'TRL04' );

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
) VALUES ( 15,
           TO_DATE('20-Jun-2026 06:30','dd-Mon-yyyy hh24:mi'),
           TO_DATE('23-Jun-2026 14:30','dd-Mon-yyyy hh24:mi'),
           2750.00,
           'N',
           15,
           4,
           10,
           '5FNRL5H40BB098765',
           'TRL05' );

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
) VALUES ( 16,
           TO_DATE('25-Jun-2026 09:00','dd-Mon-yyyy hh24:mi'),
           TO_DATE('28-Jun-2026 10:00','dd-Mon-yyyy hh24:mi'),
           3150.00,
           'Y',
           16,
           3,
           8,
           '1FTFW1ET5DFC10112',
           'TRL06' );

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
) VALUES ( 17,
           TO_DATE('30-Jun-2026 08:00','dd-Mon-yyyy hh24:mi'),
           TO_DATE('03-Jul-2026 16:00','dd-Mon-yyyy hh24:mi'),
           2800.00,
           'Y',
           17,
           4,
           9,
           '2C4RDGCG8ER123789',
           'TRL07' );

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
) VALUES ( 18,
           TO_DATE('05-Jul-2026 10:00','dd-Mon-yyyy hh24:mi'),
           TO_DATE('06-Jul-2026 12:00','dd-Mon-yyyy hh24:mi'),
           1125.00,
           'N',
           18,
           3,
           10,
           '5XYKT3A69CG234567',
           'TRL08' );

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
) VALUES ( 19,
           TO_DATE('10-Jul-2026 07:30','dd-Mon-yyyy hh24:mi'),
           TO_DATE('11-Jul-2026 09:30','dd-Mon-yyyy hh24:mi'),
           820.00,
           'Y',
           19,
           4,
           8,
           '1HGBH41JXMN109186',
           'TRL05' );

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
) VALUES ( 20,
           TO_DATE('15-Jul-2026 08:00','dd-Mon-yyyy hh24:mi'),
           TO_DATE('16-Jul-2026 17:00','dd-Mon-yyyy hh24:mi'),
           980.00,
           'Y',
           20,
           3,
           9,
           '2FMDK3GC8BBA12345',
           'TRL08' );


COMMIT;