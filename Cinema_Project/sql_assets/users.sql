

CREATE TABLE IF NOT EXISTS "Users" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "userName" TEXT DEFAULT 'unknown',
    "userEmail" TEXT NOT NULL,
    "userPassword" TEXT NOT NULL
);

CREATE UNIQUE INDEX IF NOT EXISTS "email_index"
ON "Users" ("userEmail");

CREATE UNIQUE INDEX IF NOT EXISTS "username_index"
ON "Users" ("userName");