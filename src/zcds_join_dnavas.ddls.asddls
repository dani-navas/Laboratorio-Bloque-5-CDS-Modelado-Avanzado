@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Joins'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_JOIN_dnavas
  as select from /dmo/booking as Booking
    inner join   /dmo/flight  as Flight on Flight.carrier_id = Booking.carrier_id
{

  key Booking.booking_id   as BookingID,
      Flight.flight_date   as FlightDate,
      @Semantics.amount.currencyCode: 'CurrecnyCode'
      Flight.price         as Price,
      Flight.currency_code as CurrecnyCode

}
