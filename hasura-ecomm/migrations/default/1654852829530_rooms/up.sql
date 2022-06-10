
CREATE TABLE "public"."rooms" (

"id" TEXT,

"user_id" TEXT NOT NULL,

"created_at" TIMESTAMPTZ DEFAULT NOW() NOT NULL,

CONSTRAINT "rooms_pkey" PRIMARY KEY ("id")

 );