CLASS zcl_patch_express_dnavas DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_patch_express_dnavas IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    SELECT FROM zcds_public_assoc_dnavas AS Travel
          FIELDS travel~AgencyID,
                 travel~TravelID,
                 \_Agency-Name
          WHERE Travel~AgencyID = '070032'
          INTO TABLE @DATA(lt_table)
          UP TO 10 ROWS.

    out->write( lt_table ).

  ENDMETHOD.
ENDCLASS.
