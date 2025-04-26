@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS History'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

/*
    CDS - History (Incidentes Históricos)
*/

define view entity zcds_r_inct_h_168
  as select from zdt_inct_h_168
  association to parent zcds_r_inct_168 as _Incidents on _Incidents.IncUUID = $projection.IncUUID
    
  association [1..1] to zdt_status_168 as _Status on _Status.status_code = $projection.NewStatus
  association [1..1] to zdt_status_168 as _Status1 on _Status1.status_code = $projection.PreviousStatus

{
        key zdt_inct_h_168.his_uuid as HisUUID,
        zdt_inct_h_168.inc_uuid as IncUUID,
        zdt_inct_h_168.his_id as HisID,
        zdt_inct_h_168.previous_status as PreviousStatus,
        zdt_inct_h_168.new_status as NewStatus,
        zdt_inct_h_168.text as Text,
        zdt_inct_h_168.local_created_by as LocalCreatedBy,
        zdt_inct_h_168.local_created_at as LocalCreatedAt,
        zdt_inct_h_168.local_last_changed_by as LocalLastChangedBy,
        zdt_inct_h_168.local_last_changed_at as LocalLastChangedAt,
        zdt_inct_h_168.last_changed_at as LastChangedAt, 
        //Publicación
        _Incidents, 
        _Status, 
        _Status1
  }
