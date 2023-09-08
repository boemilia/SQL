-- Zadanie 6.1
-- Zadanie 1 stwórz tabelę o kolumnach: id, name, color

-- create table tabela (id int,name varchar(20), color varchar(20))

-- Zadanie 2 
-- dodaj do struktury tabeli kolumnę: additionals (tekst)

-- ALTER TABLE tabela ADD COLUMN additionals varchar(20)

-- Zadanie 3 
-- Nna podstawie tabeli z pkt.1 stwórz tabelę copy_of_1 bez danych

-- CREATE TABLE copy_of_1 AS SELECT * FROM tabela WITH NO DATA;

-- Zadanie 4 
--Usuń całkowicie tabelę z pkt. 1

-- drop table tabela 

-- Zadanie 6.2
-- Zadanie 1 
-- stwórz tabelę o kolumnach: id, name, color

-- create table tabela (id int,name varchar(20), color varchar(20))

-- Zadanie 2. 
-- Dodaj index po kolumnie name
-- create index index_name on tabela (name asc)

-- Zadanie 3. 
-- zmień nazwę indeksu na index_color
-- alter index index_name rename to index_color

-- Zadanie 4. 
-- usuń index index_color

-- drop index index_color

-- Zadanie 6.3 
-- Napisz skrypt - odpalamy jednocześnie  - dane są widoczne tylko w ramach tranzakcji

-- Zadanie 1. Stwórz tabelę o kolumnach: id, name, color
-- Zadanie 2. Otwórz transakcję
-- Zadanie 3. Dodaj jeden wiersz do tabeli z pkt. 1
-- Zadanie 4. Wyświetli wszystkie wiersze z tabeli pkt. 1
-- Zadanie 5. Cofnij/anuluj transakcję

-- begin;
-- create table if not exists tabela2 (id int, name varchar(20), color varchar(20));
-- commit;

--  begin;
--  insert into  tabela2 (name) values('Emilia');
--  select * from tabela2;
--  rollback;
 
-- Zadanie 6.4
-- Dokąd wysyłamy poprzez “United Package”?
-- Wyświetl: identyfikator zamówienia, imię i nazwisko pracownika, kraj wysyłki,
-- region wysyłki, miasto wysyłki, nazwę firmy kurierskiej. Pokaż wszystkie
-- zamówienia wysłane poprzez “United Package”, posortowane od najświeższej daty
-- wysyłki.

-- select order_id, ship_country, ship_region, ship_city from orders, 
-- join company_name from shippers 
-- group by shipped_date asc

-- select o.order_id, e.first_name, e.last_name, 
-- o.ship_city, o.ship_region, o.ship_country, 
-- s.company_name from orders o 
-- right join shippers s on o.ship_via = s.shipper_id
-- left join employees e on o.employee_id = e.employee_id
-- where s.company_name = 'United Package'
-- order by o.shipped_date desc;

-- Zadanie 6.5
-- Kto jest najlepszym sprzedawcą?
-- Wyświetl: imię i nazwisko pracownika, kraj, region, miasto, ilość zamówień
-- pracownika, wartość zamówień pracownika. Pokaż wiersze z 1998 posortowane od
-- największej wartości zamówień

-- select e.first_name, e.last_name, e.city, e.region, e.country, 
-- count(*)
-- -- (select * from order_details od where od.order_id = o.order_id)
-- from employees e 
-- left join orders o on o.employee_id = e.employee_id
-- left join order_details od on od.order_id = o.order_id
-- group by e.first_name, e.last_name, e.city, e.region, e.country 


-- --1--
-- select e.first_name, e.last_name, e.country, e.region, e.city, 
-- 	(select count(*) from orders o where e.employee_id = o.employee_id 
-- 	 	and order_date >= '1998-01-01' and order_date < '1999-01-01') ilosc,
-- 	(select sum(od.quantity * od.unit_price * (1 - od.discount)) from orders o
-- 	 	left join order_details od on od.order_id = o.order_id
-- 	 where e.employee_id = o.employee_id 
-- 	 	and order_date >= '1998-01-01' and order_date < '1999-01-01') wartosc
-- 	from employees e
-- order by wartosc desc

--2-- 
--select e.first_name, e.last_name, e.country, e.region, e.city, 
-- 	count(*) ilosc,
-- 	(select sum(od.quantity * od.unit_price * (1 - od.discount)) 
-- 	 	from order_details od left join orders o on o.order_id = od.order_id
-- 	 where o.employee_id = e.employee_id) wartosc
-- 	from orders o
-- 		left join employees e on e.employee_id = o.employee_id
-- 	where o.order_date >= '1998-01-01' and o.order_date < '1999-01-01'
-- group by e.first_name, e.last_name, e.country, e.region, e.city, e.employee_id
-- order by wartosc desc

-- Zadanie 6.6
-- Klient z największą średnią sprzedażą?
-- Wyświetl: nazwę firmy klienta, kraj klienta, miasto klienta, ilość zamówień, sumę
-- wartości zamówień i średnią wartość zamówienia. Pokaż wszystkie pasujące
-- wiersze posortowane od największego średniego zamówienia.

-- select c.company_name, c.country, c.city, 
-- 	count(*), sum(amount), avg(amount) 
-- 	from (select o1.order_id, o1.customer_id,
-- 		sum(od1.quantity * od1.unit_price * (1-od1.discount)) amount
-- 			from orders o1
-- 				left join order_details od1 on od1.order_id = o1.order_id
-- 			group by o1.order_id, o1.customer_id) as o
-- 		left join customers c on c.customer_id = o.customer_id
-- 	group by c.customer_id
-- order by 6 desc

