USE [SGSSO]
GO

PRINT 'Creating ecrypted passwod...';

CREATE PROCEDURE RegisterUser
    @person_id VARCHAR(50),
    @password VARCHAR(MAX),
    @created_at DATETIME,
    @updated_at DATETIME
AS
BEGIN
    INSERT INTO Account (
        person_id,
        password,
        created_at,
        updated_at
    )
    VALUES (
        @person_id,
        ENCRYPTBYPASSPHRASE('password', @password),
        @created_at,
        @updated_at
    )
END
