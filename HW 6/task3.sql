-- 1
SELECT DISTINCT first_name, surname
FROM restStaff S
JOIN restBill B ON staff_no = waiter_no
WHERE cust_name = 'Tanya Singh';


-- 2
SELECT room_date
FROM restRoom_management RM 
JOIN restStaff  S
ON RM.headwaiter = staff_no
WHERE first_name = 'Charles'  AND room_name = 'Green' AND room_date BETWEEN 160201 AND 160229;

-- 3
SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
WHERE s.headwaiter = (
    SELECT headwaiter
    FROM restStaff
    WHERE first_name = 'Zoe' AND surname = 'Ball'
);

-- 4
SELECT b.cust_name, b.bill_total, s.first_name AS waiter_first_name, s.surname AS waiter_surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
ORDER BY b.bill_total DESC;

-- 5
SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
JOIN restBill b ON s.staff_no = b.waiter_no
WHERE b.table_no IN (
    SELECT DISTINCT b1.table_no
    FROM restBill b1
    WHERE b1.bill_no IN (00014, 00017)
);

-- 6
SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no IN (
    SELECT b.waiter_no
    FROM restBill b
    WHERE b.table_no IN (
        SELECT t.table_no
        FROM restRest_table t
        WHERE t.room_name = 'Blue'
    ) AND b.bill_date = 160312
)
OR s.staff_no = (
    SELECT rm.headwaiter
    FROM restRoom_management rm
    WHERE rm.room_name = 'Blue' AND rm.room_date = 160312
);


