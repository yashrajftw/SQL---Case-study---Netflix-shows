use yashraj;
select * from netflix_titles;
desc netflix_titles;
alter table netflix_titles drop column description;
alter table netflix_titles rename to netflix;
select * from netflix;

-- 1. Create a report that shows the title and type from the netflix table sorted by type.
select title,type from netflix order by type;

-- 2 Create a report that shows the type title release year and duration from the netflix table sorted by duration.
select type,title,release_year,duration from netflix order by duration;

-- 3. Create a report that shows all the show_id in uppercase letter and renamed as ID from the netflix table.
select upper(show_id) as ID from netflix;

-- 4. Create a report that shows the show_id,type, title,director,cast from the netflix 
--    table sorted by the type in descending order then by title in ascending order.
select show_id,type, title,director,cast from netflix order by type desc, title asc;

-- 5. Create a report that shows type, title of all customers from ‘India' only.
select type,title,country from netflix where country = "India";

-- 6. Create a report showing type, title, date_added from netflix that are without director.
select type,title,date_added from netflix where duration = "1 season";

-- 7. Create a report showing all the type,title, Country from netflix  which are not from india, turkey ,united states.
select type, title, country from netflix where country not in ("India","Turkey","United States");

-- 8. Create a report that shows the type, title, country of netflix from countries starting with U or I.
select type, title, country from netflix where country like "U%" or country like "I%";

-- 9. Create a report that shows the title, duration, country of all netflix for release_year 2020  and sorted by title.
select title,duration,country, release_year from netflix where release_year = 2020 order by  title;

-- 10. Create a report that shows the Country,title, duration of netflix from country that has letter e in the name sorted by title.
select country,title,duration from netflix where country like ("%e%");

-- 11. Create a report showing country, total number of country as Numberofcountries from the netflix
-- table grouped by country and sorted by Numberofcountries in descending order. HINT: you will need to
-- use a Groupby statement.
select country,count(*) as number_of_countries from netflix group by country;

-- 12. Create a report that shows the show_id, type, title from netflix by India, United States, turkey sorted by the show_id.
select show_id,type,title from netflix order by show_id;

-- 13. Create a report that shows the title, duration, release_year of customers that has not listed in  "comedies".
select title,duration,release_year,listed_in from netflix where listed_in not like "comedies";

-- 14. Create a report that shows the show_id, title, type, country of netflix where 
-- release year is 2020 or release year is 2021  except country other than India .
select show_id,type,title,country,release_year from netflix where release_year = 1994 and country = "United States" or release_year = "2020" ;

-- 15. Create a report that shows the title of netflix that do not have letter A as the second alphabet in their Contactname.
select title from netflix where title not like "%A%";

-- 16.Create a report that shows the duration, title from the netflix. All saved as time, Name respectively.
select duration as time ,title as Name from netflix;

-- 17. Create a report that fetch the first 5 character of title from the netflix tables and renamed as ShortInfo.
select substr(title,1,5) as short_info from netflix;

-- 18. retrieve common records from both the table.
select * from netflix as n1 inner join netflixshows as n2 on n1.show_id = n2.show_id;
select n1.show_id,n1.type,n1.title,n2.show_id,n2.date_added,n2.rating from netflix as n1 inner join netflixshows as n2 on n1.show_id = n2.show_id;

-- 19. retrieve all data from table 1 + common data from both the tables.
select n1.show_id,n1.type,n1.title,n2.show_id,n2.date_added,n2.rating  from netflix as n1 left join netflixshows as n2 on n1.show_id = n2.show_id;

-- 20. retrieve all data from table 2 + common data from both the tables.
select n1.show_id,n1.type,n1.title,n2.show_id,n2.date_added,n2.rating from netflix as n1 right join netflixshows as n2 on n1.show_id = n2.show_id;

-- 21. takes every possibilities (each row of first table mapped with every row of 2nd table).
select n1.show_id,n1.type,n1.title,n2.show_id,n2.date_added,n2.rating from netflix as n1 cross join netflixshows as n2;

-- 22. retrives all records from both tables where condition will satisfied.
select * from netflix as n1,netflixshows as n2 where n1.show_id = n2.show_id;

-- 23. Non equi join.
select * from netflix as n1, netflixshows as n2 where n1.show_id < n2.show_id;
select * from netflix as n1, netflixshows as n2 where n1.show_id > n2.show_id;
select * from netflix as n1, netflixshows as n2 where n1.show_id <> n2.show_id;
select * from netflix as n1, netflixshows as n2 where n1.show_id <= n2.show_id;
select * from netflix as n1, netflixshows as n2 where n1.show_id >= n2.show_id;

-- 24. self join : 
-- inner join which joins single table to itself.
-- write a query to retrieve all employees who are managers.
select * from netflixshows as n1 join netflixshows as n2 on n1.show_id = n2.show_id;


-- 25  Create a report that shows the SupplierID, CompanyName, CategoryName, ProductName and
-- UnitPrice from the products, suppliers and categories table.
select s.SupplierID,s.CompanyName,c.CategoryName,p.ProductName,p.UnitPrice from Categories as c join product as p on c.CategoryID = p.CategoryID
                join supplier as s on p.SupplierID = s.SupplierID;
                
-- 26 Create a report that shows the show_id, title and rating from netflix and netflixshows in the showid "s5".

select n1.show_id , n1.title, n2.rating from netflix as n1 join netflixshows as n2 on n1.show_id = n2.show_id where n1.show_id ="s5";

-- 27. retrieve data from both the tables and common value at
select n1.show_id,n1.type,n1.title,n2.show_id,n2.date_added,n2.rating  from netflix as n1 left join netflixshows as n2 
on n1.show_id = n2.show_id
union all
select n1.show_id,n1.type,n1.title,n2.show_id,n2.date_added,n2.rating from netflix as n1 right join netflixshows as n2 
on n1.show_id = n2.show_id;

-- 28. retrieve data from both the tables and common value at once
select n1.show_id,n1.type,n1.title  from netflix as n1 left join netflixshows as n2 
on n1.show_id = n2.show_id
union 
select n2.show_id,n2.date_added,n2.rating from netflix as n1 right join netflixshows as n2 
on n1.show_id = n2.show_id; 

-- 29. 
select type, country,count(*) from netflix where type = "Movie" group by country having count(*) > 5 order by count(*)desc limit 0 ,2;

select type, country,count(*) from netflix  group by country,type;
