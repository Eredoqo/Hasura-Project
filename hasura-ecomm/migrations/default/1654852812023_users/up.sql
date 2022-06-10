CREATE TABLE "public"."users" (

"id" TEXT,

"name" TEXT NOT NULL,

"created_at" TIMESTAMPTZ DEFAULT NOW() NOT NULL,

CONSTRAINT "userss_pkey" PRIMARY KEY ("id")

);

ALTER TABLE ONLY "public"."users"
ADD CONSTRAINT "messages_user_id_fkey"
FOREIGN KEY (id) REFERENCES users(id)
ON UPDATE CASCADE
ON DELETE CASCADE
NOT DEFERRABLE;