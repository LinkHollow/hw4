use semimar_4;
 
/*Подсчитать общее количество лайков, которые получили пользователи младше 12 лет.*/
  
SELECT COUNT(likes.media_id) as likes
FROM media
join profiles on media.user_id = profiles.user_id 
join likes on likes.media_id = media.id
WHERE birthday>CURDATE()-INTERVAL 12 YEAR;

/*Определить кто больше поставил лайков (всего): мужчины или женщины*/

SELECT gender, count(*) as likes 
FROM ( SELECT user_id, (SELECT gender FROM profiles WHERE profiles.user_id = likes.user_id) as gender 
FROM likes) as likes
GROUP BY gender;

/*Вывести всех пользователей, которые не отправляли сообщения*/
SELECT firstname, lastname FROM users
WHERE id NOT IN (SELECT distinct from_user_id  FROM messages);


  
  
  
  