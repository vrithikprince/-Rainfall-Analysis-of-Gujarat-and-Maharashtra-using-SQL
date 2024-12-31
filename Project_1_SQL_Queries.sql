use states;
select * from GUJARAT;
select * from MAHARASHTRA;
select * from RAIN;

select min(annual) from Rain;
select max(annual) from Rain;
/*
Subdivision name: Gujarat Region
Subdivision name: Maharashtra Region
*/

/*
First Query: Fetch How much Average Rainfall done in Gujrat and Maharashtra from 2011 to 2015
*/
select SUBDIVISION,avg(Annual) as Average_Ranifall_Between_2011_and_2015 from RAIN
where year between 2011 and 2015
GROUP BY SUBDIVISION;

/*
Second Query: Fetch How much Rainfall done in Quarter 3 and 4 in GUJARAT from 2000 to 2015
*/
select Year, Subdivision as Subdivision, jul+aug+sep+oct+nov+dec as Total_Rainfall_in_Q3_Q4 from RAIN
where year between 2000 and 2015 and subdivision = 'Gujarat Region';

/*
Third Query: What is the highest rainfall in GUJARAT and MAHARASHTRA across given years?
*/
select Subdivision, max(Annual) as Maximum_Rainfall
from RAIN
GROUP BY SUBDIVISION;

/*
Fourth Query: Fetch the Rainfall, Population and Growth rate of GUJARAT and MAHARSHTRA in 2001 and 2011?
*/

Select g.GrowthRate AS GujaratGrowthRate,g.Population AS GujaratPopulation,
m.GrowthRate AS MaharashtraGrowthRate,m.Population AS MaharashtraPopulation,r.Annual
from Rain r
JOIN Gujarat g ON r.Year = g.Year
JOIN Maharashtra m ON r.Year = m.Year
where r.Year IN (2001, 2011);

/*
Fifth Query: In which year GUJARAT has maximum_percentage share in India’s population?
*/
Select year as Maximum_Percentage_Share_In_Indias_Population_Year, ShareIndia
from Gujarat where ShareIndia = (Select max(ShareIndia) from Gujarat);

/*
Sixth Query: Which state experiences greater variation in rainfall year over year?
*/
select Top 1 Subdivision, Stdev(Annual) as Standard_Deviation_Of_Rainfall from Rain
Group by Subdivision
Order by Standard_Deviation_Of_Rainfall desc;

/*
Seventh Query: Which state is more prone to extreme rainfall events over time?
*/

select Subdivision,count(*) as Greater_than_Average_Annual_Rainfall from Rain
where Annual > (select avg(annual) from Rain)
Group by SUBDIVISION;