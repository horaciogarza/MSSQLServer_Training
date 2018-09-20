/*		Esto es un comentario		*/
--		Esto es un comentario también


--Formas de Convertir.

	--Convert		CONVERT(<tipoDeDato>,<ValorAConvertir>)
		SELECT CONVERT(int,'67') AS "CONVERTSample"

	--Cast			CAST(<ValorACastear> AS <tipoDeDato>)
		SELECT CAST('67' AS int) AS [CASTSample]

	--Parse			PARSE(<ValorACastear> AS <tipoDeDato>)
			--NOTA: Parse hace el cast de valor monetario negativo.
		SELECT PARSE('$(67)' AS money) AS [PARSESample]

	--Todo en uno
		SELECT	CONVERT(int,'67') AS "CONVERTSample",
				CAST('67' AS int) AS [CASTSample],
				PARSE('$(67)' AS money) AS [PARSESample]

-- Formas de Convertir (TRY)
	--Lo que no puede convertir, lo pasa a NULL

SELECT	TRY_CONVERT(int,'67S') AS "CONVERTSample",
				TRY_CAST('67' AS int) AS [CASTSample],
				TRY_PARSE('$(67)' AS money) AS [PARSESample]


SELECT '$a(67)', try_PARSE('$a(67)' AS money)
--SELECT * FROM INFORMATION_SCHEMA.COLUMNS

--IIF, function IIF(<A EVALUAR>, VERDADERO, FALSO)
/*
		=     Igual
		<>	  Diferente
		NOT	  Negacion

	*/
SELECT iif(NOT NOT (1 <> 2), 'Verdadero','Falso')


--Tipo de dato: Fecha

/*
		
	time			HH:mm:ss.nnnn
	date			MM/DD/YYYY 
	datetime		MM/DD/YYYY HH:mm:ss.nnnn
	datetime2		MM/DD/YYYY HH:mm:ss.nnnnnnnn
	datetimeOffset	MM/DD/YYYY HH:mm:ss.nnnnnnnn [UTC +-]
		
*/

SELECT DAY(GETDATE()), MONTH(GETDATE()), YEAR(GETDATE())
	 --DATEADD(MONTH/DAY/YEAR, VALUE, DATE)

SELECT	CAST(DATEADD(YEAR,-45,GETDATE()) AS DATE),
		DATEFROMPARTS(2018,09,19),
		DATEDIFF(DAY,'2018-09-19','2018-09-10')
