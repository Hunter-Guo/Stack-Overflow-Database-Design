CREATE TABLE respondents (
    response_id BIGINT PRIMARY KEY,
    age VARCHAR(45)DEFAULT 0,
    employment VARCHAR(45)DEFAULT 0,
    ed_level VARCHAR(255)DEFAULT 0,
    country VARCHAR(255)DEFAULT 0,
    role_type VARCHAR(100),
    work_exp INT,
    industry VARCHAR(255),
    job_sat INT
);

CREATE TABLE coding_experience (
    response_id BIGINT PRIMARY KEY,
    learn_code VARCHAR(45),
    years_code VARCHAR(20),
    FOREIGN KEY (response_id) REFERENCES respondents(response_id)
);

CREATE TABLE stack_overflow_usage (
    response_id BIGINT PRIMARY KEY,
    so_visit_freq VARCHAR(45),
    so_account VARCHAR(45),
    pro_dev_series VARCHAR(10),
    time_searching VARCHAR(45),
    FOREIGN KEY (response_id) REFERENCES respondents(response_id)
);

CREATE TABLE desired_language_skills (
    language_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45)
);

CREATE TABLE respondent_language (
    response_id BIGINT,
    language_id INT,
    PRIMARY KEY (response_id, language_id),
    FOREIGN KEY (response_id) REFERENCES respondents(response_id),
    FOREIGN KEY (language_id) REFERENCES desired_language_skills(language_id)
);

CREATE TABLE desired_database_skills (
    database_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45)
);

CREATE TABLE respondent_database (
    response_id BIGINT,
    database_id INT,
    PRIMARY KEY (response_id, database_id),
    FOREIGN KEY (response_id) REFERENCES respondents(response_id),
    FOREIGN KEY (database_id) REFERENCES desired_database_skills(database_id)
);

CREATE TABLE desired_platform_skills (
    platform_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45)
);

CREATE TABLE respondent_platform (
    response_id BIGINT,
    platform_id INT,
    PRIMARY KEY (response_id, platform_id),
    FOREIGN KEY (response_id) REFERENCES respondents(response_id),
    FOREIGN KEY (platform_id) REFERENCES desired_platform_skills(platform_id)
);


-- Insert data into respondents table
INSERT INTO respondents (response_id, age, employment, ed_level, country, role_type, work_exp, industry, job_sat)
SELECT response_id, age, employment, ed_level, country, role_type, work_exp, industry, job_sat
FROM so;

-- Insert data into coding_experience table
INSERT INTO coding_experience (response_id, learn_code, years_code)
SELECT response_id, learn_code, years_code
FROM so;

-- Insert data into stack_overflow_usage table
INSERT INTO stack_overflow_usage (response_id, so_visit_freq, so_account, pro_dev_series, time_searching)
SELECT response_id, so_visit_freq, so_account, pro_dev_series, time_searching
FROM so;


-- Insert data into desired_language_skills table
INSERT INTO desired_language_skills (name)
VALUES
	('Python'),
    ('JavaScript'),
    ('SQL'),
    ('TypeScript'),
    ('HTML/CSS')
;

-- Insert data into desired_database_skills table
INSERT INTO desired_database_skills (name)
VALUES
	('PostgreSQL'),
    ('SQLite'),
    ('Redis'),
    ('MySQL'),
    ('MongoDB')
;

-- Insert data into desired_platform_skills table
INSERT INTO desired_platform_skills (name)
VALUES
	('Amazon Web Services (AWS)'),
    ('Microsoft Azure'),
    ('Google Cloud'),
    ('Heroku'),
    ('Firebase')
;

-- Insert into respondent_language associated table
INSERT INTO respondent_language (response_id, language_id)
SELECT so.response_id,
       CASE 
           WHEN so.language_python = 1 THEN ds.language_id 
           WHEN so.language_javascript = 1 THEN ds.language_id
           WHEN so.language_sql = 1 THEN ds.language_id 
           WHEN so.language_typescript = 1 THEN ds.language_id 
           WHEN so.language_htmlcss = 1 THEN ds.language_id
       END AS language_id
FROM so
JOIN desired_language_skills ds ON 
    (so.language_python = 1 AND ds.name = 'Python') OR 
    (so.language_javascript = 1 AND ds.name = 'JavaScript') OR 
    (so.language_sql = 1 AND ds.name = 'SQL') OR
    (so.language_typescript = 1 AND ds.name = 'TypeScript') OR 
    (so.language_htmlcss = 1 AND ds.name = 'HTML/CSS')
WHERE 
	so.language_python = 1 
    OR so.language_javascript = 1 
    OR so.language_sql = 1 
    OR so.language_typescript = 1 
    OR so.language_htmlcss = 1;
    
-- Insert into respondent_database associated table    
INSERT INTO respondent_database (response_id, database_id)
SELECT so.response_id,
       CASE 
           WHEN so.database_postgresql = 1 THEN ds.database_id 
           WHEN so.database_sqlite = 1 THEN ds.database_id
           WHEN so.database_redis = 1 THEN ds.database_id 
           WHEN so.database_mysql = 1 THEN ds.database_id 
           WHEN so.database_mongodb = 1 THEN ds.database_id
       END AS database_id
FROM so
JOIN desired_database_skills ds ON 
    (so.database_postgresql = 1 AND ds.name = 'PostgreSQL') OR 
    (so.database_sqlite = 1 AND ds.name = 'SQLite') OR 
    (so.database_redis = 1 AND ds.name = 'Redis') OR
    (so.database_mysql = 1 AND ds.name = 'MySQL') OR 
    (so.database_mongodb = 1 AND ds.name = 'MongoDB')
WHERE 
	so.database_postgresql = 1 
    OR so.database_sqlite = 1 
    OR so.database_redis = 1 
    OR so.database_mysql = 1 
    OR so.database_mongodb = 1;    
    
-- Insert into respondent_platform associated table    
INSERT INTO respondent_platform (response_id, platform_id)
SELECT so.response_id,
       CASE 
           WHEN so.platform_aws = 1 THEN ds.platform_id 
           WHEN so.platform_azure = 1 THEN ds.platform_id
           WHEN so.platform_googlecloud = 1 THEN ds.platform_id 
           WHEN so.platform_heroku = 1 THEN ds.platform_id 
           WHEN so.platform_firebase = 1 THEN ds.platform_id
       END AS platform_id
FROM so
JOIN desired_platform_skills ds ON 
    (so.platform_aws = 1 AND ds.name = 'Amazon Web Services (AWS)') OR 
    (so.platform_azure = 1 AND ds.name = 'Microsoft Azure') OR 
    (so.platform_googlecloud = 1 AND ds.name = 'Google Cloud') OR
    (so.platform_heroku = 1 AND ds.name = 'Heroku') OR 
    (so.platform_firebase = 1 AND ds.name = 'Firebase')
WHERE 
	so.platform_aws = 1 
    OR so.platform_azure = 1 
    OR so.platform_googlecloud = 1 
    OR so.platform_heroku = 1 
    OR so.platform_firebase = 1;    

-- Finally, drop the so table (raw data)
DROP TABLE so;