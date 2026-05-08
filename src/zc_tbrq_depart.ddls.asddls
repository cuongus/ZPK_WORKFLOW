@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZTBRQ_DEPART'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_TBRQ_DEPART
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_TBRQ_DEPART
  association [1..1] to ZR_TBRQ_DEPART as _BaseEntity on $projection.RQDEPART = _BaseEntity.RQDEPART
{
  key Rqdepart,
  Rqdepartname,
  @Semantics: {
    User.Createdby: true
  }
  CreatedBy,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  CreatedAt,
  @Semantics: {
    User.Localinstancelastchangedby: true
  }
  LastChangedBy,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LastChangedAt,
  _BaseEntity
}
