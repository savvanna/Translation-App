-- CreateTable
CREATE TABLE "Question" (
    "question_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "translation_id" INTEGER NOT NULL,
    "test_id" INTEGER NOT NULL,
    "is_direct" BOOLEAN NOT NULL,
    CONSTRAINT "Question_translation_id_fkey" FOREIGN KEY ("translation_id") REFERENCES "Translation" ("translation_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Question_test_id_fkey" FOREIGN KEY ("test_id") REFERENCES "Test" ("test_id") ON DELETE RESTRICT ON UPDATE CASCADE
);
