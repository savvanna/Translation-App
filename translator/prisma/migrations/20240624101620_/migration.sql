-- CreateTable
CREATE TABLE "Answer" (
    "answer_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "question_id" INTEGER NOT NULL,
    "is_correct" BOOLEAN NOT NULL,
    CONSTRAINT "Answer_question_id_fkey" FOREIGN KEY ("question_id") REFERENCES "Question" ("question_id") ON DELETE RESTRICT ON UPDATE CASCADE
);
