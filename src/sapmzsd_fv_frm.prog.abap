FORM criar_cliente. "CRIAR CLIENTE"

  ls_clientes-erdat = sy-datum.
  ls_clientes-erzet = sy-uzeit.

  INSERT zfv_cliente FROM ls_clientes.

  IF sy-subrc = 0.
    MESSAGE: 'O cliente foi cadastrado coom sucesso' TYPE 'S'.
  ELSE.
    MESSAGE: 'Não foi possível cadastrar o cliente' TYPE 'S' DISPLAY LIKE 'E'.
  ENDIF.

ENDFORM.

FORM modificar_cliente.

  SELECT SINGLE * FROM zfv_cliente INTO ls_clientes WHERE kunnr = ld_id.

  IF sy-subrc <> 0.
    MESSAGE: |O cliente { ld_id } não existe!| TYPE 'S' DISPLAY LIKE 'E'.
    EXIT.
  ENDIF.

  CALL SCREEN 9000.
ENDFORM.

FORM modificacao_cliente. "MODIFICAR CLIENTE"

  MODIFY zfv_cliente FROM ls_clientes.
  IF sy-subrc = 0.
    MESSAGE: 'Cliente alterado com sucesso' TYPE 'S'.
  ELSE.
    MESSAGE: 'Não foi possível alterar o cliente' TYPE 'S' DISPLAY LIKE 'E'.
  ENDIF.

ENDFORM.
FORM excluir_cliente .

  SELECT SINGLE * FROM zfv_cliente INTO ls_clientes WHERE kunnr = ld_id.

  IF sy-subrc <> 0.
    MESSAGE: |O cliente { ld_id } não existe!| TYPE 'S' DISPLAY LIKE 'E'.
    EXIT.
  ENDIF.

  DELETE FROM zfv_cliente WHERE kunnr = ld_id.

  IF sy-subrc = 0.
    MESSAGE: 'O cliente foi excluido com sucesso' TYPE 'S'.
  ELSE.
    MESSAGE: 'Não foi possível excluir o cliente' TYPE 'E' DISPLAY LIKE 'E'.
  ENDIF.

ENDFORM.
