-- 1
CREATE VIEW samsBills AS
SELECT 
    first_name, 
    surname, 
    bill_date, 
    cust_name, 
    bill_total
FROM 
    restStaff rs
JOIN 
    restBill rb ON rs.staff_no = rb.waiter_no
WHERE 
    rs.first_name = 'Sam' AND rs.surname = 'Pitt';
    
SELECT *  FROM samsBills;

-- 2 
SELECT * FROM samsBills
WHERE bill_total > 400;

-- 3 

CREATE VIEW roomTotals AS
SELECT 
    rt.room_name, 
    SUM(rb.bill_total) AS total_sum
FROM 
    restRest_table rt
JOIN 
    restBill rb ON rt.table_no = rb.table_no
GROUP BY 
    rt.room_name;

SELECT * FROM roomTotals;

-- 4 

CREATE VIEW teamTotals AS
SELECT 
    CONCAT(rs.first_name, ' ', rs.surname) AS headwaiter_name, 
    SUM(rb.bill_total) AS total_sum
FROM 
    restStaff rs
JOIN 
    restBill rb ON rs.staff_no = rb.waiter_no
GROUP BY 
    rs.first_name, rs.surname;

SELECT * FROM  teamTotals;
