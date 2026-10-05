--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T4-brm-mods.sql

--Student ID: 35672722
--Student Name: Low Ren Tong

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/

--4(a)
-- Add the new columns to the QUOTE table. 
-- The status defaults to 'N' (Not Assigned).
ALTER TABLE quote ADD (
    quote_status              CHAR(1) DEFAULT 'N' NOT NULL,
    quote_not_assigned_reason VARCHAR2(200)
);

-- Add a check constraint to enforce Y or N values for the status
ALTER TABLE quote
    ADD CONSTRAINT quote_status_chk CHECK ( quote_status IN ( 'Y',
                                                              'N' ) );

-- Add column comments
COMMENT ON COLUMN quote.quote_status IS
    'Status of a quote - whether it has been assigned to a job (Y) or not (N)';
COMMENT ON COLUMN quote.quote_not_assigned_reason IS
    'Reason for the quote not being converted to a job by the preferred start date';

-- Update the live data based on the current state (if a quote exists in the JOB table, set to Y)
UPDATE quote
   SET
    quote_status = 'Y'
 WHERE quote_no IN (
    SELECT quote_no
      FROM job
);

-- Commit the transaction for the data update
COMMIT;

-- Display the QUOTE table
DESC quote;

-- Display the data changes to verify the update worked successfully
SELECT quote_no,
       quote_status,
       quote_not_assigned_reason
  FROM quote;


--4(b)
-- We need three new tables to handle this requirement:
-- TASK: A reference table for the expanding list of service task types.
-- SERVICE: To record the actual service event for a truck.
-- SERVICE_TASK: An associative entity bridging the service event, the specific task, and the mechanic.

DROP TABLE task CASCADE CONSTRAINTS PURGE;

DROP TABLE service CASCADE CONSTRAINTS PURGE;

DROP TABLE service_task CASCADE CONSTRAINTS PURGE;

-- Create the TASK reference table
CREATE TABLE task (
    task_id   NUMBER(3) NOT NULL,
    task_name VARCHAR2(50) NOT NULL
);

-- Comment columns
COMMENT ON COLUMN task.task_id IS
    'Unique identifier for a standard service task type';
COMMENT ON COLUMN task.task_name IS
    'Name/description of the service task (e.g. oil change, tire rotation)';

-- Add contraints
ALTER TABLE task ADD CONSTRAINT task_pk PRIMARY KEY ( task_id );


-- Create the SERVICE table
CREATE TABLE service (
    service_id       NUMBER(5) NOT NULL,
    service_start_dt DATE NOT NULL,
    service_end_dt   DATE,
    truck_vin        CHAR(17) NOT NULL
);

-- Comment columns
COMMENT ON COLUMN service.service_id IS
    'Unique identifier for a truck service event';
COMMENT ON COLUMN service.service_start_dt IS
    'Start date and time the truck is serviced';
COMMENT ON COLUMN service.service_end_dt IS
    'End date and time the service was completed';
COMMENT ON COLUMN service.truck_vin IS
    'VIN of the truck receiving the service';

-- Add contraints
ALTER TABLE service ADD CONSTRAINT service_pk PRIMARY KEY ( service_id );

ALTER TABLE service
    ADD CONSTRAINT truck_service_fk FOREIGN KEY ( truck_vin )
        REFERENCES truck ( truck_vin );


-- Create the SERVICE_TASK associative table
CREATE TABLE service_task (
    service_id         NUMBER(5) NOT NULL,
    task_id            NUMBER(3) NOT NULL,
    emp_no             NUMBER(3) NOT NULL,
    service_task_notes VARCHAR2(200)
);

-- Comment columns
COMMENT ON COLUMN service_task.service_id IS
    'Identifier for the related service event';
COMMENT ON COLUMN service_task.task_id IS
    'Identifier for the related task type performed';
COMMENT ON COLUMN service_task.emp_no IS
    'Employee number of the mechanic who performed the task';
COMMENT ON COLUMN service_task.service_task_notes IS
    'Free text note explaining the specific task execution';

-- Composite primary key because a specific service can have multiple different tasks
ALTER TABLE service_task ADD CONSTRAINT service_task_pk PRIMARY KEY ( service_id,
                                                                      task_id );

-- Foreign keys
ALTER TABLE service_task
    ADD CONSTRAINT st_service_fk FOREIGN KEY ( service_id )
        REFERENCES service ( service_id );

ALTER TABLE service_task
    ADD CONSTRAINT st_task_fk FOREIGN KEY ( task_id )
        REFERENCES task ( task_id );

ALTER TABLE service_task
    ADD CONSTRAINT st_mechanic_fk FOREIGN KEY ( emp_no )
        REFERENCES employee ( emp_no );

-- Display the structural changes for the newly added tables
DESC task;
DESC service;
DESC service_task;