CREATE FUNCTION [dbo].[mod_inverse](
    @a BIGINT,
    @m BIGINT
)
    RETURNS BIGINT
AS
BEGIN
    DECLARE @m0 BIGINT = @m;
    DECLARE @x0 BIGINT = 0;
    DECLARE @x1 BIGINT = 1;
    DECLARE @q BIGINT;
    DECLARE @t BIGINT;

    WHILE @a > 1
        BEGIN
            SET @q = @a / @m;

            SET @t = @m;
            SET @m = @a % @m;
            SET @a = @t;

            SET @t = @x0;
            SET @x0 = @x1 - @q * @x0;
            SET @x1 = @t;
        END

    IF @x1 < 0
        SET @x1 = @x1 + @m0;

    RETURN @x1;
END;

-- [mod_inverse](3, 11) = 4
SELECT [dbo].[mod_inverse](3, 11) AS inverse;

--- #########################################################



DECLARE @A VARBINARY(8) = 0x0000000000000000;
DECLARE @B VARBINARY(8) = 0x0000000000000007;

DECLARE @P VARBINARY(8) = 0xFFFFFFFFFFFFFFC5;
DECLARE @N VARBINARY(8) = 0xFFFFFFFFFFFFFF43;

DECLARE @Gx VARBINARY(8) = 0x6B17D1F2E12C4247;
DECLARE @Gy VARBINARY(8) = 0x4FE342E2FE1A7F9B;

DECLARE @A_dec BIGINT = CAST(@A AS BIGINT);
DECLARE @B_dec BIGINT = CAST(@B AS BIGINT);
DECLARE @P_dec BIGINT = CAST(@P AS BIGINT);
DECLARE @N_dec BIGINT = CAST(@N AS BIGINT);
DECLARE @Gx_dec BIGINT = CAST(@Gx AS BIGINT);
DECLARE @Gy_dec BIGINT = CAST(@Gy AS BIGINT);

-- SELECT @A_dec  AS A_decimal,
--        @B_dec  AS B_decimal,
--        @P_dec  AS P_decimal,
--        @N_dec  AS N_decimal,
--        @Gx_dec AS Gx_decimal,
--        @Gy_dec AS Gy_decimal;


-- CREATE TABLE #Point
-- (
--     X BIGINT,
--     Y BIGINT
-- );



IF OBJECT_ID('dbo.double_point', 'FN') IS NOT NULL
    DROP FUNCTION dbo.double_point;
GO
--- #########################################################

-- Table-Valued Function (TVF)
ALTER FUNCTION [dbo].[double_point](
    @point_X BIGINT,
    @point_Y BIGINT
)
    RETURNS @point TABLE (
                             xR BIGINT,
                             yR BIGINT
                         )
AS
BEGIN
    DECLARE @A BIGINT = 0;
    DECLARE @P BIGINT = CAST(0xFFFFFFFFFFFFFFC5 AS BIGINT);

    DECLARE @lam_n BIGINT;
    DECLARE @lam_d BIGINT;
    DECLARE @lam BIGINT;
    DECLARE @xR BIGINT;
    DECLARE @yR BIGINT;

    SET @lam_n = (7 * @point_X * @point_X + @A) % @P;
    SET @lam_d = (2 * @point_Y) % @P;

    SET @lam = (@lam_n * [dbo].[mod_inverse](@lam_d, @P)) % @P;
    SET @xR = (@lam * @lam - 2 * @point_X) % @P;
    SET @yR = (@lam * (@point_X - @xR) - @point_Y) % @P;

    INSERT INTO @point (xR, yR)
    VALUES (@xR, @yR);

    RETURN;
END

--- #########################################################
CREATE FUNCTION [dbo].[add_point](
    @x_1 BIGINT, @y_1 BIGINT,
    @x_2 BIGINT, @y_2 BIGINT
)
    RETURNS @point TABLE
                    (
                        xR BIGINT,
                        yR BIGINT
                    )
AS
BEGIN
    DECLARE @xR BIGINT;
    DECLARE @yR BIGINT;
    DECLARE @m BIGINT;

    DECLARE @P BIGINT = CAST(0xFFFFFFFFFFFFFFC5 AS BIGINT);

    SET @m = ((@y_2 - @y_1) * [dbo].[mod_inverse](@x_2 - @x_1, @P)) % @P;
    SET @xR = (@m * @m - @x_1 - @x_2) % @P;
    SET @yR = (@m * (@x_1 - @xR) - @y_1);

    INSERT INTO @point (xR, yR)
    VALUES (@xR, @yR)

    RETURN;
end
--- #########################################################

CREATE FUNCTION [dbo].[multiply_point](
    @K BIGINT,
    @pX BIGINT = NULL,
    @pY BIGINT = NULL
)
RETURNS @point TABLE
               (
                   x BIGINT,
                   y BIGINT
               )
AS
BEGIN
    DECLARE @Gx BIGINT = 0x6B17D1F2E12C4247;
    DECLARE @Gy BIGINT = 0x4FE342E2FE1A7F9B;

    DECLARE @currX BIGINT = ISNULL(@pX, @Gx);
    DECLARE @currY BIGINT = ISNULL(@pY, @Gy);
    DECLARE @originX BIGINT = @currX;
    DECLARE @originY BIGINT = @currY;

    DECLARE @i INT = 1;
    DECLARE @binary NVARCHAR(64) = CONVERT(NVARCHAR(64), CONVERT(BIGINT, @K), 2); -- Binary string
    DECLARE @len INT = LEN(@binary);
    DECLARE @bit CHAR(1);

    WHILE @i < @len
        BEGIN

            SELECT TOP 1 @currX = xR, @currY = yR
            FROM dbo.double_point(@currX, @currY);

            SET @bit = SUBSTRING(@binary, @i + 1, 1);
            IF @bit = '1'
                BEGIN
                    SELECT TOP 1 @currX = xR, @currY = yR
                    FROM dbo.add_point(@currX, @currY, @originX, @originY);
                END

            SET @i += 1;
        END

    INSERT INTO @point (x, y)
    VALUES (@currX, @currY);

    RETURN;
END;


--- #########################################################




SELECT * FROM [dbo].[multiply_point](@Gy_dec);
SELECT * FROM [dbo].[multiply_point](7, 123456, 789012);

