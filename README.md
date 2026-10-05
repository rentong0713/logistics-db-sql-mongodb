# BigRig Movers (BRM) Logistics Database System

This repository contains the database architecture, implementation, and analytics scripts for BigRig Movers, a trucking and logistics company. The project showcases a hybrid database environment, utilizing both a Relational Database Management System (Oracle 12c) for core transactional operations and a NoSQL database (MongoDB) for flexible customer analytics.

## Technologies Used

* **Relational Database:** Oracle RDBMS (SQL)
* **NoSQL Database:** MongoDB
* **Version Control:** Git

## Technical Highlights

* **Relational Implementation (DDL/DML):** Built and populated tables enforcing strict data integrity via Primary/Foreign Keys, `UNIQUE` constraints, and specific `CHECK` constraints. Managed complex transactions securely using `COMMIT` protocols.
* **Live Schema Modification:** Safely altered live database structures using `ALTER TABLE` to introduce new business logic (e.g., quote status tracking and service maintenance logs) without compromising existing data.
* **Advanced SQL Analytics:** Developed complex reporting queries utilizing `LEFT OUTER JOIN`s, conditional aggregation (`CASE` statements within `SUM`/`COUNT`), and dynamic string formatting to extract business intelligence on customer behavior and fleet utilization.
* **Relational to NoSQL Mapping:** Engineered a migration pipeline that extracted relational data into nested JSON documents using `JSON_OBJECT` and `JSON_ARRAYAGG`. The data was subsequently ingested into MongoDB for NoSQL querying and document updates using commands like `$set`, `$push`, and `$regex`.

## Repository Contents

* `T1-brm-schema.sql`: Table creation and constraint definition.
* `T2-brm-insert.sql`: Initial state data population and transaction management.
* `T3-brm-dm.sql` & `T4-brm-mods.sql`: Sequence creation, live data manipulation, and structural schema modifications.
* `T5-brm-select.sql`: Advanced business intelligence and reporting queries.
* `T6-brm-json.sql` & `T6-brm-mongo.mongodb.js`: JSON document generation and MongoDB NoSQL operations.
