@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZTBRQ_DEPART'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_TBRQ_DEPART
  as select from ZTB_RQ_DEPART
{
  key rqdepart as Rqdepart,
  rqdepartname as Rqdepartname,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  last_changed_at as LastChangedAt
}
