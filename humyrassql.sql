use SampleSales
CREATE TABLE Transactions (
			Sender_ID int,
			Receiver_ID int,
			Amount int, 
			Transactions_Date DATE NOT NULL
			);
INSERT INTO Transactions (Sender_ID, Receiver_ID, Amount, Transactions_Date)
VALUES
(55,22,500,'20210518'),
(11,33,350,'20210519'),
(22,11,650,'20210520'),
(22,33,900, '20210521'),
(33,11,500,'20210520'),
(33,22,750,'20210521'),
(11,44,300,'20210521')

--TRUNCATE table Transactions;
select * from Transactions
--drop table Transactions

(SELECT Sender_ID, SUM ( Amount) as sender
FROM Transcations 
GROUP BY Sender_ID) ;

(SELECT Receiver_ID, SUM(Amount) as receiver
FROM Transcations 
GROUP BY Receiver_ID)

SELECT COALESCE(S.Sender_ID, R.Receiver_ID) as Account_ID, (COALESCE(R.Receiver,0) -COALESCE(S.Sender,0)) as Net_Change
FROM (SELECT Sender_ID, SUM ( Amount) AS Sender
FROM Transactions 
GROUP BY Sender_ID) AS S 
FULL OUTER JOIN (SELECT Receiver_ID, SUM(Amount) AS Receiver
FROM Transactions 
GROUP BY Receiver_ID)AS R On (S.Sender_ID = R.Receiver_ID)
ORDER BY Net_Change desc;

