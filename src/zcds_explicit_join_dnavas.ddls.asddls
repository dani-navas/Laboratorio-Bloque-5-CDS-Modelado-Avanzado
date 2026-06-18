@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Explicit Join'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_EXPLICIT_JOIN_dnavas
  as select from /dmo/customer as Customer
  association [0..*] to ZCDS_Booking_dnavas as _Booking on _Booking.CustomerId = Customer.customer_id
{
  key Customer.customer_id        as CustomerId,
      Customer.first_name         as FirstName,
      Customer.last_name          as LastName,
      _Booking[inner].BookingDate as BookingDate
}
