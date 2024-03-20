use sakila;

## 1. List each pair of actors that have worked together.

select distinct fa1.actor_id as actor1_id, fa2.actor_id as actor2_id
from film_actor fa1
join film_actor fa2 on fa1.film_id = fa2.film_id
where fa1.actor_id < fa2.actor_id;

## 2. For each film, list actor that has acted in more films.
select * from film;
select * from film_actor;
select * from actor;

select f.title, a.first_name, a.last_name
from film f
join film_actor fa on f.film_id = fa.film_id
join actor a on fa.actor_id = a.actor_id
where a.actor_id = (
    select actor_id
    from (
        select actor_id, count(*) as film_count
        from film_actor
        group by actor_id
        order by film_count desc
        limit 1
    ) as most_prolific_actor
)
limit 10;