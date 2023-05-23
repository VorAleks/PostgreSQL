CREATE FUNCTION to_user_max_messages_sender_id(user_id INTEGER)
RETURNS INTEGER AS
$$
SELECT
 max(from_user_id)
FROM messages 
WHERE to_user_id = user_id
GROUP BY from_user_id
LIMIT 1;
$$
LANGUAGE SQL;