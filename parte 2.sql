use EDICION

--TRIGGER
create trigger DIS_AUTORIA_actualizar
on AUTORIA
for update
as
if update (nacionalidad)
begin
raiserror ('la nacionalidad no puede modificarse. la actualizacion no se realizo', 10,1)
rollback transaction
end;
update AUTORIA set nacionalidad='jpones' where idautoria=100;
update AUTORIA set edad=70 where idautoria =101;
select *from portada

--CURSOR
declare @iddiseņador varchar
declare @nombrediseņador nvarchar (20)
declare @apellidodiseņador nvarchar(20)
declare @correo nvarchar (20)


declare Cursordiseņador Cursor 
for select * from diseņador

open Cursordiseņador
fetch next from Cursordiseņador into @iddiseņador,@nombrediseņador,@apellidodiseņador,@correo

while (@@FETCH_STATUS =0)
begin 
print @iddiseņador+' '+@nombrediseņador + ' '+ @apellidodiseņador+ ' '+ @correo;
fetch next from Cursordiseņador into @iddiseņador,@nombrediseņador,@apellidodiseņador,@correo
end


close Cursordiseņador
deallocate Cursordiseņador

--PROCEDIMIENTO ALMACENADOS

EXEC pa_SELECT_EDITOR

CREATE PROCEDURE pa_SELECT_EDITOR
AS
SELECT ideditor, nombreeditor,apellidoeditor,correoeditor
FROM editor

CREATE PROCEDURE pa_EDITOR_UPDATE
(
@nombreeditor varchar (20),
@apellidoeditor varchar(20),
@correoeditor varchar(20),
@ideditor INT
)
AS
UPDATE editor
set nombreeditor=@nombreeditor, apellidoeditor=@apellidoeditor,correoeditor=@correoeditor
WHERE ideditor=@ideditor

EXEC pa_EDITOR_UPDATE 'Roberta','Reyes','roberta@gmail.com',12;

