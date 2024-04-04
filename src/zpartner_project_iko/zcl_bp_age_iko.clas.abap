CLASS zcl_bp_age_iko DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_sadl_exit_calc_element_read .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_bp_age_iko IMPLEMENTATION.


  METHOD if_sadl_exit_calc_element_read~calculate.

    data: lt_bp_head TYPE STANDARD TABLE OF zc_bp_head_iko WITH DEFAULT KEY.

    lt_bp_head = CORRESPONDING #( it_original_data ).

    LOOP AT lt_bp_head ASSIGNING FIELD-SYMBOL(<lfs_bp_head>).
        data(lv_date) = cl_abap_context_info=>get_system_date( ).
        DATA(lv_days) = lv_date - <lfs_bp_head>-Birthdate.
        <lfs_bp_head>-Age = lv_days / 365.
    ENDLOOP.

    ct_calculated_data = CORRESPONDING #( lt_bp_head ).

  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
  ENDMETHOD.
ENDCLASS.
