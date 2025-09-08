SELECT 
    id,
    age,
    gender,
    bmi,
    smoking_status,
    5000 as base_premium,
    
    CASE 
        WHEN age BETWEEN 18 AND 30 THEN 0.9
        WHEN age BETWEEN 31 AND 40 THEN 1.0
        WHEN age BETWEEN 41 AND 50 THEN 1.2
        WHEN age BETWEEN 51 AND 60 THEN 1.5
        ELSE 1.8
    END as age_multiplier,
    
    CASE 
        WHEN smoking_status = 'yes' THEN 1.69
        ELSE 1.0
    END as smoking_multiplier,
    
    CASE 
        WHEN bmi < 18.5 THEN 1.1
        WHEN bmi BETWEEN 18.5 AND 24.9 THEN 1.0
        WHEN bmi BETWEEN 25 AND 29.9 THEN 1.2
        ELSE 1.4
    END as bmi_multiplier
 FROM customers;
 
 SELECT 
    *,
    ROUND(base_premium * age_multiplier * smoking_multiplier * bmi_multiplier, 2) as annual_premium
FROM (
    SELECT 
        id, age, gender, bmi, smoking_status,
        5000 as base_premium,
        CASE 
            WHEN age BETWEEN 18 AND 30 THEN 0.9
            WHEN age BETWEEN 31 AND 40 THEN 1.0
            WHEN age BETWEEN 41 AND 50 THEN 1.2
            WHEN age BETWEEN 51 AND 60 THEN 1.5
            ELSE 1.8
        END as age_multiplier,
        CASE 
            WHEN smoking_status = 'yes' THEN 1.69
            ELSE 1.0
        END as smoking_multiplier,
        CASE 
            WHEN bmi < 18.5 THEN 1.1
            WHEN bmi BETWEEN 18.5 AND 24.9 THEN 1.0
            WHEN bmi BETWEEN 25 AND 29.9 THEN 1.2
            ELSE 1.4
        END as bmi_multiplier
    FROM customers
) as calculated_multipliers
ORDER BY annual_premium DESC;