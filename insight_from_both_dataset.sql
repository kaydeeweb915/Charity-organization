-- USING THE donation_data and donor_data2 FROM 
-- THE charity_organization DATABASE 
-- LET GENERATE SOME INSIGHT FROM THEM.


-- Top Ten (10) candidate who donate more, with their
-- state, university, etc.

-- TOTAL AMOUNT DONATED

SELECT  
      SUM(donation) AS Total_donation
FROM Donation_Data;

-- TOTAL AMOUNT DONATED BY BOTH MALE AND FEMALE

SELECT gender, 
      COUNT(gender) as gender_count, 
	 SUM(donation)
FROM Donation_Data
GROUP BY gender;


SELECT
      Donation_Data.first_name,
      Donation_Data.last_name,
      Donation_Data.email,
      Donation_Data.gender,
      Donation_Data.job_field,
      Donation_Data.donation,
      Donation_Data.state,
      Donor_Data2.donation_frequency,
      Donor_Data2.university
FROM Donation_Data
JOIN Donor_Data2
ON Donation_Data.id = Donor_Data2.id
ORDER BY donation DESC
LIMIT 10;

--  DONOR FREQUENCY WITH HIGHEST DONATION
SELECT donation_frequency, 
      COUNT(*) AS Total
FROM Donor_Data2
GROUP BY donation_frequency; 

-- STATE WITH HIGHEST DONOR

SELECT Donation_Data.state,
       SUM(Donation_Data.donation) as sum_donor,
       COUNT(*) As total_donor
FROM Donation_Data
GROUP BY Donation_Data.state
ORDER BY sum_donor DESC;

-- COUNT OF GENDER PER DONATION

SELECT gender, 
       COUNT(*) AS Total
FROM Donation_Data
GROUP BY gender;

-- JOB FIELD WITH THIER AVERAGE DONATION FREQUENCY

SELECT Donation_Data.job_field,ROUND
	   (AVG(Donation_Data.donation), 2) AS
      Average_donation, Donor_Data2.donation_frequency
FROM Donation_Data
JOIN Donor_Data2
ON Donation_Data.id = Donor_Data2.id
GROUP by Donation_Data.job_field;

-- DISTINCT STATE AND THIER DONATION AMOUNT

SELECT  DISTINCT(State), 
       SUM(donation) as donation
FROM Donation_Data
GROUP BY state
ORDER BY sum(donation) DESC ;


-- AVERAGE DONATION BASED ON FREQUENCY RATE

SELECT  Donor_Data2.donation_frequency,
        ROUND(avg(Donation_Data.donation),3) asAVG_donation,
        SUM(Donation_Data.donation) as total_donation,
        COUNT(Donation_Data.donation) as donation_freq_rate
FROM Donation_Data
JOIN Donor_Data2
ON Donation_Data.id=Donor_Data2.id
GROUP BY Donor_Data2.donation_frequency ; 















