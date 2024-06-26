/*
  Warnings:

  - You are about to drop the `Answer` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Language` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Question` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Test` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `TestResult` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Translation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Word` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `WordsGroup` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Answer";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Language";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Question";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Test";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "TestResult";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Translation";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "User";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Word";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "WordsGroup";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "users" (
    "user_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "user_name" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "email" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "words_group" (
    "group_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "user_id" INTEGER NOT NULL,
    "group_name" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL,
    "updated_at" DATETIME NOT NULL,
    CONSTRAINT "words_group_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users" ("user_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "words" (
    "word_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "group_id" INTEGER NOT NULL,
    "word" TEXT NOT NULL,
    "language_id" INTEGER NOT NULL,
    "part_of_speech" TEXT NOT NULL,
    CONSTRAINT "words_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "words_group" ("group_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "words_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "languages" ("language_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "tests" (
    "test_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "group_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "created_at" DATETIME NOT NULL,
    CONSTRAINT "tests_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "words_group" ("group_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "tests_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users" ("user_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "test_results" (
    "result_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "test_id" INTEGER NOT NULL,
    "score" INTEGER NOT NULL,
    CONSTRAINT "test_results_test_id_fkey" FOREIGN KEY ("test_id") REFERENCES "tests" ("test_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "translations" (
    "translation_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "original_word_id" INTEGER NOT NULL,
    "original_language_id" INTEGER NOT NULL,
    "translated_word_id" INTEGER NOT NULL,
    "translated_language_id" INTEGER NOT NULL,
    "group_id" INTEGER NOT NULL,
    CONSTRAINT "translations_original_word_id_fkey" FOREIGN KEY ("original_word_id") REFERENCES "words" ("word_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "translations_translated_word_id_fkey" FOREIGN KEY ("translated_word_id") REFERENCES "words" ("word_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "translations_original_language_id_fkey" FOREIGN KEY ("original_language_id") REFERENCES "languages" ("language_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "translations_translated_language_id_fkey" FOREIGN KEY ("translated_language_id") REFERENCES "languages" ("language_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "translations_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "words_group" ("group_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "questions" (
    "question_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "translation_id" INTEGER NOT NULL,
    "test_id" INTEGER NOT NULL,
    "is_direct" BOOLEAN NOT NULL,
    CONSTRAINT "questions_translation_id_fkey" FOREIGN KEY ("translation_id") REFERENCES "translations" ("translation_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "questions_test_id_fkey" FOREIGN KEY ("test_id") REFERENCES "tests" ("test_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "answers" (
    "answer_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "question_id" INTEGER NOT NULL,
    "is_correct" BOOLEAN NOT NULL,
    CONSTRAINT "answers_question_id_fkey" FOREIGN KEY ("question_id") REFERENCES "questions" ("question_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "languages" (
    "language_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "language" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "users_user_name_key" ON "users"("user_name");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "words_group_group_name_key" ON "words_group"("group_name");
