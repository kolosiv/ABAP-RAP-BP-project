@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS cons Business partner HEAD IKO'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZC_BP_HEAD_IKO 
    as projection on ZI_BP_HEAD_IKO as BPartners
{
    key Recordid,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    Firstname,
    Lastname,
    Middlename,
    Birthdate,
    Marrstat,
    @ObjectModel.text.element: [ 'gendtxt' ]
    Gender,
    Prevfamylyflag,
    Prevfamyly,
    Education,
    Natio,
    Emplcategory,
    Army,
    Residenct,
    Idnum,
    Status,
    
    @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_BP_AGE_IKO'
    @EndUserText.label: 'Age'
    virtual Age : abap.int2,
    
    _gender.text as gendtxt,
    _doc : redirected to composition child ZC_BP_DOC_IKO
}
