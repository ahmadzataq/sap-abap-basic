REPORT zdemo_select_scarr.

DATA: ls_scarr TYPE scarr,
      lt_scarr TYPE STANDARD TABLE OF scarr.

START-OF-SELECTION.
  SELECT SINGLE * FROM scarr INTO ls_scarr WHERE carrid = 'LH'.
  IF sy-subrc = 0.
    WRITE: / 'Carrier:', ls_scarr-carrid, ls_scarr-carrname.
  ELSE.
    WRITE: / 'Data not found.'.
  ENDIF.

  SKIP.

  SELECT * FROM scarr INTO TABLE lt_scarr
    UP TO 10 ROWS
    ORDER BY carrid.

  LOOP AT lt_scarr INTO ls_scarr.
    WRITE: / ls_scarr-carrid, ls_scarr-carrname, ls_scarr-currcode.
  ENDLOOP.