@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Cust Book'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_CUST_BOOK_dnavas
  as select from /dmo/booking as Booking
  association to parent ZCDS_CUSTOMER_ROOT_dnavas as _Customer on _Customer.CustomerId = $projection.CustomerID

{
  key _Customer.CustomerId as CustomerID,
      travel_id            as TravelID,
      booking_id           as BookingID,
      _Customer

}
