
EXEC spProductInfo;

SELECT HASHBYTES('SHA2_256', CONVERT(VARCHAR(64), 'mypassword123')) AS HashedPassword;

