// *****PLEASE ENTER YOUR DETAILS BELOW*****
// T6-brm-mongo.mongodb.js

// Student ID: 35672722
// Student Name: Low Ren Tong

// ===================================================================================
// DO NOT modify or remove any of the comments below (items marked with //)
// Do not use .pretty() in your code, it is not required
//
// -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
// In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
// ===================================================================================

// Use (connect to) your database - you MUST update xyz001
// with your authcate username
use("rlow0012");

// (b)
// PLEASE PLACE REQUIRED MONGODB COMMAND TO CREATE THE COLLECTION HERE
// YOU MAY PICK ANY COLLECTION NAME
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// Drop collection
db.brm_customers.drop();

// Create collection and insert documents
db.brm_customers.insertMany([
    
{"_id":1,"customer_name":"Michael Benjamin","customer_business":"FreshBox","customer_address":"55 Lonsdale Street, Melbourne, 3008","customer_phone":"0478901017","customer_stats":{"number_of_quotes":10,"number_of_jobs":5,"total_paid_jobcost":"$6,200.00","total_unpaid_jobcost":"$3,800.00"},"quotes":[{"quote_no":1,"quote_prepared_on":"01-May-2026","preferred_start_date":"05-May-2026","start_location":"Melbourne","end_location":"Sydney","quote_cost":"$1,500.00","assigned_to_job":"Y","job_cost":"$1,500.00"},{"quote_no":25,"quote_prepared_on":"19-May-2026","preferred_start_date":"30-May-2026","start_location":"Adelaide","end_location":"Port Lincoln","quote_cost":"$800.00","assigned_to_job":"N","job_cost":"-"},{"quote_no":24,"quote_prepared_on":"18-May-2026","preferred_start_date":"28-May-2026","start_location":"Perth","end_location":"Fremantle","quote_cost":"$300.00","assigned_to_job":"N","job_cost":"-"},{"quote_no":23,"quote_prepared_on":"17-May-2026","preferred_start_date":"25-May-2026","start_location":"Brisbane","end_location":"Gold Coast","quote_cost":"$400.00","assigned_to_job":"N","job_cost":"-"},{"quote_no":22,"quote_prepared_on":"16-May-2026","preferred_start_date":"22-May-2026","start_location":"Sydney","end_location":"Newcastle","quote_cost":"$600.00","assigned_to_job":"N","job_cost":"-"},{"quote_no":21,"quote_prepared_on":"15-May-2026","preferred_start_date":"20-May-2026","start_location":"Melbourne","end_location":"Geelong","quote_cost":"$500.00","assigned_to_job":"N","job_cost":"-"},{"quote_no":5,"quote_prepared_on":"05-May-2026","preferred_start_date":"15-May-2026","start_location":"Adelaide","end_location":"Melbourne","quote_cost":"$1,200.00","assigned_to_job":"Y","job_cost":"$1,200.00"},{"quote_no":4,"quote_prepared_on":"04-May-2026","preferred_start_date":"12-May-2026","start_location":"Perth","end_location":"Adelaide","quote_cost":"$2,200.00","assigned_to_job":"Y","job_cost":"$2,200.00"},{"quote_no":3,"quote_prepared_on":"03-May-2026","preferred_start_date":"10-May-2026","start_location":"Brisbane","end_location":"Perth","quote_cost":"$3,500.00","assigned_to_job":"Y","job_cost":"$3,500.00"},{"quote_no":2,"quote_prepared_on":"02-May-2026","preferred_start_date":"06-May-2026","start_location":"Sydney","end_location":"Brisbane","quote_cost":"$1,600.00","assigned_to_job":"Y","job_cost":"$1,600.00"}]},
{"_id":2,"customer_name":"James","customer_business":"J Wood and Gravel","customer_address":"15 George Street, Sydney, 2000","customer_phone":"0412345001","customer_stats":{"number_of_quotes":10,"number_of_jobs":5,"total_paid_jobcost":"$5,700.00","total_unpaid_jobcost":"$1,545.00"},"quotes":[{"quote_no":6,"quote_prepared_on":"06-May-2026","preferred_start_date":"20-May-2026","start_location":"Sydney","end_location":"Canberra","quote_cost":"$850.00","assigned_to_job":"Y","job_cost":"$870.00"},{"quote_no":30,"quote_prepared_on":"05-Jun-2026","preferred_start_date":"20-Jun-2026","start_location":"Adelaide","end_location":"Mount Gambier","quote_cost":"$700.00","assigned_to_job":"N","job_cost":"-"},{"quote_no":29,"quote_prepared_on":"04-Jun-2026","preferred_start_date":"18-Jun-2026","start_location":"Perth","end_location":"Bunbury","quote_cost":"$600.00","assigned_to_job":"N","job_cost":"-"},{"quote_no":28,"quote_prepared_on":"03-Jun-2026","preferred_start_date":"15-Jun-2026","start_location":"Brisbane","end_location":"Toowoomba","quote_cost":"$550.00","assigned_to_job":"N","job_cost":"-"},{"quote_no":27,"quote_prepared_on":"02-Jun-2026","preferred_start_date":"12-Jun-2026","start_location":"Melbourne","end_location":"Ballarat","quote_cost":"$400.00","assigned_to_job":"N","job_cost":"-"},{"quote_no":26,"quote_prepared_on":"01-Jun-2026","preferred_start_date":"10-Jun-2026","start_location":"Sydney","end_location":"Wollongong","quote_cost":"$450.00","assigned_to_job":"N","job_cost":"-"},{"quote_no":10,"quote_prepared_on":"10-May-2026","preferred_start_date":"30-May-2026","start_location":"Launceston","end_location":"Melbourne","quote_cost":"$2,400.00","assigned_to_job":"Y","job_cost":"$2,380.00"},{"quote_no":9,"quote_prepared_on":"09-May-2026","preferred_start_date":"28-May-2026","start_location":"Hobart","end_location":"Launceston","quote_cost":"$600.00","assigned_to_job":"Y","job_cost":"$620.00"},{"quote_no":8,"quote_prepared_on":"08-May-2026","preferred_start_date":"25-May-2026","start_location":"Melbourne","end_location":"Hobart","quote_cost":"$2,500.00","assigned_to_job":"Y","job_cost":"$2,450.00"},{"quote_no":7,"quote_prepared_on":"07-May-2026","preferred_start_date":"22-May-2026","start_location":"Canberra","end_location":"Melbourne","quote_cost":"$900.00","assigned_to_job":"Y","job_cost":"$925.00"}]},
{"_id":3,"customer_name":"Brook","customer_business":"Western Chocolatery","customer_address":"23 Murray Street, Perth, 6000","customer_phone":"0445678004","customer_stats":{"number_of_quotes":3,"number_of_jobs":3,"total_paid_jobcost":"$4,060.00","total_unpaid_jobcost":"$880.00"},"quotes":[{"quote_no":11,"quote_prepared_on":"11-May-2026","preferred_start_date":"01-Jun-2026","start_location":"Brisbane","end_location":"Cairns","quote_cost":"$3,200.00","assigned_to_job":"Y","job_cost":"$3,250.00"},{"quote_no":13,"quote_prepared_on":"13-May-2026","preferred_start_date":"10-Jun-2026","start_location":"Townsville","end_location":"Mackay","quote_cost":"$800.00","assigned_to_job":"Y","job_cost":"$810.00"},{"quote_no":12,"quote_prepared_on":"12-May-2026","preferred_start_date":"05-Jun-2026","start_location":"Cairns","end_location":"Townsville","quote_cost":"$900.00","assigned_to_job":"Y","job_cost":"$880.00"}]},
{"_id":4,"customer_name":"Alexander Noah","customer_business":"-","customer_address":"56 Bourke Street, Melbourne, 3001","customer_phone":"0478901007","customer_stats":{"number_of_quotes":4,"number_of_jobs":4,"total_paid_jobcost":"$10,550.00","total_unpaid_jobcost":"$2,750.00"},"quotes":[{"quote_no":14,"quote_prepared_on":"14-May-2026","preferred_start_date":"15-Jun-2026","start_location":"Perth","end_location":"Broome","quote_cost":"$4,500.00","assigned_to_job":"Y","job_cost":"$4,600.00"},{"quote_no":17,"quote_prepared_on":"17-May-2026","preferred_start_date":"30-Jun-2026","start_location":"Alice Springs","end_location":"Adelaide","quote_cost":"$2,900.00","assigned_to_job":"Y","job_cost":"$2,800.00"},{"quote_no":16,"quote_prepared_on":"16-May-2026","preferred_start_date":"25-Jun-2026","start_location":"Darwin","end_location":"Alice Springs","quote_cost":"$3,100.00","assigned_to_job":"Y","job_cost":"$3,150.00"},{"quote_no":15,"quote_prepared_on":"15-May-2026","preferred_start_date":"20-Jun-2026","start_location":"Broome","end_location":"Darwin","quote_cost":"$2,800.00","assigned_to_job":"Y","job_cost":"$2,750.00"}]},
{"_id":5,"customer_name":"Jack Ethan","customer_business":"-","customer_address":"61 Ann Street, Brisbane, 4101","customer_phone":"0434567013","customer_stats":{"number_of_quotes":3,"number_of_jobs":3,"total_paid_jobcost":"$1,800.00","total_unpaid_jobcost":"$1,125.00"},"quotes":[{"quote_no":18,"quote_prepared_on":"18-May-2026","preferred_start_date":"05-Jul-2026","start_location":"Adelaide","end_location":"Broken Hill","quote_cost":"$1,100.00","assigned_to_job":"Y","job_cost":"$1,125.00"},{"quote_no":20,"quote_prepared_on":"20-May-2026","preferred_start_date":"15-Jul-2026","start_location":"Mildura","end_location":"Melbourne","quote_cost":"$950.00","assigned_to_job":"Y","job_cost":"$980.00"},{"quote_no":19,"quote_prepared_on":"19-May-2026","preferred_start_date":"10-Jul-2026","start_location":"Broken Hill","end_location":"Mildura","quote_cost":"$850.00","assigned_to_job":"Y","job_cost":"$820.00"}]},
{"_id":18,"customer_name":"Victoria Ella","customer_business":"Flintstone Store","customer_address":"94 Henley Beach Road, Adelaide, 5095","customer_phone":"0401234020","customer_stats":{"number_of_quotes":1,"number_of_jobs":0,"total_paid_jobcost":"-","total_unpaid_jobcost":"-"},"quotes":[{"quote_no":300,"quote_prepared_on":"17-May-2026","preferred_start_date":"25-May-2026","start_location":"29 Kuranda Road, Adelaide SA 5030","end_location":"9 Albatros Drive, Mount Gambier SA 5270","quote_cost":"$1,000.00","assigned_to_job":"N","job_cost":"-"}]}

]);

