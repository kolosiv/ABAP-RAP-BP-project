@EndUserText.label: 'projection BP DOC'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_BP_DOC_IKO
  as projection on ZI_BP_DOC_IKO
{
  key Recordid,
  key Doctype,
  key Docnum,
      Validfrom,
      Validto,
      Countriss,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      /* Associations */
      _head : redirected to parent ZC_BP_HEAD_IKO
}
