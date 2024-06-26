-- CreateTable
CREATE TABLE "TestResult" (
    "result_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "test_id" INTEGER NOT NULL,
    "score" INTEGER NOT NULL,
    CONSTRAINT "TestResult_test_id_fkey" FOREIGN KEY ("test_id") REFERENCES "Test" ("test_id") ON DELETE RESTRICT ON UPDATE CASCADE
);
