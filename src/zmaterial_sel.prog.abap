SELECTION-SCREEN BEGIN OF BLOCK main WITH FRAME.
SELECT-OPTIONS s_matnr FOR gs_material-matnr.
SELECT-OPTIONS s_erdat FOR gs_material-erdat.
SELECT-OPTIONS s_erzet FOR gs_material-erzet.
SELECT-OPTIONS s_maktx FOR gs_material-maktx.
SELECT-OPTIONS s_vliq FOR gs_material-valor_liquido.
SELECT-OPTIONS s_imp FOR gs_material-imposto_perc.
SELECT-OPTIONS s_peso FOR gs_material-peso_bruto.
SELECT-OPTIONS s_vrkme FOR gs_material-vrkme.
SELECT-OPTIONS s_umrez FOR gs_material-umrez.
SELECT-OPTIONS s_est FOR gs_material-estoque.
SELECT-OPTIONS s_sta FOR gs_material-status.
PARAMETERS p_limite TYPE int4.
SELECTION-SCREEN END OF BLOCK main.
