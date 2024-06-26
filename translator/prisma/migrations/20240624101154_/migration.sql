-- CreateTable
CREATE TABLE "Test" (
    "test_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "group_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created_at" DATETIME NOT NULL,
    CONSTRAINT "Test_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "WordsGroup" ("group_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Test_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
