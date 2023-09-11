REPORT znati_teste.

START-OF-SELECTION.

*START-OF-SELECTION.
*zcl_smartforms_utils=>print(
*EXPORTING
*id_label = 'ZSF_HELLOWORLD'
*is_data = ls_data
*).
*zcl_smartforms_utils=>preview(
*EXPORTING
*id_label = 'ZSF_HELLOWORLD'
*is_data = ls_data
*).
*zcl_smartforms_utils=>export_to_server(
*EXPORTING
*id_label = 'ZSF_HELLOWORLD'
*id_filename = '/tmp/file.pdf'
*is_data = ls_data
*).
zcl_smartforms_utils=>export_to_client(
EXPORTING
id_label = 'ZSF_HELLOWORLD'
id_filename = 'C:\teste\file.pdf'
"is_data = ls_data
).
