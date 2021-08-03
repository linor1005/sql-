use Northwind


select o.ProductID,o.OrderID,o.Quantity,o.UnitPrice,o.Discount
from [Order Details] as o
where o.Discount < 0.05 and o.Discount != 0 or o.Discount >0.15 and o.UnitPrice % 2 = 0
select * from [Order Details]




 select e.FirstName+' '+e.LastName as 'full Name',e.BirthDate,DATEDIFF(year,e.BirthDate,getdate())
 as 'Seniority', e.City 
 from Employees as e
 where e.City IN ('Redmond','Seattle') or e.EmployeeID in ('313247777','313265159','207522756','209288687')
 order by e.LastName desc , e.BirthDate 



 select s.CompanyName,count(*) as 'TotalProducts',avg(p.UnitPrice) AS 'MeanPrice'
 from Products as p inner join Suppliers as s
 on s.SupplierID = p.SupplierID
 group by s.SupplierID,s.CompanyName, P.UnitPrice
 having s.CompanyName like '[MJC]%' OR (p.UnitPrice >=
													(select avg(p.UnitPrice)
													from Products as p))

 select s.CompanyName,COUNT(*) as 'OrderCount',avg(o.Freight) as 'AvgFreight',min(o.Freight) as 'MinFreight'
 from Shippers as s inner join Orders as o
 on s.ShipperID = o.ShipVia
 group by s.ShipperID,s.CompanyName
 having count(*) between 100 and 300 and avg(o.Freight) <350

 



 select ShipCountry,count(distinct o.OrderID) as 'OrderCount',  count(DISTINCT od.ProductID) as 'UniqueProducts'
 from Orders as o inner join [Order Details] as od
 on o.OrderID = od.OrderID
 where MONTH(o.OrderDate) % 2 =1 and  MONTH(o.OrderDate)> 6 and o.ShipRegion is  not null 
group by o.ShipCountry




select c.CustomerID, c.CompanyName,count(o.OrderID) as 'Orders Count',avg(od.Quantity) as 'Avg Quantity'
from Customers as c left join orders as o
on o.CustomerID = c.CustomerID left join [Order Details] as od on o.OrderID = od.OrderID
where c.Country IN ('Brazil','France','Spain')
group by c.CustomerID,c.CompanyName
having COUNT(o.OrderID) between 0 and 20 and sum(od.UnitPrice*od.Quantity) between 5000 and 10000





select distinct s.CompanyName,p.ProductName
from Suppliers as s inner join Products as p on s.SupplierID=p.SupplierID
inner join [Order Details] as od on p.ProductID=od.ProductID 
inner join orders as o on od.OrderID = o.OrderID
inner join Customers as c on o.CustomerID = c.CustomerID
where (o.CustomerID like 'OCEAN' or c.Fax is null) 
AND s.CompanyName like '%[AN]%' AND p.ProductName like '%[EM]%'
order by s.CompanyName , p.ProductName desc









