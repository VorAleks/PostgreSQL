DROP TABLE max_video;

CREATE TEMPORARY TABLE max_video(
  video_id INTEGER,
  video_url VARCHAR (255),
  video_owner INTEGER,
  video_size INTEGER
);

INSERT INTO max_video
SELECT video.id, video.url, video.owner_id, video.size
FROM video
ORDER BY video.size DESC
LIMIT 10;

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
  ON photo.id = users.main_photo_id;