SELECT
  video.id,
  users.first_name,
  users.last_name,
  photo.id AS main_photo_url,
  video.url,
  video.size
FROM video
JOIN users
  ON users.id = video.owner_id
LEFT JOIN photo
  ON photo.id = users.main_photo_id
ORDER BY video.size DESC
  LIMIT 10; 