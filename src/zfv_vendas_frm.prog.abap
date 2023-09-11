FORM consultar .
  SELECT * FROM zfv_cliente INTO TABLE gt_cliente UP TO p_limite ROWS
  WHERE kunnr      in s_zkunn[]
      AND erdat    in s_zerdat[]
      AND erzet    in s_zerzet[]
      AND nome     in s_nome[]
      AND email    in s_email[]
      AND lim_cred in s_lcred[]
      AND status   in s_status[].
ENDFORM.

FORM show_alv .
data: ls_fieldcat TYPE slis_fieldcat_alv.
data: lt_fieldcat TYPE STANDARD TABLE OF slis_fieldcat_alv.

clear lt_fieldcat.

clear ls_fieldcat.
ls_fieldcat-fieldname = 'KUNNR'.
ls_fieldcat-seltext_m = 'Cód. Cliente'.
APPEND ls_fieldcat to lt_fieldcat.

clear ls_fieldcat.
ls_fieldcat-fieldname = 'ERDAT'.
ls_fieldcat-seltext_m = 'Data de Criação'.
APPEND ls_fieldcat to lt_fieldcat.

clear ls_fieldcat.
ls_fieldcat-fieldname = 'ERZET'.
ls_fieldcat-seltext_m = 'Hora de Criação'.
APPEND ls_fieldcat to lt_fieldcat.

clear ls_fieldcat.
ls_fieldcat-fieldname = 'NOME'.
ls_fieldcat-seltext_m = 'Nome'.
APPEND ls_fieldcat to lt_fieldcat.

clear ls_fieldcat.
ls_fieldcat-fieldname = 'LIM_CRED'.
ls_fieldcat-seltext_m = 'Limite de Crédito'.
APPEND ls_fieldcat to lt_fieldcat.

clear ls_fieldcat.
ls_fieldcat-fieldname = 'STATUS'.
ls_fieldcat-seltext_m = 'Status'.
APPEND ls_fieldcat to lt_fieldcat.

    CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
     EXPORTING
        I_CALLBACK_PROGRAM                = sy-repid
        I_GRID_TITLE                      = 'Relatório de Clientes'
        IT_FIELDCAT                       = lt_fieldcat
        I_SAVE                            = 'X'
*       IS_VARIANT                        =
*       IT_EVENTS                         =
*       IT_EVENT_EXIT                     =
*       IS_PRINT                          =
*       IS_REPREP_ID                      =
*       I_SCREEN_START_COLUMN             = 0
*       I_SCREEN_START_LINE               = 0
*       I_SCREEN_END_COLUMN               = 0
*       I_SCREEN_END_LINE                 = 0
*       I_HTML_HEIGHT_TOP                 = 0
*       I_HTML_HEIGHT_END                 = 0
*       IT_ALV_GRAPHICS                   =
*       IT_HYPERLINK                      =
*       IT_ADD_FIELDCAT                   =
*       IT_EXCEPT_QINFO                   =
*       IR_SALV_FULLSCREEN_ADAPTER        =
*     IMPORTING
*       E_EXIT_CAUSED_BY_CALLER           =
*       ES_EXIT_CAUSED_BY_USER            =
      TABLES
        t_outtab                          = gt_cliente
     EXCEPTIONS
        PROGRAM_ERROR                     = 1
        OTHERS                            = 2.
ENDFORM.
