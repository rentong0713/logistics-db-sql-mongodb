# BigRig Movers (BRM) Logistics Database System

This repository contains the database architecture, implementation, and analytics scripts for BigRig Movers, a trucking and logistics company[cite: 15]. The project showcases a hybrid database environment, utilizing both a Relational Database Management System (Oracle 12c) for core transactional operations and a NoSQL database (MongoDB) for flexible customer analytics[cite: 13, 15, 28].

## Technologies Used
* **Relational Database:** Oracle RDBMS (SQL)[cite: 13]
* **NoSQL Database:** MongoDB[cite: 13]
* **Version Control:** Git[cite: 19]

## Technical Highlights
* **Relational Implementation (DDL/DML):** Built and populated tables enforcing strict data integrity via Primary/Foreign Keys, `UNIQUE` constraints, and specific `CHECK` constraints[cite: 20, 35]. Managed complex transactions securely using `COMMIT` protocols[cite: 21, 37].
* **Live Schema Modification:** Safely altered live database structures using `ALTER TABLE` to introduce new business logic (e.g., quote status tracking and service maintenance logs) without compromising existing data[cite: 24, 25, 38].
* **Advanced SQL Analytics:** Developed complex reporting queries utilizing `LEFT OUTER JOIN`s, conditional aggregation (`CASE` statements within `SUM`/`COUNT`), and dynamic string formatting to extract business intelligence on customer behavior and fleet utilization[cite: 25, 26, 27, 39].
* **Relational to NoSQL Mapping:** Engineered a migration pipeline that extracted relational data into nested JSON documents using `JSON_OBJECT` and `JSON_ARRAYAGG`[cite: 40]. The data was subsequently ingested into MongoDB for NoSQL querying and document updates using commands like `$set`, `$push`, and `$regex`[cite: 28, 29, 41].

## Repository Contents
* `T1-brm-schema.sql`: Table creation and constraint definition[cite: 20, 35].
* `T2-brm-insert.sql`: Initial state data population and transaction management[cite: 21, 36].
* `T3-brm-dm.sql` & `T4-brm-mods.sql`: Sequence creation, live data manipulation, and structural schema modifications[cite: 22, 24, 37, 38].
* `T5-brm-select.sql`: Advanced business intelligence and reporting queries[cite: 25, 39].
* `T6-brm-json.sql` & `T6-brm-mongo.mongodb.js`: JSON document generation and MongoDB NoSQL operations[cite: 28, 29, 40, 41].
