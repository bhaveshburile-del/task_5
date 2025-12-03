select * from sales

-- example 1
create or replace  function sales_status(revenue float)
returns varchar as $$
DECLARE s_status TEXT;
BEGIN
		if sales <= 200 THEN s_status := 'loss';
		elseif sales <= 500 THEN s_status := 'not bad';
		elseif sales <= 700 THEN s_status := 'profit';
		else s_status := 'excelent';
		end if;
		return r_status;
END;
$$ language plpgsql;

select sales_status(23) 

select sales_status(500) 

select sales_status(501) 

select id,email,revenue,revenue_status(revenue) from s

-- example 2

create or replace function get_customer_sales_summary(p_cust_id varchar)
returns table (
    total_sales double precision,
    total_profit double precision,
    avg_discount double precision
) as $$
begin
    return query
    select
        sum(sales) as total_sales,
        sum(profit) as total_profit,
        avg(discount) as avg_discount
    from sales_transactions
    where cust_id = p_cust_id;
end;
$$ language plpgsql;


select * from get_customer_sales_summary('bh-11710');