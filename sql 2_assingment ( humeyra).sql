CREATE TABLE actions (
    Visitor_ID INTEGER PRIMARY KEY IDENTITY,
    Adv_Type VARCHAR (40),
    Action VARCHAR (40)
);
INSERT INTO actions (Adv_Type, Action)
VALUES ('A', 'Left'), ('A', 'Order'), ('B', 'Left'), ('A', 'Order'), ('A', 'Review'), ('A', 'Left'), ('B', 'Left'), ('B',
'Order'), ('B', 'Review'), ('A', 'Review')
SELECT Adv_Type, ROUND(CAST(SUM(Action_V) AS REAL) / COUNT(Action), 2) AS Conversion_Rate
FROM (
SELECT Visitor_ID, Adv_Type, Action, 
CASE
WHEN Action = 'Order' THEN 1
ELSE 0
END AS Action_V
FROM actions) AS new
GROUP BY Adv_Type