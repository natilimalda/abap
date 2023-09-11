MODULE pbo_9001 OUTPUT.
SET PF-STATUS 'S9001'.
IF sy-tcode = 'ZFV002'.
  SET TITLEBAR 'IDMOD'.
ENDIF.
IF sy-tcode = 'ZFV003'.
  SET TITLEBAR 'IDEL'.
ENDIF.
ENDMODULE.

MODULE pai_9001 INPUT.
CASE sy-ucomm.
  WHEN 'SAVE' or ' '.
    IF sy-tcode = 'ZFV002'.
      PERFORM modificar_cliente.
    ENDIF.
    IF sy-tcode = 'ZFV003'.
      PERFORM excluir_cliente.
    ENDIF.
  WHEN 'BACK'.
    LEAVE TO SCREEN 0.
  WHEN OTHERS.
ENDCASE.
ENDMODULE.
