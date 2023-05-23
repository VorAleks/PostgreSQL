CREATE VIEW top10_maxsize_video AS
SELECT * FROM video  
  ORDER BY size DESC LIMIT 10;

SELECT id, size FROM top10_maxsize_video;



CREATE VIEW video_uploaded_year_ago AS
SELECT * FROM video  
  WHERE uploaded_at < (current_timestamp - interval '1 year');

SELECT 
  first_name,
  last_name,
  description,
  uploaded_at
  FROM video_uploaded_year_ago
  JOIN users
  ON users.id = video_uploaded_year_ago.owner_id;

UPDATE video_uploaded_year_ago SET description = 'old video';

SELECT 
  first_name,
  last_name,
  description,
  uploaded_at
  FROM video_uploaded_year_ago
  JOIN users
  ON users.id = video_uploaded_year_ago.owner_id;