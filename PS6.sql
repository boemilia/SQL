-- 1.Wyświetl wszystkie kategorie posortowane po nazwie od A
Select * from categories
Order by category_id

-- 2.Wyświetl product_name i unit_price produktu dla których units_in_stock jest większy, niż 10
Select p.product_name, p.unit_price, p.units_in_stock
From products p
Where p.units_in_stock >10
Order by p.units_in_stock desc;

--3. Wyświetl product_name I unit_price produktu, gdzie indetyfikatory to 1, 45, 400 ,500
select p.product_name, p.unit_price, p.product_id
from products p
where p.product_id = 1 or p.product_id = 45 or p.product_id = 400 or p.product_id = 500;

--4. Wyświetl company_name dostawców, którzy dostarczyli więcej niż 5 zamówień
Select s.company_name (p.units_on order) count (*) ilosc
From suppliers s
Left join suppliers s on s.supplier_id = c.supplier_id
Where p.discontinued <>1
Group by s.company_name
Having sum (p.units_on_order) >5


--5.Wyświetl kategorie z nazwą na „B”

select c.category_name from categories c
where c.category_name like '%B%'


1. Stwórz tabelę abc z polami: 
p1 - numer (klucz główny)
p2 - tekst
2. Dodaj tabeli abc pole: p3 - numer 
3. Dodaj do tabeli dwa wiersze, gdzie p1  = 2 i p2 = “bla” oraz p1 = 3 i p2 = “ble” i 
p3 = “10”
4. Usuń drugi wiersz
5. Usuń strukturę całej tabeli

Create table abc(p1 varchar (10), p2 varchar(10), primary key(p1));
Alter table abc add p3 int,
Insert into abc(p1, p2, p3) values(‘bla’, ‘ble’, ‘10’)
Drop table abc

Część 3
1.	Najlepsi dostawcy
select s.company_name, s.city,
sum(p.units_on_order * p.units_in_stock)
from supplier as s
left join as ..
group by sum(p.units_on_order * p_units_in_stock )
order by s.company_name, s.city





