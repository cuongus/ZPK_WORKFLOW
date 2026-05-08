CLASS zcl_get_rq_depart DEFINITION
   PUBLIC
  INHERITING FROM cx_rap_query_provider
*  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_rap_query_provider .


  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS ZCL_GET_RQ_DEPART IMPLEMENTATION.


  METHOD if_rap_query_provider~select.
    DATA business_data TYPE TABLE OF zc_rq_department .

    DATA business_data_line TYPE zc_rq_department .

    DATA(top)     = io_request->get_paging( )->get_page_size( ).
    DATA(skip)    = io_request->get_paging( )->get_offset( ).

    DATA(requested_fields)  = io_request->get_requested_elements( ).

    DATA(sort_order)    = io_request->get_sort_elements( ).
*    DATA(ls_filter)    = io_request->get_filter( ).


    TRY.

        DATA(filter_condition_string) = io_request->get_filter( )->get_as_sql_string( ).
*        DATA(filter_condition_ranges) = io_request->get_filter( )->get_as_ranges(  ).

*        READ TABLE filter_condition_ranges WITH KEY name = 'RQDEPART'
*                     INTO DATA(ls_rqdepart).

        SELECT * FROM ztb_rq_depart
            WHERE (filter_condition_string)
*            rqdepart IN @ls_rqdepart-range
            INTO  CORRESPONDING FIELDS OF TABLE @business_data.
        IF top IS NOT INITIAL.
          DATA(max_index) = top + skip.
        ELSE.
          max_index = 0.
        ENDIF.

        io_response->set_total_number_of_records( lines( business_data ) ).
        io_response->set_data( business_data ).

      CATCH cx_root INTO DATA(exception).
        DATA(exception_message) = cl_message_helper=>get_latest_t100_exception( exception )->if_message~get_longtext( ).

        DATA(exception_t100_key) = cl_message_helper=>get_latest_t100_exception( exception )->t100key.

        "do some exception handling

    ENDTRY.
  ENDMETHOD.
ENDCLASS.
