CREATE DEFINER=`root`@`localhost` PROCEDURE `get_top_n_markets_by_net_sales`(
	in_fiscal_year INT,
    in_top_n INT
)
BEGIN
	select 
		market,
		round(sum(net_sales)/1000000,2) as net_sales_mil
	from net_sales
    where fiscal_year = in_fiscal_year
	group by market
	order by net_sales_mil desc
	limit in_top_n;
END