-- 1
SELECT DISTINCT b.cust_name
FROM restBill b
WHERE b.bill_total > 450.00 
AND b.waiter_no IN (
    SELECT s.staff_no
    FROM restStaff s
    WHERE s.headwaiter = (
        SELECT staff_no
        FROM restStaff
        WHERE first_name = 'Charles'
    )
);

-- 2 
SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no = (
    SELECT headwaiter
    FROM restRoom_management rm
    WHERE rm.room_name = (
        SELECT t.room_name
        FROM restRest_table t
        WHERE t.table_no = (
            SELECT b.table_no
            FROM restBill b
            WHERE b.cust_name = 'Nerida Smith' AND b.bill_date = 160111
        )
    )
    AND rm.room_date = 160111
);

-- 3 
SELECT b.cust_name
FROM restBill b
WHERE b.bill_total = (
    SELECT MIN(bill_total)
    FROM restBill
);

-- 4 
SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no NOT IN (
    SELECT b.waiter_no
    FROM restBill b
);

-- 5 
SELECT b.cust_name, h.first_name AS headwaiter_first_name, h.surname AS headwaiter_surname, t.room_name
FROM restBill b
JOIN restRest_table t ON b.table_no = t.table_no
JOIN restRoom_management rm ON t.room_name = rm.room_name AND b.bill_date = rm.room_date
JOIN restStaff h ON rm.headwaiter = h.staff_no
WHERE b.bill_total = (
    SELECT MAX(bill_total)
    FROM restBill
);


