-- Set the database and schema context
USE SCHEMA SCHEMACHANGE_DEMO.PUBLIC;

-- Load the trips data

-- Load the weather data
COPY INTO WEATHER FROM
    (
        SELECT
             $1
            ,CONVERT_TIMEZONE('UTC', 'US/Eastern', $1:time::TIMESTAMP_NTZ)
        FROM @WEATHER
    )
    FILE_FORMAT = (FORMAT_NAME = 'JSON');
