create database insurance_project;
use insurance_project;
-- Create customers table (matches your CSV structure)
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    age INT,
    gender VARCHAR(10),
    bmi DECIMAL(5,2),
    smoking_status VARCHAR(10),
    actual_charges DECIMAL(10,2)
);

CREATE TABLE risk_multipliers (
    factor_type VARCHAR(20),
    factor_value VARCHAR(20),
    multiplier DECIMAL(4,2),
    description TEXT,
    PRIMARY KEY (factor_type, factor_value)
);

INSERT INTO risk_multipliers VALUES ('smoking', 'yes', 1.75, 'Smokers carry significant risk'),
('smoking', 'no', 1.00, 'Non smokers, baseline risk');
INSERT INTO risk_multipliers VALUES 
('age', '18-25', 0.85, 'lower risk'),
('age', '26-35', 0.95, 'a bit lower risk'),
('age', '36-45', 1.00, 'baseline risk'),
('age', '46-55', 1.20, 'a bit risky'),
('age', '56-65', 1.40, 'Higher risk '),
('age', '65+', 1.60, 'highest risk');
INSERT INTO risk_multipliers VALUES 
('bmi', 'underweight', 1.10, 'weak, health concerns'),
('bmi', 'normal', 1.00, 'optimal health'),
('bmi', 'overweight', 1.15, 'moderate risk'),
('bmi', 'obese', 1.30, 'BMI 30-34.9 - high risk'),
('bmi', 'very_obese', 1.50, 'BMI 35+ - very high risk');

-- Customers table was imported from a csv in the background
