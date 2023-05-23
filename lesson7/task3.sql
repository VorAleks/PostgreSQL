SELECT DISTINCT
  communities.id,
  communities.name,
  AVG(video.size) OVER (PARTITION BY communities.id) AS avg_size_video,
  users.id,
  users.first_name,
  users.last_name
  FROM communities
    JOIN communities_users
      ON communities_users.community_id = communities.id
    JOIN video
      ON video.owner_id = communities_users.user_id
    JOIN users
      ON users.id = video.owner_id
  ORDER BY avg_size_video DESC;