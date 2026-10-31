use carewell_db;
select count(*)from carewell_db;

--
-- ============================================================================
-- CareWell Healthcare Analytics Hackathon - Complete SQL Deliverable
-- Dataset: carewell_cleaned
-- ============================================================================

-- 1. Use SQL to calculate average length of stay by department and hospital
SELECT 
    hospital,
    department,
    ROUND(AVG(length_of_stay), 2) AS avg_length_of_stay
FROM carewell_cleaned
GROUP BY hospital, department
ORDER BY avg_length_of_stay DESC;


-- 2. Use SQL to calculate monthly bed occupancy by department and hospital and flag months above 90%
SELECT 
    hospital,
    department,
    admission_month,
    SUM(length_of_stay) AS total_patient_days,
    MAX(total_beds) AS total_beds,
    ROUND((SUM(length_of_stay) / (MAX(total_beds) * 30.0)) * 100, 2) AS monthly_bed_occupancy_pct,
    CASE 
        WHEN (SUM(length_of_stay) / (MAX(total_beds) * 30.0)) * 100 > 90.0 THEN 'ABOVE 90%'
        ELSE 'Normal'
    END AS occupancy_flag
FROM carewell_cleaned
GROUP BY hospital, department, admission_month
ORDER BY monthly_bed_occupancy_pct DESC;


-- 3. Use SQL to find 30-day readmission rates by diagnosis category
SELECT 
    diagnosis_category,
    COUNT(admission_id) AS total_admissions,
    SUM(is_readmitted_30d) AS readmissions_30d,
    ROUND((SUM(is_readmitted_30d) * 100.0) / COUNT(admission_id), 2) AS readmission_rate_pct
FROM carewell_cleaned
GROUP BY diagnosis_category
ORDER BY readmission_rate_pct DESC;


-- 4. Use SQL to calculate claim rejection rates and revenue lost by payment type
SELECT 
    payment_type,
    COUNT(admission_id) AS total_claims,
    COUNT(CASE WHEN claim_status = 'Rejected' THEN 1 END) AS rejected_claims,
    ROUND((COUNT(CASE WHEN claim_status = 'Rejected' THEN 1 END) * 100.0) / COUNT(admission_id), 2) AS claim_rejection_rate_pct,
    ROUND(SUM(revenue_lost), 2) AS total_revenue_lost
FROM carewell_cleaned
GROUP BY payment_type
ORDER BY total_revenue_lost DESC;

