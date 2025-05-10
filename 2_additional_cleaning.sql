Use stackflow;

-- Dropping multiple columns from the table 'SO'
ALTER TABLE SO
DROP COLUMN MainBranch,
DROP COLUMN RemoteWork,
DROP COLUMN `Check`,
DROP COLUMN CodingActivities,
DROP COLUMN LearnCodeOnline,
DROP COLUMN TechDoc,
DROP COLUMN YearsCodePro,
DROP COLUMN DevType,
DROP COLUMN OrgSize,
DROP COLUMN PurchaseInfluence,
DROP COLUMN BuyNewTool,
DROP COLUMN BuildvsBuy,
DROP COLUMN TechEndorse,
DROP COLUMN Currency,
DROP COLUMN CompTotal,
DROP COLUMN LanguageHaveWorkedWith,
DROP COLUMN LanguageAdmired,
DROP COLUMN DatabaseHaveWorkedWith,
DROP COLUMN DatabaseAdmired,
DROP COLUMN PlatformHaveWorkedWith,
DROP COLUMN PlatformAdmired,
DROP COLUMN WebframeHaveWorkedWith,
DROP COLUMN WebframeWantToWorkWith,
DROP COLUMN WebframeAdmired,
DROP COLUMN EmbeddedHaveWorkedWith,
DROP COLUMN EmbeddedWantToWorkWith,
DROP COLUMN EmbeddedAdmired,
DROP COLUMN MiscTechHaveWorkedWith,
DROP COLUMN MiscTechWantToWorkWith,
DROP COLUMN MiscTechAdmired,
DROP COLUMN ToolsTechHaveWorkedWith,
DROP COLUMN ToolsTechWantToWorkWith,
DROP COLUMN ToolsTechAdmired,
DROP COLUMN NEWCollabToolsHaveWorkedWith,
DROP COLUMN NEWCollabToolsWantToWorkWith,
DROP COLUMN NEWCollabToolsAdmired,
DROP COLUMN `OpSysPersonal use`,
DROP COLUMN `OpSysProfessional use`,
DROP COLUMN OfficeStackAsyncHaveWorkedWith,
DROP COLUMN OfficeStackAsyncWantToWorkWith,
DROP COLUMN OfficeStackAsyncAdmired,
DROP COLUMN OfficeStackSyncHaveWorkedWith,
DROP COLUMN OfficeStackSyncWantToWorkWith,
DROP COLUMN OfficeStackSyncAdmired,
DROP COLUMN AISearchDevHaveWorkedWith,
DROP COLUMN AISearchDevWantToWorkWith,
DROP COLUMN AISearchDevAdmired,
DROP COLUMN NEWSOSites,
DROP COLUMN SOPartFreq,
DROP COLUMN SOHow,
DROP COLUMN SOComm,
DROP COLUMN AISelect,
DROP COLUMN AISent,
DROP COLUMN AIBen,
DROP COLUMN AIAcc,
DROP COLUMN AIComplex,
DROP COLUMN `AIToolCurrently Using`,
DROP COLUMN `AIToolInterested in Using`,
DROP COLUMN `AIToolNot interested in Using`,
DROP COLUMN `AINextMuch more integrated`,
DROP COLUMN `AINextNo change`,
DROP COLUMN `AINextMore integrated`,
DROP COLUMN `AINextLess integrated`,
DROP COLUMN `AINextMuch less integrated`,
DROP COLUMN AIThreat,
DROP COLUMN AIEthics,
DROP COLUMN AIChallenges,
DROP COLUMN Knowledge_1,
DROP COLUMN Knowledge_2,
DROP COLUMN Knowledge_3,
DROP COLUMN Knowledge_4,
DROP COLUMN Knowledge_5,
DROP COLUMN Knowledge_6,
DROP COLUMN Knowledge_7,
DROP COLUMN Knowledge_8,
DROP COLUMN Knowledge_9,
DROP COLUMN Frequency_1,
DROP COLUMN Frequency_2,
DROP COLUMN Frequency_3,
DROP COLUMN TimeAnswering,
DROP COLUMN Frustration,
DROP COLUMN JobSatPoints_1,
DROP COLUMN JobSatPoints_4,
DROP COLUMN JobSatPoints_5,
DROP COLUMN JobSatPoints_6,
DROP COLUMN JobSatPoints_7,
DROP COLUMN JobSatPoints_8,
DROP COLUMN JobSatPoints_9,
DROP COLUMN JobSatPoints_10,
DROP COLUMN JobSatPoints_11,
DROP COLUMN SurveyLength,
DROP COLUMN SurveyEase,
DROP COLUMN ProfessionalTech,
DROP COLUMN ProfessionalCloud,
DROP COLUMN ProfessionalQuestion;


