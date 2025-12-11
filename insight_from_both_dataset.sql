-- Charity Fundraising Insights Using SQL
-- Analyzing Donation_Data and Donor_Data2 from the charity_organization database

/*-----------------------------------------------------------
    TOTAL DONATION AMOUNT
------------------------------------------------------------*/
SELECT  
      SUM(donation) AS total_donation
FROM Donation_Data;


/*-----------------------------------------------------------
    TOTAL DONATION BY GENDER
------------------------------------------------------------*/
SELECT 
      gender, 
      COUNT(*) AS gender_count, 
      SUM(donation) AS total_donation
FROM Donation_Data
GROUP BY gender;


/*-----------------------------------------------------------
    TOP 10 DONORS (Joined With Donor Profile)
------------------------------------------------------------*/
SELECT
      d.first_name,
      d.last_name,
      d.email,
      d.gender,
      d.job_field,
      d.donation,
      d.state,
      r.donation_frequency,
      r.university
FROM Donation_Data d
JOIN Donor_Data2 r
      ON d.id = r.id
ORDER BY d.donation DESC
LIMIT 10;


/*-----------------------------------------------------------
    DONATION FREQUENCY DISTRIBUTION
------------------------------------------------------------*/
SELECT 
      donation_frequency, 
      COUNT(*) AS donor_count
FROM Donor_Data2
GROUP BY donation_frequency;


/*-----------------------------------------------------------
    STATES WITH THE HIGHEST DONATION TOTALS
------------------------------------------------------------*/
SELECT 
      state,
      SUM(donation) AS total_donation,
      COUNT(*) AS total_donors
FROM Donation_Data
GROUP BY state
ORDER BY total_donation DESC;


/*-----------------------------------------------------------
    DONOR COUNT BY GENDER
------------------------------------------------------------*/
SELECT 
      gender, 
      COUNT(*) AS donor_count
FROM Donation_Data
GROUP BY gender;


/*-----------------------------------------------------------
    AVERAGE DONATION BY JOB FIELD
------------------------------------------------------------*/
SELECT 
      d.job_field,
      ROUND(AVG(d.donation), 2) AS avg_donation
FROM Donation_Data d
GROUP BY d.job_field
ORDER BY avg_donation DESC;


/*-----------------------------------------------------------
    DONATION SUM BY STATE (Distinct View)
------------------------------------------------------------*/
SELECT  
      state, 
      SUM(donation) AS total_donation
FROM Donation_Data
GROUP BY state
ORDER BY total_donation DESC;


/*-----------------------------------------------------------
    AVERAGE & TOTAL DONATION BY FREQUENCY TYPE
------------------------------------------------------------*/
SELECT  
      r.donation_frequency,
      ROUND(AVG(d.donation), 2) AS avg_donation,
      SUM(d.donation) AS total_donation,
      COUNT(d.donation) AS donation_count
FROM Donation_Data d
JOIN Donor_Data2 r
      ON d.id = r.id
GROUP BY r.donation_frequency;
