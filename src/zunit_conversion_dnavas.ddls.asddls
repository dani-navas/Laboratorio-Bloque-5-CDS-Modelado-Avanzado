@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Quantity Converted'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZUNIT_CONVERSION_dnavas
  as select from /dmo/fsa_root_a
{
  key id                                                 as Id,
      string_property                                    as StringProperty,
      @Semantics.quantity.unitOfMeasure: 'Uom'
      field_with_quantity                                as FieldWithQuantity,
      uom                                                as Uom,

      @Semantics.quantity.unitOfMeasure: 'ConvertedUnit'
      unit_conversion( quantity => field_with_quantity,
                       source_unit => abap.unit'A',
                       target_unit => abap.unit'W',
                       ERROR_HANDLING => 'SET_TO_NULL' ) as ConvertedQty,
      cast( 'W' as abap.unit)                            as ConvertedUnit
}
