@AccessControl.authorizationCheck: #NOT_REQUIRED
define hierarchy ZCDS_MOD_FLIGHT_HIER_dnavas
  as parent child hierarchy(
    source ZCDS_FLIGHT_HIERA_dnavas
    child to parent association _Agency
    start where
      AgencyId is initial
    siblings order by
      AgencyId
    multiple parents allowed
    orphans ignore
    cycles breakup
  )
{
  key AgencyId,
      CustomerId,
      $node.parent_id             as ParentID,
      $node.node_id               as NodeID,
      $node.hierarchy_tree_size   as HTREESIZE,
      $node.hierarchy_rank        as HRANK,
      $node.hierarchy_parent_rank as HPARENTRANK,
      $node.hierarchy_level       as HLEVEL,
      $node.hierarchy_is_orphan   as HOPRHAN,
      $node.hierarchy_is_cycle    as HCYCLE
} 