// List all documents you added
db.brm_customers.find();

// (c)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// Find customers living in Melbourne with 2 or more quotes, projecting only the requested fields
db.brm_customers.find(
    {
        "customer_address": { "$regex": "Melbourne", "$options": "i" },
        "customer_stats.number_of_quotes": { "$gte": 2 }
    },
    {
        "_id": 1,
        "customer_name": 1,
        "customer_address": 1,
        "customer_phone": 1,
        "customer_stats.number_of_quotes": 1,
        "customer_stats.number_of_jobs": 1,
        "customer_stats.total_paid_jobcost": 1,
        "customer_stats.total_unpaid_jobcost": 1
    }
);

// (d)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// (i)  Add the new customer
// Insert Patrick Bosse with default/empty values for stats and quotes
db.brm_customers.insertOne({
    "_id": 1001,
    "customer_name": "Patrick Bosse",
    "customer_business": "-",
    "customer_address": "123 Standard Way, Melbourne, 3000",
    "customer_phone": "0400111222",
    "customer_stats": {
        "number_of_quotes": 0,
        "number_of_jobs": 0,
        "total_paid_jobcost": "-",
        "total_unpaid_jobcost": "-"
    },
    "quotes": []
});

// Show the customer details
db.brm_customers.find({ "_id": 1001 });

// (ii) Add new quote
// Update Patrick Bosse's document by pushing the new quote and updating the stats manually
db.brm_customers.updateOne(
    { "_id": 1001 },
    {
        "$set": {
            "customer_stats.number_of_quotes": 1,
            "customer_stats.number_of_jobs": 1,
            "customer_stats.total_paid_jobcost": "$3,200.00",
            "customer_stats.total_unpaid_jobcost": "-"
        },
        "$push": {
            "quotes": {
                "quote_no": 2002,
                "quote_prepared_on": "10-Aug-2026",
                "preferred_start_date": "15-Aug-2026",
                "start_location": "Adelaide SA",
                "end_location": "Melbourne VIC",
                "quote_cost": "$3,200.00",
                "assigned_to_job": "Y",
                "job_cost": "$3,200.00"
            }
        }
    }
);

// Show the customer details
db.brm_customers.find({ "_id": 1001 });

// End of file - do not remove
