-- 1. Jakie są najwartościowsze zamówienia?
-- Wyświetl: identyfikator zamówienia, nazwę firmy klienta, datę zamówienia, ilość
-- pozycji zamówienia, kwotę zamówienia i pracownika wystawiającego
-- zamówienie. Pokaż wiersze o wartości większej i równej niż 10000, posortowane
-- od najświeższej daty.

-- select od.order_id, c.company_name,
-- count(*),
-- sum(od.unit_price * od.quantity * (1-od.discount)) order_value,
-- o.employee_id
-- from order_details od left join orders o on o.order_id = od.order_id
-- left join customers c on c.customer_id = o.customer_id
-- group by od.order_id, c.company_name, o.order_date, o.employee_id
-- having sum (od.unit_price * od.quantity * (1-od.discount)) >=10000
-- order by o.order_date desc

-- 2. Czyjego produktu sprzedajemy najwięcej?
-- Wyświetl: nazwę produktu, nazwę dostawcy, ilość produktu w magazynie,
-- wartość produktów w magazynie, ilość produktów na zamówieniach, wartość
-- produktów na zamówieniach. Pokaż tylko bieżące produkty, posortowane od
-- największej wartości produktów na zamówieniach.

-- select product_name, s.company_name, p.units_in_stock, (p.units_in_stock * p.unit_price), 
-- p.units_on_order, (p.units_on_order * p.unit_price)
-- from products p
-- left join suppliers s on s.supplier_id = p.supplier_id
-- where p.discontinued = 0
-- order by  (p.units_on_order * p.unit_price) desc

-- 3. Czego może brakować w magazynie?
-- Wyświetl: nazwę kategorii, ilość produktów w kategorii w magazynie, wartość
-- produktów w kategorii w magazynie. Pokaż tylko aktywne produkty i o ilości
-- mniejszej od 11, posortowane od najmniejszej ilości.

-- insert into us_states (state_id, state_name, state_region, state_abbr)
-- values ('podlaskie', 'wschód', 'PD')
-- update us_states set state_name = 'Alibaba'
-- where state_name = 'Alabama'

-- delete from us_states where state_id > 100

-- 1. Wstaw do tabeli us_states stan "mazowieckie"
-- insert into us_states (state_id, state_name)
-- values (333, 'mazowieckie')

-- 2. Popraw w tabeli us_states wszystkie wartości pola state_abbr na duże litery
-- update us_states set state_abbr = Upper(state_abbr)

3. 
-- Delete from us_states where left (state_name,1) = 'W'; 
-- Delete from us_states where state_name Like '%W'; 
-- Delete from us_states where state_name = 'W'; 
-- select * from us_states where state_name = 'A';