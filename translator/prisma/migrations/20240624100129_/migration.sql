-- CreateTable
CREATE TABLE "Word" (
    "word_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "group_id" INTEGER NOT NULL,
    "word" TEXT NOT NULL,
    "language_id" INTEGER NOT NULL,
    "part_of_speech" TEXT NOT NULL,
    CONSTRAINT "Word_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "WordsGroup" ("group_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Word_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "Language" ("language_id") ON DELETE RESTRICT ON UPDATE CASCADE
);
