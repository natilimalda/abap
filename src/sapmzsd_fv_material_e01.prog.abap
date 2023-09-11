MODULE pbo_9000 OUTPUT.
  SET PF-STATUS 'S9000'.

  IF sy-tcode = 'ZFV010'.
    SET TITLEBAR 'CREAT'.
  ENDIF.
  IF sy-tcode = 'ZFV020'.
    SET TITLEBAR 'MODIF'.
  ENDIF.

ENDMODULE.

MODULE pai_9000 INPUT.
  CASE sy-ucomm.
    WHEN 'BACK'.
      LEAVE TO SCREEN 0.
    WHEN 'SAVE'.
      IF sy-tcode = 'ZFV010'.
        PERFORM incluir_material.
      ENDIF.
      IF sy-tcode = 'ZFV020'.
        PERFORM modificacao_material.
      ENDIF.

    WHEN OTHERS.
  ENDCASE.
ENDMODULE.
