REPORT zdemo_internal_table.

TYPES: BEGIN OF ty_student,
         id    TYPE i,
         name  TYPE string,
         score TYPE i,
       END OF ty_student.

DATA: lt_students TYPE STANDARD TABLE OF ty_student,
      ls_student  TYPE ty_student.

START-OF-SELECTION.
  ls_student-id = 1. ls_student-name = 'Andi'. ls_student-score = 85.
  APPEND ls_student TO lt_students.
  ls_student-id = 2. ls_student-name = 'Budi'. ls_student-score = 70.
  APPEND ls_student TO lt_students.
  ls_student-id = 3. ls_student-name = 'Citra'. ls_student-score = 92.
  APPEND ls_student TO lt_students.

  SORT lt_students BY score DESCENDING.

  WRITE: / 'Students score list:'.
  LOOP AT lt_students INTO ls_student.
    WRITE: / ls_student-id, ls_student-name, ls_student-score.
  ENDLOOP.

  READ TABLE lt_students INTO ls_student WITH KEY name = 'Budi'.
  IF sy-subrc = 0.
    WRITE: / 'Found:', ls_student-name, 'score', ls_student-score.
  ENDIF.

  DELETE lt_students WHERE score < 75.
  WRITE: / 'Total data after delete:', lines( lt_students ).