-- Query to find the number of remaining columns in the table 'SO'
SELECT COUNT(*) AS remaining_columns 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'SO';

-- Query to list all current column names
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'SO';


# Change NA to "NULL"
SET @@SQL_SAFE_UPDATES = 0;
UPDATE SO
SET ResponseId = REPLACE(ResponseId, 'NA', ''),
    Age = REPLACE(Age, 'NA', ''),
    Employment = REPLACE(Employment, 'NA', ''),
    EdLevel = REPLACE(EdLevel, 'NA', ''),
    LearnCode = REPLACE(LearnCode, 'NA', ''),
    YearsCode = REPLACE(YearsCode, 'NA', ''),
    Country = REPLACE(Country, 'NA', ''),
    LanguageWantToWorkWith = REPLACE(LanguageWantToWorkWith, 'NA', ''),
    DatabaseWantToWorkWith = REPLACE(DatabaseWantToWorkWith, 'NA', ''),
    PlatformWantToWorkWith = REPLACE(PlatformWantToWorkWith, 'NA', ''),
    SOVisitFreq = REPLACE(SOVisitFreq, 'NA', ''),
    SOAccount = REPLACE(SOAccount, 'NA', ''),
    TBranch = REPLACE(TBranch, 'NA', ''),
    ICorPM = REPLACE(ICorPM, 'NA', ''),
    WorkExp = REPLACE(WorkExp, 'NA', ''),
    TimeSearching = REPLACE(TimeSearching, 'NA', ''),
    Industry = REPLACE(Industry, 'NA', ''),
    JobSat = REPLACE(JobSat, 'NA', '');

-- check NULL% after dropping NA
SELECT 
    'ResponseId' AS ColumnName, 
    ROUND((COUNT(*) / (SELECT COUNT(*) FROM SO)) * 100, 2) AS Null_Percentage 
