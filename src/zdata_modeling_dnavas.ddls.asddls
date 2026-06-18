@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Modeling'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZDATA_MODELING_dnavas
  as select from /dmo/customer
{
  key customer_id                      as CustomerId,
      cast( customer_id as abap.int8 ) as Customer_Id_User,
      first_name                       as FirstName,
      last_name                        as LastName, 
      $session.system_date             as SystemDate,
      $session.client                  as ClientID, 
      country_code                     as CountryCode,

      case country_code
      when 'US' then 'United State'
      when 'DE' then 'Germany'
      else 'Other Country'
      end                              as CountryDes
}
