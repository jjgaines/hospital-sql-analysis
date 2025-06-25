# Hospital SQL Analysis

This project uses SQL (MySQL) to analyze fictional patient appointment data from a hospital system. The goal was to explore operational patterns such as no-show rates, department usage, and patient behavior. All queries were executed using DBeaver with CSV data imported into MySQL.

## 📁 Files
- `queries.sql`: Core SQL queries used in the analysis
- `appointments.csv`, `patients.csv`: Raw datasets used to build the database

## 🔍 Analysis Overview

The following questions were answered through SQL:

1. **How many total appointments are there for each appointment status?**  
2. **Which cities have the most patients? (Top 5)**  
3. **What percentage of appointments were No-Shows by department?**  
4. **How many patients had more than one appointment?**  
5. **What is the most common department for appointments?**  
6. **How many appointments were scheduled but never completed?** *(No-Shows + Cancellations)*  
7. **Which patients had appointments in more than one department?**  
8. **Who missed appointments? (No-Shows with name, city, date, and department)**  
9. **How many unique patients visited each department from each city?**

## 🛠 Tools Used

- **SQL (MySQL)**: Aggregations, joins, subqueries, conditional logic
- **DBeaver**: Data import, schema creation, and query execution
- **CSV Files**: Used as mock source data for patients and appointments

## ✅ Status

This is a complete SQL-only analysis project focused on building queries to extract operational insights from structured hospital data. Future additions may include Tableau dashboards or expanded query sets.
