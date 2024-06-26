-- CreateTable
CREATE TABLE "Translation" (
    "translation_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "original_word_id" INTEGER NOT NULL,
    "original_language_id" INTEGER NOT NULL,
    "translated_word_id" INTEGER NOT NULL,
    "translated_language_id" INTEGER NOT NULL,
    "group_id" INTEGER NOT NULL,
    CONSTRAINT "Translation_original_word_id_fkey" FOREIGN KEY ("original_word_id") REFERENCES "Word" ("word_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Translation_original_language_id_fkey" FOREIGN KEY ("original_language_id") REFERENCES "Language" ("language_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Translation_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "WordsGroup" ("group_id") ON DELETE RESTRICT ON UPDATE CASCADE
);
