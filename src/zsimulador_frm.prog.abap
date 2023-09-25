FORM show_alv .

DATA: ls_fieldcat TYPE slis_fieldcat_alv.
DATA: lt_fieldcat TYPE STANDARD TABLE OF slis_fieldcat_alv.

clear lt_fieldcat.

clear ls_fieldcat.
ls_fieldcat-fieldname = 'PARCELA'.
ls_fieldcat-seltext_m = 'Parcela'.
APPEND ls_fieldcat to lt_fieldcat.

clear ls_fieldcat.
ls_fieldcat-fieldname = 'DATE'.
ls_fieldcat-seltext_m = 'Data'.
APPEND ls_fieldcat to lt_fieldcat.

clear ls_fieldcat.
ls_fieldcat-fieldname = 'AMORTIZACAO'.
ls_fieldcat-seltext_m = 'Amortização'.
APPEND ls_fieldcat to lt_fieldcat.

clear ls_fieldcat.
ls_fieldcat-fieldname = 'JUROS_MENSAIS'.
ls_fieldcat-seltext_m = 'Juros mensais'.
APPEND ls_fieldcat to lt_fieldcat.

clear ls_fieldcat.
ls_fieldcat-fieldname = 'PRESTACAO'.
ls_fieldcat-seltext_m = 'Prestação'.
APPEND ls_fieldcat to lt_fieldcat.

clear ls_fieldcat.
ls_fieldcat-fieldname = 'SALDO_DEVEDOR'.
ls_fieldcat-seltext_m = 'Saldo devedor'.
APPEND ls_fieldcat to lt_fieldcat.

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
     EXPORTING
        I_CALLBACK_PROGRAM                = sy-repid
        I_GRID_TITLE                      = 'Simulador de empréstimo'
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
        t_outtab                          = lt_simulador
     EXCEPTIONS
        PROGRAM_ERROR                     = 1
        OTHERS                            = 2.

ENDFORM.                    " SHOW_ALV
