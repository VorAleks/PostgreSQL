WITH users_photo_video_count AS (
SELECT DISTINCT
  users.first_name,
  users.last_name,
  COUNT(photo.id) OVER (PARTITION BY users.id) AS photo_count,
  COUNT(video.id) OVER (PARTITION BY users.id) AS video_count
  FROM users
    LEFT JOIN photo
      ON users.id = photo.owner_id
    LEFT JOIN video
      ON users.id = video.owner_id)
SELECT
  first_name,
  last_name,
  photo_count,
  DENSE_RANK() OVER (ORDER BY photo_count DESC) AS user_photo_count_rank,
  video_count,
  DENSE_RANK() OVER (ORDER BY video_count DESC) AS user_video_count_rank
  FROM users_photo_video_count;