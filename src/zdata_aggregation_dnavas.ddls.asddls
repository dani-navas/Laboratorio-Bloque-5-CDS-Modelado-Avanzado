@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Aggregation'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZDATA_AGGREGATION_dnavas
  as select from /dmo/booking
{
  @Semantics.amount.currencyCode: 'CurrencyCode'
  sum( distinct flight_price  ) as FlightPrice,
  currency_code                 as CurrencyCode
} group by currency_code;
