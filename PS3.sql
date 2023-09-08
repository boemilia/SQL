Wyświetl: identyfikator zamówienia, nazwę firmy klienta, datę zamówienia, ilość
pozycji zamówienia, kwotę zamówienia i pracownika wystawiającego
zamówienie. Pokaż wiersze o wartości większej i równej niż 10000, posortowane
od najświeższej daty.

select order_id, unit_price from order_details
Union
Select company_name from suplier
union
select order_date, employee_id from orders
limit 10000 order by order_date;