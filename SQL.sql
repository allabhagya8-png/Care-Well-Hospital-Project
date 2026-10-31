use carewell_db;
select count(*)from carewell_db;

--
-- ============================================================================
-- CareWell Healthcare Analytics Hackathon - Complete SQL Deliverable
-- Dataset: carewell_cleaned
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Query 1: Monthly Admission Trends & Peak Identification
-- ----------------------------------------------------------------------------
SELECT 
    admission_month,
    COUNT(admission_id) AS total_admissions,
    COUNT(CASE WHEN admission_type = 'Emergency' THEN 1 END) AS emergency_admissions,
    COUNT(CASE WHEN admission_type = 'Planned' THEN 1 END) AS planned_admissions
FROM carewell_cleaned
GROUP BY admission_month
ORDER BY admission_month;


-- ----------------------------------------------------------------------------
-- Query 2: Bed Occupancy Analysis by Hospital & Department
-- ----------------------------------------------------------------------------
SELECT 
    hospital,
    department,
    SUM(length_of_stay) AS total_patient_days,
    ROUND(AVG(length_of_stay), 2) AS avg_length_of_stay,
    MAX(total_beds) AS total_beds_allocated,
    ROUND((SUM(length_of_stay) / (MAX(total_beds) * 30.0)) * 100, 2) AS occupancy_percentage,
    CASE 
        WHEN (SUM(length_of_stay) / (MAX(total_beds) * 30.0)) * 100 > 85.0 THEN 'HIGH OVERLOAD (>85%)'
        ELSE 'Normal'
    END AS capacity_flag
FROM carewell_cleaned
GROUP BY hospital, department
ORDER BY occupancy_percentage DESC;


-- ----------------------------------------------------------------------------
-- Query 3: 30-Day Readmission Rates by Diagnosis Category
-- ----------------------------------------------------------------------------
SELECT 
    diagnosis_category,
    COUNT(admission_id) AS total_admissions,
    SUM(is_readmitted_30d) AS total_readmissions_30d,
    ROUND((SUM(is_readmitted_30d) * 100.0) / COUNT(admission_id), 2) AS readmission_rate_pct
FROM carewell_cleaned
GROUP BY diagnosis_category
ORDER BY readmission_rate_pct DESC;


-- ----------------------------------------------------------------------------
-- Query 4: Claim Rejections & Financial Revenue Leakage by Payment Type
-- ----------------------------------------------------------------------------
SELECT 
    payment_type,
    COUNT(admission_id) AS total_claims,
    COUNT(CASE WHEN claim_status = 'Approved' THEN 1 END) AS approved_claims,
    COUNT(CASE WHEN claim_status = 'Rejected' THEN 1 END) AS rejected_claims,
    ROUND((COUNT(CASE WHEN claim_status = 'Rejected' THEN 1 END) * 100.0) / COUNT(admission_id), 2) AS rejection_rate_pct,
    SUM(bill_amount) AS total_billed_amount,
    SUM(revenue_lost) AS total_revenue_lost_inr
FROM carewell_cleaned
GROUP BY payment_type
ORDER BY total_revenue_lost_inr DESC;


-- ----------------------------------------------------------------------------
-- Query 5: High-Risk Patient Profiling & Stay Duration
-- ----------------------------------------------------------------------------
SELECT 
    admission_type,
    age_group,
    COUNT(admission_id) AS patient_count,
    ROUND(AVG(length_of_stay), 2) AS avg_los_days,
    ROUND(AVG(bill_amount), 2) AS avg_bill_amount_inr,
    ROUND(SUM(revenue_lost), 2) AS total_revenue_lost_inr
FROM carewell_cleaned
GROUP BY admission_type, age_group
ORDER BY admission_type, avg_bill_amount_inr DESC;


-- ----------------------------------------------------------------------------
-- Query 6: Emergency vs. Planned Admissions Comparison (Cost & Stay)
-- ----------------------------------------------------------------------------
SELECT 
    admission_type,
    COUNT(admission_id) AS total_admissions,
    ROUND(AVG(length_of_stay), 2) AS avg_los_days,
    ROUND(AVG(bill_amount), 2) AS avg_bill_amount_inr,
    ROUND(SUM(revenue_lost), 2) AS total_revenue_lost_inr
FROM carewell_cleaned
GROUP BY admission_type;


-- ----------------------------------------------------------------------------
-- Query 7: Seasonal Patterns & Monsoon Fever Cases Analysis
-- ----------------------------------------------------------------------------
SELECT 
    admission_month,
    diagnosis_category,
    COUNT(admission_id) AS total_admissions,
    SUM(length_of_stay) AS total_patient_days
FROM carewell_cleaned
WHERE admission_month IN ('2025-07', '2025-08', '2025-09')
GROUP BY admission_month, diagnosis_category
ORDER BY total_admissions DESC;
