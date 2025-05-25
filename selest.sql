select title , duration_sec  from track t 
where duration_sec = (select MAX(duration_sec) from track t );
select title , duration_sec  from track t 
where duration_sec > 210;
select title   from track t 
where title like  '%мой%'  or title like  '%my%';
select title,release_year  from collection c  
where release_year between '2018' and '2020';
select name   from performer p  
where name not like '% %';
SELECT g.name ,COUNT(pg.performer_id) FROM Genre g
LEFT JOIN Performer_Genre pg ON g.genre_id = pg.genre_id
GROUP BY g.name;
SELECT  a.release_year,COUNT(t.title) FROM track t 
LEFT JOIN album a ON t.album_id  = a.album_id
where a.release_year between '2019' and '2020'
group by a.release_year; 
SELECT  a.title,AVG(t.duration_sec) FROM track t 
LEFT JOIN album a ON t.track_id = a.album_id
group by a.title;
SELECT  p."name"  FROM performer p 
LEFT JOIN performer_album pa   ON pa.performer_id  = p.performer_id 
LEFT JOIN album a    ON pa.album_id   = a.album_id
where not a.release_year = '2020'
group by p."name";
SELECT  c.title , p.name  FROM collection c 
LEFT JOIN track_collection tc  ON c.collection_id  = tc.track_id
LEFT JOIN track t   ON t.track_id = tc.track_id
LEFT JOIN album a   ON a.album_id  = t.album_id
LEFT JOIN performer_album pa   ON pa.performer_id  = a.album_id
LEFT JOIN performer p    ON pa.performer_id  = p.performer_id
where p.name = 'vestfalin'
group by c.title,p.name;