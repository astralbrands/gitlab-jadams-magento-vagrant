CREATE DATABASE `localdev`;
CREATE USER 'localdev'@'localhost' IDENTIFIED BY 'q1w2e3r4';
GRANT ALL ON localdev.* TO 'localdev'@'localhost';