USE [beautysalon]
GO
/****** Object:  StoredProcedure [dbo].[register_history]    Script Date: 8/05/2026 8:05:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[register_history] 

@ID int,
@id_employee int,
@historiku_detajet dbo.historiku_detajet_array READONLY
as 
begin
SET NOCOUNT ON;

    BEGIN TRANSACTION;


declare @newID int;

INSERT INTO historiku (ID, emri_mbiemri_punonjesit)
VALUES (
    @ID,
    (SELECT emri + ' ' + mbiemri
     FROM employees
     WHERE ID = @id_employee)
);

 set @newID = SCOPE_IDENTITY();

 insert into historiku_detajet(id_historikut, emri_sherbimit, emri_atributit, pershkrimi, pagesa)
 SELECT @newID, emri_sherbimit, emri_atributit, pershkrimi, pagesa from @historiku_detajet;
  commit transaction;
 end;


 USE [beautysalon]
GO
/****** Object:  StoredProcedure [dbo].[clientHistory]    Script Date: 8/05/2026 7:55:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[clientHistory]
  @ClientId BIGINT
   as 
   begin
          SELECT
        c.emri, c.mbiemri,
        h.emri_mbiemri_punonjesit,
        h.data_sherbimit,

        d.id_historikut_detajet,
        d.emri_sherbimit,
        d.pagesa

    FROM historiku h
     JOIN Clients c ON c.ID = h.ID
    LEFT JOIN historiku_detajet d ON d.id_historikut = h.id_historikut

    WHERE h.ID = @ClientId;
    END;