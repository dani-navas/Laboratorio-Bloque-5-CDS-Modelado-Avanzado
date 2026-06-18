@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Currency Converted'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZSALES_CONVERTED_dnavas
  as select from /dmo/booking
{
  key customer_id                                            as CustomerId,
      @Semantics.amount.currencyCode: 'OriginalCurrencyCode'
      flight_price                                           as FlightPrice,
      currency_code                                          as OriginalCurrencyCode,

      @Semantics.amount.currencyCode: 'ConvertedCurrencyCode'
      currency_conversion( amount => flight_price,
                           source_currency => currency_code,
                           target_currency => abap.cuky'USD',
                           exchange_rate_date => $session.system_date,
                           ERROR_HANDLING => 'SET_TO_NULL' ) as Flight_Price_USD,
      cast( 'USD' as abap.cuky )                             as ConvertedCurrencyCode


}
