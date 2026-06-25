@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Child Proj'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_CHILD_PROJ_dnavas
  as projection on ZCDS_CUST_BOOK_dnavas
{
  key CustomerID,
      TravelID,
      BookingID,
      /* Associations */
      _Customer: redirected to parent ZCDS_CUST_PROJ_DNAVAS
      
}
