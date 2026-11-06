REPORT zdemo_hello.

DATA: name TYPE string VALUE 'Zahid',
      year TYPE i      VALUE 2026.

START-OF-SELECTION.
  WRITE / 'Hello, SAP ABAP!'.
  WRITE: / 'Nama  :', name.
  WRITE: / 'Tahun :', year.
