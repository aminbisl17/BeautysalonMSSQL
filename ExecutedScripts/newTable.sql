
use beautysalon;
go

-- Foreign keys 
ALTER TABLE terminet DROP CONSTRAINT fk_terminet_id_atributit;
ALTER TABLE terminet DROP CONSTRAINT fk_terminet_id_sherbimit;



DROP INDEX ID_sherbimit ON terminet;
DROP INDEX id_atributit ON terminet;

-- Other constraints
ALTER TABLE terminet DROP CONSTRAINT DF__terminet__id_atr__76969D2E;
ALTER TABLE terminet DROP CONSTRAINT DF__terminet__ID_she__75A278F5;
ALTER TABLE terminet DROP CONSTRAINT DF__terminet__kohezg__797309D9;
ALTER TABLE terminet DROP CONSTRAINT DF__terminet__qmimi__787EE5A0;
ALTER TABLE terminet DROP CONSTRAINT DF__terminet__qmimiF__73BA3083;
ALTER TABLE terminet DROP CONSTRAINT DF__terminet__zbritj__74AE54BC;


ALTER TABLE terminet DROP COLUMN ID_sherbimit, id_atributit, kohezgjatja, qmimi, zbritja, qmimiFillestar;

go

go
CREATE TABLE detajet_termineve(
     id_detajetTermineve BIGINT identity(1,1) primary key,
     id_terminit INT not null,
     ID_sherbimit INT not null,
     id_atributit INT default null,
     kohezgjatja time not null,
     pagesa decimal(10,2) default 0,
      CONSTRAINT fk_id_terminit FOREIGN KEY(id_terminit) REFERENCES terminet(id_terminit) on delete CASCADE,
      CONSTRAINT fk_ID_sherbimit FOREIGN KEY(ID_sherbimit) REFERENCES sherbimet(ID),
      CONSTRAINT fk_id_atributit FOREIGN KEY(id_atributit) REFERENCES atributet_sherbimeve(id_atributit)
   );

   go

   go
   CREATE PROCEDURE krijo_detaj_terminit 

  @id_terminit BIGINT,
  @ID_sherbimit BIGINT,
  @id_atributit BIGINT = NULL,
  @kohezgjatja TIME = '00:00:00',
  @pagesa DECIMAL(10,2) = 0
  as
  begin


  INSERT INTO detajet_termineve (id_terminit, ID_sherbimit, id_atributit, kohezgjatja, pagesa)

  values(@id_terminit, @ID_sherbimit, @id_atributit, @kohezgjatja, @pagesa);

  end;
  go
  go

  ALTER PROCEDURE [dbo].[create_appointment] 

@IDClientit BIGINT,
@IDEmployee BIGINT,
@pershkrimi nvarchar(255) = null,
@data_caktimit DATETIME2,
  @ID_sherbimit BIGINT,
  @id_atributit BIGINT = NULL,
  @kohezgjatja TIME = '00:00:00',
  @pagesa DECIMAL(10,2) = 0,
@status BIT OUTPUT

 as
   begin 
   SET NOCOUNT ON;
   DECLARE @newID BIGINT;

IF EXISTS (
    SELECT 1
    FROM terminet
    WHERE DATEADD(MINUTE, DATEDIFF(MINUTE, 0, data_caktimit), 0) = 
          DATEADD(MINUTE, DATEDIFF(MINUTE, 0, @data_caktimit), 0)
) begin
     SET @status = 0;
     return;
     end
ELSE
    
     SET @status = 1;

    insert into terminet(ID, employee_id, pershkrimi, data_caktimit)
    VALUES(@IDClientit, @IDEmployee, @pershkrimi, @data_caktimit);

    set @newID = SCOPE_IDENTITY();

   
    EXECUTE krijo_detaj_terminit 
        @id_terminit = @newID, 
        @ID_sherbimit = @ID_sherbimit,  
        @id_atributit = @id_atributit, 
        @kohezgjatja = @kohezgjatja, 
        @pagesa = @pagesa;


    end;

    go

    go

    DECLARE @status BIT;

EXEC dbo.create_appointment
    @IDClientit = 101,
    @IDEmployee = 5,
    @pershkrimi = N'Haircut',
    @data_caktimit = '2026-01-10 10:30:00',
    @ID_sherbimit = 3,
    @id_atributit = 2,
    @kohezgjatja = '00:30:00',
    @pagesa = 25.00,
    @status = @status OUTPUT;


   SELECT * FROM terminet, detajet_termineve;

  go

