@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BP documents'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_BP_DOC_IKO as select from zdb_bp_doc_iko
association to parent ZI_BP_HEAD_IKO as _head on $projection.Recordid = _head.Recordid 
{
    
    key recordid as Recordid,
    key doctype as Doctype,
    key docnum as Docnum,
    validfrom as Validfrom,
    validto as Validto,
    countriss as Countriss,
    created_by as CreatedBy,
    created_at as CreatedAt,
    last_changed_by as LastChangedBy,
    last_changed_at as LastChangedAt,
    
    _head
    
}
