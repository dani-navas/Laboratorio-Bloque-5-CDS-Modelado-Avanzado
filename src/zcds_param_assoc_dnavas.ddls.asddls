@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Parameters Assoc.'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_PARAM_ASSOC_dnavas
  with parameters
    p_Carrier_id : abap.char( 3 )
  as select from /dmo/flight as Flight
  association [0..1] to /dmo/carrier as _Carrier on _Carrier.carrier_id = $projection.CarrierID
{

  key Flight.carrier_id    as CarrierID,
  key Flight.connection_id as ConnectionID,
  key Flight.flight_date   as FlightDate,
      _Carrier.name        as CarrierName
}
where
  Flight.carrier_id = $parameters.p_Carrier_id
