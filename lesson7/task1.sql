CREATE VIEW users_without_friends AS
SELECT 
 id
 FROM users
 WHERE id NOT IN (
	 SELECT DISTINCT
      users.id
      FROM users
      LEFT JOIN friendship
        ON users.id = requested_by_user_id
	    OR users.id = requested_by_user_id
      LEFT JOIN friendship_statuses
	    ON friendship.status_id = friendship_statuses.id
	  WHERE status_id = 1);


BEGIN;
DELETE FROM communities_users USING users_without_friends WHERE communities.user_id = users_without_friends.id;
DELETE FROM friendship USING users_without_friends 
  WHERE requested_by_user_id = users_without_friends.id OR requested_to_user_id = users_without_friends.id;
DELETE FROM messages WHERE USING users_without_friends 
  WHERE messages.from_user_id = users_without_friends.id OR messages.to_user_id = users_without_friends.id;
DELETE FROM messages WHERE USING users_without_friends WHERE messages.requested_to_user_id = users_without_friends.id;
DELETE FROM photo USING users_without_friends WHERE photo.owner_id = users_without_friends.id;
DELETE FROM video USING users_without_friends WHERE video.owner_id = users_without_friends.id;
DELETE FROM subscribtions USING  users_without_friends WHERE subscribtions.subscriber_id = users_without_friends.id;
DELETE FROM profiles USING users_without_friends WHERE profiles.user_id = users_without_friends.id;
DELETE FROM users USING users_without_friends WHERE id = users_without_friends.id;
COMMIT;
