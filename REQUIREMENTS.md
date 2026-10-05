# Business Requirements: BigRig Movers (BRM)

The BRM database system is required to support the daily operational activities of a national trucking logistics business. The system must securely store, manage, and query data across the following core business domains:

## 1. Fleet & Asset Management

* Maintain a registry of **Prime Movers (Trucks)** identified by VIN, tracking registration details, total mileage, and service history.
* Register **Transport Trailers**, tracking their unique codes and purchase costs.
* Track specific **Truck/Trailer Combinations** used for fulfilling customer jobs.
* Log detailed **service maintenance events** for trucks, including specific service tasks performed by mechanics and free-text diagnostic notes.

## 2. Employee & Role Management

* Manage a **staff directory** with defined operational roles:

  * Managers (B)
  * Truck Dispatchers (T)
  * Mechanics (M)
  * Drivers (D)
* Maintain **reporting lines**, ensuring employees are mapped to their respective managers.
* Track **driver-specific credentials**, such as valid driver's licence numbers.

## 3. Quoting & Customer Lifecycle

* Register **customer profiles**, capturing full names, business names (if applicable), and contact details.
* Generate **logistics quotes** specifying start/end locations, preferred dates, and calculated costs.
* Track the **status of all quotes** to determine if they:

  * Remain pending
  * Have been rejected with a reason
  * Have successfully converted into active jobs

## 4. Job Scheduling & Dispatch

* Convert **accepted quotes** into actionable scheduled jobs.
* Assign specific operational resources to each job:

  * A Truck Dispatcher
  * A scheduled Driver
  * A specific Truck/Trailer Combination
* Handle **pricing discrepancies** between the initial quote and the final job cost due to scheduling changes.
* Monitor **financial settlement** by tracking job payment statuses (`Y`/`N`).

## 5. NoSQL Analytics (MongoDB)

* Aggregate **customer lifetime data**, such as:

  * Total quotes made
  * Total jobs agreed
  * Total paid/unpaid job costs
* Store this information as **self-contained JSON documents**.
* Support NoSQL querying to rapidly identify **high-value customer segments**, such as specific geographic regions with high quote volumes.
* Update individual documents seamlessly as new quotes are generated.