FROM SO WHERE ResponseId IS NULL
UNION ALL
SELECT 'Age', ROUND((COUNT(*) / (SELECT COUNT(*) FROM SO)) * 100, 2) FROM SO WHERE Age IS NULL
UNION ALL
SELECT 'Employment', ROUND((COUNT(*) / (SELECT COUNT(*) FROM SO)) * 100, 2) FROM SO WHERE Employment IS NULL
UNION ALL
SELECT 'EdLevel', ROUND((COUNT(*) / (SELECT COUNT(*) FROM SO)) * 100, 2) FROM SO WHERE EdLevel IS NULL
UNION ALL
SELECT 'LearnCode', ROUND((COUNT(*) / (SELECT COUNT(*) FROM SO)) * 100, 2) FROM SO WHERE LearnCode IS NULL
UNION ALL
SELECT 'YearsCode', ROUND((COUNT(*) / (SELECT COUNT(*) FROM SO)) * 100, 2) FROM SO WHERE YearsCode IS NULL
UNION ALL
SELECT 'Country', ROUND((COUNT(*) / (SELECT COUNT(*) FROM SO)) * 100, 2) FROM SO WHERE Country IS NULL
UNION ALL
SELECT 'LanguageWantToWorkWith', ROUND((COUNT(*) / (SELECT COUNT(*) FROM SO)) * 100, 2) FROM SO WHERE LanguageWantToWorkWith IS NULL
UNION ALL
SELECT 'DatabaseWantToWorkWith', ROUND((COUNT(*) / (SELECT COUNT(*) FROM SO)) * 100, 2) FROM SO WHERE DatabaseWantToWorkWith IS NULL
UNION ALL
SELECT 'PlatformWantToWorkWith', ROUND((COUNT(*) / (SELECT COUNT(*) FROM SO)) * 100, 2) FROM SO WHERE PlatformWantToWorkWith IS NULL
UNION ALL
SELECT 'SOVisitFreq', ROUND((COUNT(*) / (SELECT COUNT(*) FROM SO)) * 100, 2) FROM SO WHERE SOVisitFreq IS NULL
UNION ALL
SELECT 'SOAccount', ROUND((COUNT(*) / (SELECT COUNT(*) FROM SO)) * 100, 2) FROM SO WHERE SOAccount IS NULL
UNION ALL
SELECT 'TBranch', ROUND((COUNT(*) / (SELECT COUNT(*) FROM SO)) * 100, 2) FROM SO WHERE TBranch IS NULL
UNION ALL
SELECT 'ICorPM', ROUND((COUNT(*) / (SELECT COUNT(*) FROM SO)) * 100, 2) FROM SO WHERE ICorPM IS NULL
UNION ALL
SELECT 'WorkExp', ROUND((COUNT(*) / (SELECT COUNT(*) FROM SO)) * 100, 2) FROM SO WHERE WorkExp IS NULL
UNION ALL
SELECT 'TimeSearching', ROUND((COUNT(*) / (SELECT COUNT(*) FROM SO)) * 100, 2) FROM SO WHERE TimeSearching IS NULL
UNION ALL
SELECT 'Industry', ROUND((COUNT(*) / (SELECT COUNT(*) FROM SO)) * 100, 2) FROM SO WHERE Industry IS NULL
UNION ALL
SELECT 'ConvertedCompYearly', ROUND((COUNT(*) / (SELECT COUNT(*) FROM SO)) * 100, 2) FROM SO WHERE ConvertedCompYearly IS NULL
UNION ALL
SELECT 'JobSat', ROUND((COUNT(*) / (SELECT COUNT(*) FROM SO)) * 100, 2) FROM SO WHERE JobSat IS NULL;

ALTER TABLE SO
DROP COLUMN ConvertedCompYearly;

-- Step 1: Create a temporary table to hold individual languages
CREATE TEMPORARY TABLE TempLanguages (
    Language VARCHAR(255)
);

-- Step 2: Insert each language into the temporary table
INSERT INTO TempLanguages (Language)
SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(LanguageWantToWorkWith, ';', numbers.n), ';', -1)) AS Language
FROM SO
JOIN (
    SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5
    UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10
) numbers
ON CHAR_LENGTH(LanguageWantToWorkWith) - CHAR_LENGTH(REPLACE(LanguageWantToWorkWith, ';', '')) >= numbers.n - 1
WHERE LanguageWantToWorkWith IS NOT NULL;

-- Step 3: Count the occurrences of each language and display the top 10
SELECT Language, COUNT(*) AS LanguageCount
FROM TempLanguages
GROUP BY Language
ORDER BY LanguageCount DESC
LIMIT 10;

-- Step 4: Drop the temporary table
DROP TEMPORARY TABLE TempLanguages;

SELECT Language, COUNT(*) AS Count
FROM (
  SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(LanguageWantToWorkWith, ';', numbers.n), ';', -1)) AS Language
  FROM SO AS s
  JOIN (SELECT 1 AS n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) AS numbers ON CHAR_LENGTH(s.LanguageWantToWorkWith) - CHAR_LENGTH(REPLACE(s.LanguageWantToWorkWith, ';', '')) >= numbers.n - 1
  WHERE s.LanguageWantToWorkWith IS NOT NULL
) AS languages
GROUP BY Language
ORDER BY Count DESC;

SELECT DatabaseName, COUNT(*) AS Count
FROM (
  SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(DatabaseWantToWorkWith, ';', numbers.n), ';', -1)) AS DatabaseName
  FROM SO AS s
  JOIN (SELECT 1 AS n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) AS numbers
  ON CHAR_LENGTH(s.DatabaseWantToWorkWith) - CHAR_LENGTH(REPLACE(s.DatabaseWantToWorkWith, ';', '')) >= numbers.n - 1
  WHERE s.DatabaseWantToWorkWith IS NOT NULL
) AS `databases`
GROUP BY DatabaseName
ORDER BY Count DESC
LIMIT 5;

