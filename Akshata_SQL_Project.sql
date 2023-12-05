create database Project;
use Project;
create table olympics (ID int, Name varchar(400) , Sex varchar(50) ,Age int,Height  int,
Weight int ,Team varchar(300),NOC varchar(300),Games varchar(200),Year int,
Season varchar(200),City varchar(100),Sport varchar (100),Event varchar (100),Medal varchar(100));
SHOW VARIABLES LIKE "secure_file_priv";
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.2/Uploads/Athletes_Cleaned.csv' into table olympics
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;
-- SQL PROJECT
select * from olympics;
-- 1. Show how many medal counts present for entire data
select Medal, count(Medal)
as medal_count from olympics group by Medal;

-- 2. Show count of unique sports present in Olympics
select Sport, count(Sport) as sports_count
from olympics group by Sport;

-- 3. Show how many different medals won by team India
select medal, count(medal) as medalcount from olympics where Team='India' group by Medal order by medalcount;


-- 4. Show event wise medals won by India show from highest to lowest medals won in order
select event, count(Medal) as medalevent from olympics where Team= 'India'
and Medal <>'Nomedal'  group by event order by medalevent desc  ;

-- 5. Show event wise medals won by India in order of year
select event, year, count(medal) as medalcount from olympics where team='india' group by event, year
order by medalcount;


-- 6. show country who won maximum medals.
select team, count(medal) as medalcount from olympics where team <>'NoMedal' group by team order by medalcount;

-- 7.show top 10 countries whowon gold

select team, count(medal) as medalcount from olympics where Medal='Gold' group by team
order by medalcount;

--  8. show in which year did United states won most gold medal
select  year, count(medal) as goldmedal from olympics where team='United states' and medal<>'Nomedal'
group by year order by goldmedal;


-- 9. In which sports United States has most medals.
select sport, count(Medal) as medalcount from olympics where team='United states' and Medal<>'NoMedal'
group by sport order by medalcount desc; 


-- 10. Find top three players who won most medals along with their sports and country

select name, sport, team, count(medal) as medalcount from olympics where medal<>'NoMedal' group by name, sport, team 
order by medalcount desc limit 3;

-- 11. Find player with most gold medals in cycling along with his country.
select name, team, sport, count(medal) as medalcount from olympics where sport='Cycling' and medal='Gold'
group by name, team, sport order by medalcount desc limit 3;


-- 12.Find player with most medals (Gold+Silver+Bronze) in Basketball also show his country.
select name, team, sport, count(medal) as medalcount from olympics where sport='Basketball' and medal<>'Nomedal'
group by name, team, sport order by medalcount desc limit 5;

-- 13. Find out the count of different medals of the top basketball player Teresa Edwards
select name, medal, count(medal) as medalcount from olympics where name='Teresa Edwards' and medal<>'NOmedal'
group by name, medal order by medalcount;

-- 14. Find out medals won by male,female each year , Export this data and plot graph in excel
select year, sex, count(medal) as medalcount from olympics where medal<>'Nomedal' group by year, sex
order by medalcount desc;

