INSERT INTO "public"."users" ("id", "name")

SELECT
  CONCAT('u', "t") AS "id",
  CONCAT('User', "t") AS "name"

FROM generate_series(1, 30) AS "t"

ON CONFLICT ON CONSTRAINT "userss_pkey"
DO UPDATE SET "name" = EXCLUDED."name";

INSERT INTO "public"."rooms"
("id", "user_id", "name")

SELECT
  CONCAT('r', "p") AS "id",

  CONCAT('u', floor(random() * (10 - 1 + 1) + 1)) AS "user_id",

  CONCAT('n', floor(random() * (10 - 1 + 1) + 1)) AS "name"

FROM generate_series(1, 500) AS "p"

ON CONFLICT ON CONSTRAINT "rooms_pkey"
DO UPDATE SET
  "user_id" = EXCLUDED."user_id";


INSERT INTO "public"."messages"
("id", "user_id", "room_id", "message")

SELECT
  CONCAT('m', "m") AS "id",

  CONCAT('u', floor(random() * (40 - 1 + 1) + 1)) AS "user_id",
 
  CONCAT('r', floor(random() * (300 - 1 + 1) + 1)) AS "room_id",
  CONCAT('Example message', "m") AS "message"

FROM generate_series(1, 500) AS "m"

ON CONFLICT ON CONSTRAINT "messages_pkey"
DO UPDATE SET
  "user_id" = EXCLUDED."user_id",
  "room_id" = EXCLUDED."room_id",
  "message" = EXCLUDED."message"

  RETURNING *;

  