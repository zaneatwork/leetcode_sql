-- Table: Employee
--
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- | department  | varchar |
-- | managerId   | int     |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table indicates the name of an employee, their department, 
-- and the id of their manager.
-- If managerId is null, then the employee does not have a manager.
-- No employee will be the manager of themself.
--
--  
--
-- Write a solution to find managers with at least five direct reports.
--
-- Return the result table in any order.
SELECT Employee.name
FROM Employee 
JOIN Employee AS reports on Employee.id = reports.managerId
-- We need to group by id here because name could be a duplicate. ¯\_(ツ)_/¯
GROUP BY Employee.id, Employee.name 
HAVING count(reports.id) >= 5
