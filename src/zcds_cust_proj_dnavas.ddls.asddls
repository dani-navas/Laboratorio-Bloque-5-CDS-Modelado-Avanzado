@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Cust Proj'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZCDS_CUST_PROJ_DNAVAS
  provider contract transactional_interface
  as projection on ZCDS_CUSTOMER_ROOT_dnavas

{
  key CustomerId,
      FirstName,
      LastName,
      City,
      /* Associations */
      _Airport,
      _Booking: redirected to composition child ZCDS_CHILD_PROJ_dnavas
}
