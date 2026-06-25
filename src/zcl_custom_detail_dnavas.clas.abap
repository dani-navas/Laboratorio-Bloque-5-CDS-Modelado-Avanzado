CLASS zcl_custom_detail_dnavas DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_rap_query_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_custom_detail_dnavas IMPLEMENTATION.
  METHOD if_rap_query_provider~select.

    DATA li_result TYPE STANDARD TABLE OF ZCDS_CUSTOM_DETAIL_dnavas.

    IF io_request->is_data_requested( ).
      DATA(l_offset) = io_request->get_paging( )->get_offset( ).
      DATA(l_size) = io_request->get_paging( )->get_page_size( ).

      SELECT  FROM /dmo/customer as CustomerDetail
      FIELDS CustomerDetail~customer_id,
             CustomerDetail~phone_number,
             CustomerDetail~email_address
      ORDER BY customer_id
      INTO TABLE @li_result
      OFFSET @l_offset
      UP TO @l_size ROWS.
      IF sy-subrc = 0.
        TRY.
            io_response->set_data( it_data = li_result ).
          CATCH cx_rap_query_response_set_twic  INTO DATA(l_excepcion).
        ENDTRY.
      ENDIF.
    ENDIF.
  ENDMETHOD.
ENDCLASS.

