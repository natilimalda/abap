MODULE pbo_9001 OUTPUT.
  SET PF-STATUS 'S9001'.

  IF sy-tcode = 'ZFV020'.
    SET TITLEBAR 'MOD'.
  ENDIF.

  IF sy-tcode = 'ZFV030'.
    SET TITLEBAR 'DEL'.
  ENDIF.

ENDMODULE.

MODULE pai_9001 INPUT.
  CASE sy-ucomm.
    WHEN 'SAVE' OR ' '.
      IF sy-tcode = 'ZFV020'. .
        PERFORM modificar_material.
      ENDIF.
      IF sy-tcode = 'ZFV030'.
        PERFORM excluir_material.
      ENDIF.
    WHEN 'BACK'.
      LEAVE TO SCREEN 0.
    WHEN OTHERS.
  ENDCASE.
ENDMODULE.
