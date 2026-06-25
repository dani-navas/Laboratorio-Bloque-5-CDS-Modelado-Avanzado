@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Customer Root'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZCDS_CUSTOMER_ROOT_dnavas
  as select from /dmo/customer as Customer
  composition [1..1] of ZCDS_CUST_BOOK_dnavas as _Booking 
  association [0..*] to /dmo/airport as _Airport on _Airport.city = $projection.City
{
  key Customer.customer_id as CustomerId,
      Customer.first_name  as FirstName,
      Customer.last_name   as LastName,
      Customer.city        as City,
      _Booking,
      _Airport
}
