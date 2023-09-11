SELECTION-SCREEN begin of BLOCK main WITH FRAME.
  SELECT-OPTIONS s_zkunn for gs_cliente-kunnr.
  SELECT-OPTIONS s_zerdat for gs_cliente-erdat.
  SELECT-OPTIONS s_zerzet for gs_cliente-erzet.
  SELECT-OPTIONS s_nome for gs_cliente-nome.
  SELECT-OPTIONS s_email for gs_cliente-email.
  SELECT-OPTIONS s_lcred for gs_cliente-lim_cred.
  SELECT-OPTIONS s_status for gs_cliente-status.
  PARAMETERS p_limite TYPE int4.
SELECTION-SCREEN end of BLOCK main.
