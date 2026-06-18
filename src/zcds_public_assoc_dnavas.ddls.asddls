@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Public Assoc.'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_PUBLIC_ASSOC_DNAVAS
  as select from /dmo/travel as Travel
  association [1..1] to ZCDS_AGENCY_MAX_dnavas as _Agency on _Agency.AgencyId = $projection.AgencyID
{
  key Travel.travel_id as TravelID,
      Travel.agency_id as AgencyID,
      _Agency

}
