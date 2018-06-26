/* 1. Quantitat de registres de la taula de vols */
SELECT COUNT(*) AS NumberOfFlights 
FROM Flights;


/* 2. Retard promig de sortida i arribada segons l’aeroport origen */
SELECT Origin, 
			AVG(ArrDelay) AS AverageArrivalDelay,  
            AVG(DepDelay) AS AverageDepartureDelay 
FROM Flights 
GROUP BY Origin;


/* 3. Retard promig d’arribada dels vols, per mesos i segons l’aeroport origen */
SELECT Origin, colYear, colMonth, 
			AVG(ArrDelay) AS AverageArrivalDelay 
FROM Flights 
GROUP BY Origin, colYear, colMonth;


/* 4. Retard promig d’arribada dels vols, per mesos i segons l’aeroport origen (mateixa
consulta que abans i amb el mateix ordre). Però a més, ara volen que en comptes
del codi de l’aeroport es mostri el nom de la ciutat. */
SELECT City, colYear, colMonth, 
			AVG(ArrDelay) AS AverageArrivalDelay 
FROM Flights 
INNER JOIN USAirports ON IATA = Origin
GROUP BY Origin, colYear, colMonth;


/* 5.Les companyies amb més vols cancelats. A més, han d’estar ordenades de forma
que les companyies amb més cancelacions apareguin les primeres. */

SELECT COUNT(*) AS TotalCancellation, UniqueCarrier
FROM Flights
WHERE	Cancelled=1
GROUP BY UniqueCarrier
ORDER BY TotalCancellation desc;

/*aternative*/
SELECT COUNT(Cancelled), UniqueCarrier
FROM Flights
WHERE	Cancelled=1
GROUP BY UniqueCarrier
ORDER BY COUNT(*) desc;


/*  6. L’identificador dels 10 avions que més kilòmetres han recorregut fent vols
comercials */
SELECT  TailNum, 
	SUM(Distance)
FROM Flights
GROUP BY TailNum
ORDER BY SUM(Distance) desc
LIMIT 10;


/*  7. Companyies amb el seu retard promig només d’aquelles les quals els seus vols
arriben al seu destí amb un retràs promig major de 10 minuts. */
SELECT  UniqueCarrier, 
	AVG(ArrDelay) AS AverageArrivalDelay 
FROM Flights
GROUP BY UniqueCarrier
HAVING AVG(ArrDelay) >10;


