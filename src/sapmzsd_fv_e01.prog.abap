MODULE pbo_9000 OUTPUT.
  SET PF-STATUS 'S9000'.
    IF sy-tcode = 'ZFV001'.
  SET TITLEBAR 'CREAT'.
ENDIF.
    IF sy-tcode = 'ZFV002'.
  SET TITLEBAR 'MODIF'.
ENDIF.
ENDMODULE.

MODULE pai_9000 INPUT.
  CASE sy-ucomm.
    WHEN 'SAVE'.
      IF sy-tcode = 'ZFV001'.
      PERFORM criar_cliente.
      ENDIF.
      IF sy-tcode = 'ZFV002'.
      PERFORM modificacao_cliente.
      ENDIF.
    WHEN 'BACK'.
      LEAVE TO SCREEN 0.
    WHEN OTHERS.
  ENDCASE.

ENDMODULE.
