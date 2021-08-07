-- 1.) List all of the movies ordered alphabetically.
select * from movies order by title;

-- 2.) List the three oldest people from oldest to youngest.
select * from people order by birthdate asc limit 3;

-- 3.) List all of the people who have directed a movie.
select distinct(p.name) from people as p
    inner join mtm_credits as mc on p.id = mc.person_id
    where role_id = 2;

-- 4.) Which director has directed the most movies in our database?
select p.name, count(*) from people as p
    inner join mtm_credits as mc on p.id = mc.person_id
    where mc.role_id = 2
    group by p.name
    order by count desc limit 1;

-- 5.) Which people are both directors and actors?
select p.name from people as p
    inner join (
        select mc.person_id, count(*) from mtm_credits as mc
            group by mc.person_id
            having count(*)>1
    ) as role_count on p.id = role_count.person_id;

-- OR, the below query to account for if a new role gets added
select name from (select p.name, mc.* from people as p
    inner join mtm_credits mc on p.id = mc.person_id
    where mc.role_id in (1, 2)) as dir_act_table
    group by name, person_id
    having count(person_id) > 1;  

-- 6.) List all of the people who have worked with Ben Affleck.
select p.name from people as p
    inner join mtm_credits as mc on p.id = mc.person_id
        where mc.movie_id in (
                                select m.id from movies as m
                                    inner join mtm_credits as mc on m.id = mc.movie_id
                                    inner join people as p on mc.person_id = p.id
                                    where p.name = 'Ben Affleck'
                            ) 
        and p.name != 'Ben Affleck';