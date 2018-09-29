--Sesion 2

	--INNER JOIN

	/*
		Siempre buscar conectar con llaves y no con otros campos.
		Buscar que sea el mismo tipo de dato.


		Ventajas:

			Es mas rapido.
			Es mas seguro.
		
		GET ALL KEYS:

		SELECT 
			so.name 'Table Name',
			c.name 'Column Name',
			t.Name 'Data type',
			c.max_length 'Max Length',
			c.precision ,
			c.scale ,
			c.is_nullable,
			ISNULL(i.is_primary_key, 0) 'Primary Key'
		FROM    
			sys.columns c
		INNER JOIN 
			sys.types t ON c.user_type_id = t.user_type_id
		LEFT OUTER JOIN 
			sys.index_columns ic ON ic.object_id = c.object_id AND ic.column_id = c.column_id
		LEFT OUTER JOIN 
			sys.indexes i ON ic.object_id = i.object_id AND ic.index_id = i.index_id
		INNER JOIN 
			sysobjects so ON c.object_id = so.id
		WHERE
			i.is_primary_key = 1 and 
			so.xtype = 'U'
		Order By 'Table Name', 'Column Name'





	*/
		SELECT A.EmpID, b.empid FROM dbo.Empleados A
			RIGHT JOIN dbo.Ventas
				ON EmpID = EmpID

		SELECT OnTheLine_Log.*,OnTheLine.[Email] 
			FROM [SimpleIndex].[OnTheLine] AS OnTheLine
			RIGHT JOIN [SimpleIndex].[OnTheLine_Log] AS OnTheLine_Log
		ON OnTheLine.ACCT = OnTheLine_Log.ACCT

		SELECT <COLUMNAS> FROM <TABLA1>
		INNER JOIN <TABLA2>
		ON <KEY1> = <KEY2>




/*
Instrucciones:

1.
	Traer todas las ordenes con el nombre completo 
	del vendedor.

2. Utilizando el query anterior, traer unicamente las ordenes 
	despues del 2014.
	
	
	Nota: Tomar unicamente los empleados que son vendedores.
*/

-- select * from sales.orders
-- select * from [Application].[People] 

select people.FullName, AllOrders.* from sales.orders AllOrders
inner join [Application].[People] People
on people.PersonID = AllOrders.SalespersonPersonID
where OrderDate >= '2014-01-01'

/*

3. Traer el total de ordenes que hubo por año.

*/
select year (OrderDate) as "year", month (orderdate) as "month", count(*) as "Sales Orders" from sales.orders
group by year (OrderDate), month (orderdate) 
order by  year (OrderDate), month (orderdate)



/*
	HAVING> Usar unicamente para funciones de agregacion
	WHERE> Filtrar por registros

*/

select year (OrderDate) as "year", month (orderdate) as "month", IIF(count(*) < 1700, 'Menor','Mayor') as "Sales Orders" from sales.orders
group by year (OrderDate), month (orderdate) 
HAVING COUNT(*) > 1700
order by  year (OrderDate), month (orderdate)

/*

	OR, AND, BETWEEN... Operadores Booleanos


	LIKE:

		%: Cualquier Cosa
		_: Cualquier cosa (1 solo caracter)
		[x-z]: Rango
		[x,z,y]: X, Z o Y


*/


SELECT * FROM Application.People
WHERE SearchName LIKE '[k,c,b][a]%'





