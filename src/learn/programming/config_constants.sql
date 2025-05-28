
-- secp64k1-test
CREATE FUNCTION dbo.get_curve_constants()
RETURNS TABLE
AS
RETURN (
    SELECT 
        CAST(0x0000000000000000 AS BIGINT) AS A,
        CAST(0x0000000000000007 AS BIGINT) AS B,
        CAST(0xFFFFFFFFFFFFFFC5 AS BIGINT) AS P,
        CAST(0x6B17D1F2E12C4247 AS BIGINT) AS Gx,
        CAST(0x4FE342E2FE1A7F9B AS BIGINT) AS Gy
);



SELECT *
FROM dbo.get_curve_constants();


--- ##############################
