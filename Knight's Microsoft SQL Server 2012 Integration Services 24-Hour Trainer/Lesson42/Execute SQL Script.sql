declare @RecordsInserted int
             
if exists(select Name
        from ForLoop )
set @RecordsInserted = 1
else
             
set @RecordsInserted = 0
select @RecordsInserted as RecordsInserted
