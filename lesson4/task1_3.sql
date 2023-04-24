WITH max_video AS (
SELECT video.id AS video_id,
	video.url AS video_url,
	video.owner_id AS video_owner,
	video.size AS video_size
FROM video
ORDER BY video.size DESC
LIMIT 10
)

SELECT
  video_id,
  first_name,
  last_name,
  photo.url AS main_photo_url,
  video_url,
  video_size
FROM users
JOIN max_video
  ON users.id = max_video.video_owner
JOIN photo
  ON photo.id = users.main_photo_id
  ORDER BY video_size DESC; 