
film titles with time >= 60 mins, cat = Science Fiction



select r.actor_id, e.film_id 
from all_actors as r, all_film_act as d, all_films as e
where e.length >= 60 
and (category='Science Fiction' or category ='Sci-Fi')
and r.actor_id = d.actor_id 
and d.film_id = e.film_id;

