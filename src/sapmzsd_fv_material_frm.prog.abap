FORM incluir_material .
  gd_material-erdat = sy-datum.
  gd_material-erzet = sy-uzeit.

  INSERT zfv_material FROM gd_material.

  IF sy-subrc = 0.
    MESSAGE: 'O Material foi cadastrado coom sucesso' TYPE 'S'.
  ELSE.
    MESSAGE: 'Não foi possível cadastrar o material' TYPE 'S' DISPLAY LIKE 'E'.
  ENDIF.

ENDFORM.

FORM modificar_material.

  SELECT SINGLE * FROM zfv_material INTO gd_material WHERE matnr = ld_material.

  IF sy-subrc <> 0.
    MESSAGE: |O material { ld_material } não existe!| TYPE 'S' DISPLAY LIKE 'E'.
    EXIT.
  ENDIF.

  CALL SCREEN 9000.

ENDFORM.

FORM modificacao_material.
  MODIFY zfv_material FROM gd_material.
  IF sy-subrc = 0.
    MESSAGE: 'Material alterado com sucesso' TYPE 'S'.
  ELSE.
    MESSAGE: 'Não foi possível alterar o material' TYPE 'S' DISPLAY LIKE 'E'.
  ENDIF.

ENDFORM.

FORM excluir_material .

ENDFORM.
