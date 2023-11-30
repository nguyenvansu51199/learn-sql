use HowKteam
GO


Declare @T nchar(100)
Declare @Y nchar(100)

Declare cursorGiaoVien CURSOR FOR
Select MABM, MAGV from dbo.GiaoVien

Open cursorGiaoVien

FETCH NEXT FROM cursorGiaoVien     
      INTO @T, @Y

	  WHILE @@FETCH_STATUS = 0
BEGIN
                                 
    PRINT 'ID:' + @T
    PRINT 'TITLE:' + @Y

    FETCH NEXT FROM cursorGiaoVien 
          INTO @T, @MAGV
END


CLOSE cursorGiaoVien            
DEALLOCATE cursorGiaoVien 

select * from dbo.GIAOVIEN


declare @tran varchar(20)
set @tran = 'tran'

BEGIN TRANSACTION @tran
UPDATE dbo.GIAOVIEN set LUONG = 2000 where dbo.GIAOVIEN.MAGV = '003'
COMMIT TRANSACTION @tran