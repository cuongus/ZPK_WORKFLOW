@EndUserText.label: 'Department'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_GET_RQ_DEPART'
@Search.searchable: true
@ObjectModel.dataCategory: #VALUE_HELP
define custom entity ZC_rq_Department
{
  @Search.defaultSearchElement: true
  @ObjectModel.text.element: ['rqdepartname']
  key rqdepart    : zde_rq_depart;
    @Search.defaultSearchElement: true
  rqdepartname    : zde_rq_depart_name;

}