SELECT PlatformName, COUNT(*) AS Count
FROM (
  SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(PlatformWantToWorkWith, ';', numbers.n), ';', -1)) AS PlatformName
  FROM SO AS s
  JOIN (SELECT 1 AS n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) AS numbers
  ON CHAR_LENGTH(s.PlatformWantToWorkWith) - CHAR_LENGTH(REPLACE(s.PlatformWantToWorkWith, ';', '')) >= numbers.n - 1
  WHERE s.PlatformWantToWorkWith IS NOT NULL
) AS platforms
GROUP BY PlatformName
ORDER BY Count DESC
LIMIT 5;

UPDATE SO
SET Employment = CASE
    WHEN Employment LIKE '%Student%' THEN 'Student'
    WHEN Employment LIKE '%Retired%' THEN 'Retired'
    WHEN Employment LIKE '%Not employed, but looking for work%' AND Employment NOT LIKE '%Student%' THEN 'Looking for work'
    ELSE 'Employed'
END;

UPDATE SO
SET LearnCode = CASE
    WHEN LearnCode LIKE '%Online%' THEN 'Online'
    ELSE 'Not online'
END;


-- Rename all other columns to lowercase
ALTER TABLE SO
RENAME COLUMN TBranch TO pro_dev_series,
RENAME COLUMN ICorPM TO role_type,
RENAME COLUMN ResponseId TO response_id,
RENAME COLUMN Age TO age,
RENAME COLUMN Employment TO employment,
RENAME COLUMN EdLevel TO ed_level,
RENAME COLUMN LearnCode TO learn_code,
RENAME COLUMN YearsCode TO years_code,
RENAME COLUMN Country TO country,
RENAME COLUMN SOVisitFreq TO so_visit_freq,
RENAME COLUMN SOAccount TO so_account,
RENAME COLUMN TimeSearching TO time_searching,
RENAME COLUMN Industry TO industry,
RENAME COLUMN JobSat TO job_sat,
RENAME COLUMN LanguageSkill_Python TO language_python,
RENAME COLUMN LanguageSkill_JavaScript TO language_javascript,
RENAME COLUMN LanguageSkill_SQL TO language_sql,
RENAME COLUMN LanguageSkill_TypeScript TO language_typescript,
RENAME COLUMN LanguageSkill_HTMLCSS TO language_htmlcss,
RENAME COLUMN Database_PostgreSQL TO database_postgresql,
RENAME COLUMN Database_SQLite TO database_sqlite,
RENAME COLUMN Database_Redis TO database_redis,
RENAME COLUMN Database_MySQL TO database_mysql,
RENAME COLUMN Database_MongoDB TO database_mongodb,
RENAME COLUMN Platform_AmazonWebServicesAWS TO platform_aws,
RENAME COLUMN Platform_MicrosoftAzure TO platform_azure,
RENAME COLUMN Platform_GoogleCloud TO platform_googlecloud,
RENAME COLUMN Platform_Heroku TO platform_heroku,
RENAME COLUMN Platform_Firebase TO platform_firebase,
RENAME COLUMN WorkExp TO work_exp;


-- Display each column's type
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'SO';

-- Alter column types
ALTER TABLE SO
MODIFY job_sat INT,
MODIFY language_python INT,
MODIFY language_javascript INT,
MODIFY language_sql INT,
MODIFY language_typescript INT,
MODIFY language_htmlcss INT,
MODIFY database_postgresql INT,
MODIFY database_sqlite INT,
MODIFY database_redis INT,
MODIFY database_mysql INT,
MODIFY database_mongodb INT,
MODIFY platform_aws INT,
MODIFY platform_azure INT,
MODIFY platform_googlecloud INT,
MODIFY platform_heroku INT,
MODIFY platform_firebase INT;

-- Display each column's name and type
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'SO';