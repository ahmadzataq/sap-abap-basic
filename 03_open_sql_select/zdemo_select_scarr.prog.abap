REPORT zdemo_select_scarr.

DATA: ls_scarr TYPE scarr,
      lt_scarr TYPE STANDARD TABLE OF scarr.

START-OF-SELECTION.
  SELECT SINGLE * FROM scarr INTO ls_scarr WHERE carrid = 'LH'.
  IF sy-subrc = 0.
    WRITE: / 'Maskapai:', ls_scarr-carrid, ls_scarr-carrname.
  ELSE.
    WRITE: / 'Data tidak ditemukan.'.
  ENDIF.

  SKIP.