/*1. Users who have not posted any photos */
select u.id, u.username
from users u
left join photos p on u.id = p.user_id
where p.id is null;

/*2 The photos that have received the most comments */
select p.id, p.image_url, COUNT(c.id) AS comment_count
from photos p
join comments c ON p.id = c.photo_id
group by  p.id, p.image_url
order by  comment_count desc;

/* 3. Most popular tags used in photos */
select  t.id, t.tag_name, COUNT(pt.photo_id) AS usage_count
from tags t
join photo_tags pt on t.id = pt.tag_id
group by t.id, t.tag_name
order by  usage_count desc;

/* Top Users who have posted most photos */
select u.username , count(p.id) as photo_count
from users u
join photos p on u.id = p.user_id
group by u.id
order by photo_count desc
limit 10;


/* Most Liked pics*/
select p.id,
p.image_url,
count(l.user_id) as like_count
from photos p
join 
likes l on p.id = l.photo_id
group by
p.id
order by 
like_count desc limit 10;
