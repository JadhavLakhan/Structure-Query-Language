-- Assignment--
use mavenmovies
/* 1) Could you pull a list of the first name ,last name and email of each of our customer */
select 
		first_name,last_name,email
 from 	customer
 
/*2) Could you pull the record of our films and see if there are any other rental duration*/
select 
		distinct(rental_duration)
 from film
 
 /*3) Could you pull all payment from our first 100 customer (based on customer id)*/
 select 
		customer_id,rental_id,amount,payment_date
from payment
where customer_id between 1 and 100

/* 4) The payment data you gave me on our first 100 customers,Now i'd love to see 
just payment over $5 for those same customers since january 1,2006 */
select 
		customer_id,
        rental_id,
        amount,
        payment_date
from payment
where 	customer_id<101 
		and amount>=5 
        and payment_date>='2006-01-01'

/*5) The data you shared previously on customer 42,53,60,75 was good to see
 Now, could you please write a query to pull all payments from those specific
 customers along with payment over $5 from any cusotmer */
select 
	customer_id,amount,payment_date
from payment
where amount>5.00 or customer_id=42 or customer_id=53 or customer_id=60 or customer_id=75

/*6) We nee to understand the special feature in our films.
Could you pull a list of film which include a "Behind the Scenes" special feature */
select 
	film_id,title,special_features
from film
where special_features like '%Behind the scenes%'
 
 /*7)I need to get a quick overview of how long our movies tend to be rented out for
 Could you please pull a count of titles  sliced by rental duration */
 select 
		rental_duration,
        count(title) as film_with_his_duration
 from film
 group by rental_duration
 
 /* 8) I'm wondering if we charge more for a rental when the replacement cost is higher
 can you help me pull a count of films along with the average,min,and max, rental rate,
 grouped by replacement cost ? */
 
 select 
		replacement_cost,
        count(film_id) as no_of_films,
        min(rental_rate) as Low_rate,
        max(rental_rate) as high_rate,
        avg(rental_rate) as average_rate
from film
group by replacement_cost

/* 9) I would like to talk to customers that have not rented much from us to understand
it there is something we could be doing better
Could you pull a list of customer_ids with less than 15 rentals all time ? */

select 
	   customer_id,
       count(rental_id) as total_rentals
from rental
group by customer_id
having count(rental_id)<=15

/* 10) I would like to see if our longest films also tend to be our most expensive rentals
Could you pull me a list of all film title along with their lenghts and rental rates
and sort them from longest to shortes */

select
		title,
        length,
        rental_rate
from film
order by length desc

/* 11) I would like to know which store reach customer goes to and whether or not they are
active .
Could you pull a list of first and last names of all customers and label them as either
store1 active,store1 inactive,store2 active ,or store 2 inactive ? */
select distinct
		first_name,
        last_name,
        case
			when store_id=1 and active=1 then 'store 1 active'
			when store_id=1 and active=0 then 'store 1 inactive'
			when store_id=2 and active=1 then 'store 2 active'
			when store_id=2 and active=0 then 'store 2 inactive'
            else 'some thing wrong'
            end as store_and_status
from customer

/* 12) Im curious how many inactive customer we have at each store
Could you help please create a table to count the number of customers broken
down by store_id (in rwo) and active status (in columns)? */
select distinct
	store_id ,
    count(case when active=1 then customer_id else null end) as no_of_active,
    count(case when active=0 then customer_id else null end) as no_of_inactive
from customer
group by store_id
order by store_id

/* 13) Can you for me a list of each film we have in inventory ?
I would like to see the film title description and the store_id value
associated with each item , and its inventory_id . */
select 
	store_id,
    inventory_id,
    title,
    description
from film , inventory

/* 14) One of our investor is interested in the film we carry and how many acotrs are listed
for each film title. Can you pull a list of all title , and figure out how many actors are
associated with each title ? */
select  
	film.title,
    count(film_actor.actor_id) as no_of_actors
from film left join film_actor
on film_actor.film_id=film.film_id
group by film.title

/* 15) Customers often ask which films their favorite actors appear in .
It would be great to have a list of all actors with each title that they appear
in.Could you please pull that for me ? */
select 
	first_name,
    last_name,
    title
from actor
	inner join film_actor
    on film_actor.actor_id=actor.actor_id
  	inner join film
    on film_actor.film_id=film.film_id
    
    

    












 