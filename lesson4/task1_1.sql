SELECT
  video.id AS video_id,
  (SELECT users.first_name
     FROM users 
     WHERE users.id = video.owner_id),
  (SELECT users.last_name
     FROM users 
     WHERE users.id = video.owner_id),
  (SELECT photo.url
     FROM photo 
     WHERE photo.id = (SELECT users.main_photo_id 
			  FROM users 
			  WHERE users.id = video.owner_id)) AS main_photo_url,
   video.url AS video_url,
   video.size AS video_size
   FROM video
     ORDER BY size DESC
     LIMIT 10;