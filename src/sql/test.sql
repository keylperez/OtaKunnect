SELECT o.orderNumber, o.orderDate, c.customerName, 
    SUM(priceEach*quantityOrdered) AS 'Total Value',
    CONCAT(e.firstName,' ', lastName) AS 'Sales Person'
FROM orders o, orderdetails od, customers c, employees e
WHERE o.orderNumber = od.orderNumber 
    AND c.customerNumber = o.customerNumber 
    AND c.salesRepEmployeeNumber = e.employeeNumber
GROUP BY o.orderNumber;

SELECT 	c.salesEmployeeNumber, 
	SUM(od.quantityOrdered*od.priceEach) AS 'Total Sales'
FROM 	orders o, orderdetails od, customers c
WHERE 	YEAR(o.orderDate) = 2005 
    AND o.orderNumber = od.orderNumber 
GROUP BY "Sales";

-- Calculate the total sales made by emplyee 1002, 1056, 1076. Display the full name and total sales made by each employee

SELECT e.employeeNumber,
    SUM(od.priceEach*od.quantityOrdered) AS 'Total Sales',
    CONCAT(e.firstName, ' ', e.lastName) AS 'Sales Person'
FROM employees e, orderdetails od
WHERE e.employeeNumber = 1002
    OR e.employeeNumber = 1056
    OR e.employeeNumber = 1076
GROUP BY e.employeeNumber

