FORM criar_cliente. "CRIAR CLIENTE"

ls_clientes-erdat = sy-datum.
ls_clientes-erzet = sy-uzeit.

INSERT ZFV_CLIENTE from ls_clientes.

IF sy-subrc = 0.
  MESSAGE: 'O cliente foi cadastrado coom sucesso' TYPE 'S'.
  ELSE.
  MESSAGE: 'Não foi possível cadastrar o cliente' TYPE 'S' DISPLAY LIKE 'E'.
ENDIF.

ENDFORM.
