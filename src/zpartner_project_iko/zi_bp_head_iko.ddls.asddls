@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Business partner IKO'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_BP_HEAD_IKO
  as select from zdb_bp_head_iko
  association [0..1] to ZI_GENDER_IKO as _gender on $projection.Gender = _gender.value_low
  composition [0..*] of ZI_BP_DOC_IKO as _doc 
{
  key recordid        as Recordid,
      created_by      as CreatedBy,
      created_at      as CreatedAt,
      last_changed_by as LastChangedBy,
      last_changed_at as LastChangedAt,
      firstname       as Firstname,
      lastname        as Lastname,
      middlename      as Middlename,
      birthdate       as Birthdate,
      marrstat        as Marrstat,
      gender          as Gender,
      prevfamylyflag  as Prevfamylyflag,
      prevfamyly      as Prevfamyly,
      education       as Education,
      natio           as Natio,
      emplcategory    as Emplcategory,
      army            as Army,
      residenct       as Residenct,
      idnum           as Idnum,
      status          as Status,
      
      _gender,
      _gender.text,
      _doc
      
}
