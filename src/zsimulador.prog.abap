REPORT zsimulador.

 INCLUDE zsimulador_top.

SELECTION-SCREEN BEGIN OF BLOCK main WITH FRAME.
PARAMETERS val_empr(16) TYPE p DECIMALS 2.
PARAMETERS tx_empr(16) TYPE p DECIMALS 2.
PARAMETERS prazo TYPE int4.
PARAMETERS p_parc TYPE datum.
SELECTION-SCREEN END OF BLOCK main.

START-OF-SELECTION.

  DATA: ld_amortizacao(16) TYPE p DECIMALS 2.
  DATA: ld_juros_mensais(16) TYPE p DECIMALS 2.
  DATA: ld_prestacao(16) TYPE p DECIMALS 2.
  DATA: ld_saldo_devedor(16) TYPE p DECIMALS 2.
  DATA: ld_date TYPE P0001-BEGDA.

 ld_date = p_parc.


  IF val_empr < 1000.
    MESSAGE: 'Valor mínimo do emprestímo não atingido' TYPE 'S' DISPLAY LIKE 'E'.
  ELSEIF val_empr > 100000.
    MESSAGE: 'Valor do empréstimo superior ao permitido' TYPE 'S' DISPLAY LIKE 'E'.
  ELSEIF tx_empr < 2.
    MESSAGE:'Taxa inferior ao permitido' TYPE 'S' DISPLAY LIKE 'E'.
  ELSEIF tx_empr > 50.
    MESSAGE: 'Taxa superior ao permitido'  TYPE 'S' DISPLAY LIKE 'E'.
  ELSEIF prazo < 3.
    MESSAGE: 'Prazo inferior ao permitido' TYPE 'S' DISPLAY LIKE 'E'.
  ELSEIF prazo > 300.
    MESSAGE: 'Prazo superior ao permitido' TYPE 'S' DISPLAY LIKE 'E'.
  ELSE.
    ld_amortizacao = val_empr / prazo.

  ld_saldo_devedor  = val_empr.

    DO prazo TIMES.
      ld_juros_mensais = ld_saldo_devedor * ( tx_empr / 100 ).
      ld_prestacao = ld_amortizacao + ld_juros_mensais.
      ld_saldo_devedor = ld_saldo_devedor - ld_amortizacao.

      CALL FUNCTION 'RP_CALC_DATE_IN_INTERVAL'
        EXPORTING
          date            = ld_date
          days            = '0'
          months          = '01'
*         SIGNUM          = '+'
          years           = '0'
       IMPORTING
         CALC_DATE       = ld_date.
  ls_simulador-parcela = sy-index.
  ls_simulador-juros_mensais = ld_juros_mensais.
  ls_simulador-amortizacao = ld_amortizacao.
  ls_simulador-date = ld_date.
  ls_simulador-prestacao = ld_prestacao.
  ls_simulador-saldo_devedor = ld_saldo_devedor.
  APPEND ls_simulador TO lt_simulador.
    ENDDO.
  ENDIF.

  PERFORM show_alv.

  INCLUDE zsimulador_frm.
