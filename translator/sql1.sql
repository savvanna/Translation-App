CREATE TABLE IF NOT EXISTS users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_name TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS words_group (
    group_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    group_name TEXT NOT NULL UNIQUE,
    created_at DATE NOT NULL,
    updated_at DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS words (
    word_id INTEGER PRIMARY KEY AUTOINCREMENT,
    group_id INTEGER NOT NULL,
    word TEXT NOT NULL,
    language_id INTEGER NOT NULL,
    part_of_speech TEXT NOT NULL,
    FOREIGN KEY (group_id) REFERENCES words_group(group_id),
    FOREIGN KEY (language_id) REFERENCES languages(language_id)
);

CREATE TABLE IF NOT EXISTS tests (
    test_id INTEGER PRIMARY KEY AUTOINCREMENT,
    group_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    created_at DATE NOT NULL,
    FOREIGN KEY (group_id) REFERENCES words_group(group_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE IF NOT EXISTS test_results (
    result_id INTEGER PRIMARY KEY AUTOINCREMENT,
    test_id INTEGER NOT NULL,
    score INTEGER NOT NULL,
    FOREIGN KEY (test_id) REFERENCES tests(test_id)
);

CREATE TABLE IF NOT EXISTS translations (
    translation_id INTEGER PRIMARY KEY AUTOINCREMENT,
    original_word_id INTEGER NOT NULL,
    original_language_id INTEGER NOT NULL,
    translated_word_id INTEGER NOT NULL,
    translated_language_id INTEGER NOT NULL,
    group_id INTEGER NOT NULL,
    FOREIGN KEY (original_word_id) REFERENCES words(word_id),
    FOREIGN KEY (original_language_id) REFERENCES languages(language_id),
    FOREIGN KEY (translated_word_id) REFERENCES words(word_id),
    FOREIGN KEY (translated_language_id) REFERENCES languages(language_id),
    FOREIGN KEY (group_id) REFERENCES words_group(group_id)
);

CREATE TABLE IF NOT EXISTS questions (
    question_id INTEGER PRIMARY KEY AUTOINCREMENT,
    translation_id INTEGER NOT NULL,
    test_id INTEGER NOT NULL,
    is_direct BOOLEAN NOT NULL,
    FOREIGN KEY (translation_id) REFERENCES translations(translation_id),
    FOREIGN KEY (test_id) REFERENCES tests(test_id)
);

CREATE TABLE IF NOT EXISTS answers (
    answer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    question_id INTEGER NOT NULL,
    is_correct BOOLEAN NOT NULL,
    FOREIGN KEY (question_id) REFERENCES questions(question_id)
);

CREATE TABLE IF NOT EXISTS languages (
    language_id INTEGER PRIMARY KEY AUTOINCREMENT,
    language TEXT NOT NULL
); 


INSERT INTO users (user_name, password, email)VALUES ('JohnDoe', 'mysecretpassword', 'john.doe@example.com');

INSERT INTO words_group (user_id, group_name, created_at, updated_at)VALUES (1, 'My Vocabulary', '2024-06-21', '2024-06-21');

INSERT INTO words (group_id, word, language_id, part_of_speech)VALUES (1, 'apple', 1, 'noun');


INSERT INTO tests (group_id, user_id, created_at)VALUES (1, 1, '2024-06-21');

INSERT INTO test_results (test_id, score)VALUES (1, 90);

INSERT INTO translations (original_word_id, original_language_id, translated_word_id, translated_language_id, group_id)VALUES (1, 2, 1, 2, 1);

INSERT INTO questions (translation_id, test_id, is_direct)VALUES (1, 1, true);

INSERT INTO answers (question_id, is_correct)VALUES (1, true);



INSERT INTO languages (language) VALUES ('en');
INSERT INTO languages (language) VALUES ('ru');


