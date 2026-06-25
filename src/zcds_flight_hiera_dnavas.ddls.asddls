@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Flight Hiera'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_FLIGHT_HIERA_dnavas
  as select from /dmo/travel
  association [1..1] to ZCDS_FLIGHT_HIERA_dnavas as _Agency on _Agency.AgencyId = $projection.CustomerId
{
  key agency_id   as AgencyId,
      customer_id as CustomerId,
      _Agency
}
