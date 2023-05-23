CREATE OR REPLACE FUNCTION check_main_photo_owner_trigger()
RETURNS TRIGGER AS
$$
DECLARE is_found BOOLEAN;
BEGIN
  is_found := EXISTS(SELECT * 
    		       FROM profiles
 		      JOIN photo
    		      ON profiles.main_photo_id = photo.id
     		      WHERE profiles.user_id = photo.owner_id);
  IF NOT is_found THEN
    RETURN OLD;
  ELSE
    RETURN OLD;
  END IF;
END
$$
LANGUAGE PLPGSQL;

CREATE TRIGGER check_main_photo_owner_on_update BEFORE UPDATE ON profiles
  FOR EACH ROW
  EXECUTE FUNCTION check_main_photo_owner_trigger();