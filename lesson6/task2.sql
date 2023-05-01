CREATE OR REPLACE PROCEDURE check_owner_main_photo()
LANGUAGE PLPGSQL AS
$$
DECLARE message_row RECORD;
BEGIN
  FOR message_row IN
  SELECT * 
    FROM profiles
    LEFT JOIN photo
    ON profiles.main_photo_id = photo.id
      WHERE profiles.user_id != photo.owner_id
        AND profiles.user_id IS NOT NULL
  LOOP
    UPDATE profiles SET main_photo_id = NULL;
  END LOOP;
COMMIT;
END;
$$;

ALTER TABLE profiles ALTER COLUMN main_photo_id DROP NOT NULL;

CALL check_owner_main_photo();
