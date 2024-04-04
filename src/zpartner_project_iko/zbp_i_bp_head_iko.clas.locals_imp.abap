CLASS lhc_ZI_BP_HEAD_IKO DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_bp_head_iko RESULT result.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR zi_bp_head_iko RESULT result.

    METHODS setonservice FOR MODIFY
      IMPORTING keys FOR ACTION zi_bp_head_iko~setonservice RESULT result.
    METHODS checkempty FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_bp_head_iko~checkempty.
    METHODS detchangedata FOR DETERMINE ON SAVE
      IMPORTING keys FOR zi_bp_head_iko~detchangedata.

ENDCLASS.

CLASS lhc_ZI_BP_HEAD_IKO IMPLEMENTATION.

  METHOD get_instance_authorizations.

  ENDMETHOD.

  METHOD get_instance_features.

    READ ENTITIES OF zi_bp_head_iko IN LOCAL MODE
        ENTITY zi_bp_head_iko
        FIELDS ( Status ) WITH CORRESPONDING #( keys )
        RESULT DATA(lt_bp_head).

    result = VALUE #( FOR ls_bp_head IN lt_bp_head
                        LET statact = COND #( WHEN ls_bp_head-Status EQ '1'
                            THEN if_abap_behv=>fc-o-disabled
                            ELSE if_abap_behv=>fc-o-enabled ) IN ( %tky = ls_bp_head-%tky
                                                                   %action-setonservice = statact ) ).

  ENDMETHOD.

  METHOD setonservice.

    MODIFY ENTITIES OF zi_bp_head_iko IN LOCAL MODE
        ENTITY zi_bp_head_iko
        UPDATE FIELDS ( Status )
        WITH VALUE #( FOR key IN keys ( %tky = key-%tky Status = '1' ) ).

    READ ENTITIES OF zi_bp_head_iko IN LOCAL MODE
        ENTITY zi_bp_head_iko
        ALL FIELDS WITH CORRESPONDING #( keys )
        RESULT DATA(lt_bp_head).

    result = VALUE #( FOR ls_bp_head IN lt_bp_head ( recordid = ls_bp_head-recordid %param = ls_bp_head ) ).

  ENDMETHOD.

  METHOD checkempty.

    READ ENTITIES OF zi_bp_head_iko IN LOCAL MODE
        ENTITY zi_bp_head_iko
        ALL FIELDS WITH CORRESPONDING #( keys )
        RESULT DATA(lt_bp_head).

    LOOP AT lt_bp_head INTO DATA(ls_bp_head).
        IF ls_bp_head-Birthdate IS INITIAL OR ls_bp_head-Firstname IS INITIAL OR ls_bp_head-Idnum IS INITIAL OR ls_bp_head-Gender IS INITIAL.
            APPEND VALUE #( %tky = ls_bp_head-%tky ) To failed-zi_bp_head_iko.
            APPEND VALUE #( %tky = keys[ 1 ]-%tky
                            %msg = new_message_with_text(
                                severity = if_abap_behv_message=>severity-error
                                text = 'Fill all mandotory field' ) ) to reported-zi_bp_head_iko.
        ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD detchangedata.

    READ ENTITIES OF zi_bp_head_iko IN LOCAL MODE
        ENTITY zi_bp_head_iko
        FIELDS ( LastChangedBy ) WITH CORRESPONDING #( keys )
        RESULT DATA(lt_bp_head).

    LOOP AT lt_bp_head INTO DATA(ls_bp_head).
        IF ls_bp_head-LastChangedBy IS INITIAL.
            MODIFY ENTITIES OF zi_bp_head_iko IN LOCAL MODE
                ENTITY zi_bp_head_iko
                UPDATE
                FIELDS ( LastChangedBy ) WITH VALUE #( ( %tky = ls_bp_head-%tky
                                                         LastChangedBy = cl_abap_context_info=>get_user_technical_name(  ) ) ).
        ENDIF.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
