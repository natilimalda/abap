FORM consultar .
  SELECT * FROM  zfv_material INTO TABLE gt_material UP TO p_limite ROWS
    WHERE matnr IN s_matnr[]
      AND erdat IN s_erdat[]
      AND erzet IN s_erzet[]
      AND maktx IN s_maktx[]
      AND valor_liquido IN s_vliq[]
      AND imposto_perc IN s_imp[]
      AND peso_bruto IN s_peso[]
      AND vrkme IN s_vrkme
      AND umrez IN s_umrez[]
      AND estoque IN s_est[]
      AND status IN s_sta[].
ENDFORM.                    " CONSULTAR

FORM show_alv .
  DATA: ls_fieldcat TYPE slis_fieldcat_alv.
  DATA: lt_fieldcat TYPE STANDARD TABLE OF slis_fieldcat_alv.

  clear lt_fieldcat.

clear ls_fieldcat.
ls_fieldcat-fieldname = 'MATNR'.
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
ls_fieldcat-fieldname = 'MAKTX'.
ls_fieldcat-seltext_m = 'Título do produto'.
APPEND ls_fieldcat to lt_fieldcat.

clear ls_fieldcat.
ls_fieldcat-fieldname = 'VALOR_LIQUIDO'.
ls_fieldcat-seltext_m = 'Valor Líquido'.
APPEND ls_fieldcat to lt_fieldcat.

clear ls_fieldcat.
ls_fieldcat-fieldname = 'IMPOSTO_PERC'.
ls_fieldcat-seltext_m = 'Percentual de Imposto'.
APPEND ls_fieldcat to lt_fieldcat.

clear ls_fieldcat.
ls_fieldcat-fieldname = 'PESO_BRUTO'.
ls_fieldcat-seltext_m = 'Peso Bruto'.
APPEND ls_fieldcat to lt_fieldcat.

clear ls_fieldcat.
ls_fieldcat-fieldname = 'VRKME'.
ls_fieldcat-seltext_m = 'Unidade de Venda'.
APPEND ls_fieldcat to lt_fieldcat.

clear ls_fieldcat.
ls_fieldcat-fieldname = 'UMREZ'.
ls_fieldcat-seltext_m = 'Quantidade na embalagem'.
APPEND ls_fieldcat to lt_fieldcat.

clear ls_fieldcat.
ls_fieldcat-fieldname = 'ESTOQUE'.
ls_fieldcat-seltext_m = 'Estoque'.
APPEND ls_fieldcat to lt_fieldcat.

clear ls_fieldcat.
ls_fieldcat-fieldname = 'STATUS'.
ls_fieldcat-seltext_m = 'Status'.
APPEND ls_fieldcat to lt_fieldcat.

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
     EXPORTING
        I_CALLBACK_PROGRAM                = sy-repid
        I_GRID_TITLE                      = 'Relatório de Material'
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
        t_outtab                          = gt_material
     EXCEPTIONS
        PROGRAM_ERROR                     = 1
        OTHERS                            = 2.

ENDFORM.                    " SHOW_ALV
