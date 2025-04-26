@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Incidents'
@Metadata.ignorePropagatedAnnotations: true

/*
    CDS - Incidents (Incidentes)
*/

define root view entity zcds_r_inct_168
  as select from zdt_inct_168
  composition [0..*] of zcds_r_inct_h_168 as _History
  
  association [1..1] to zdt_status_168 as _Status on _Status.status_code = $projection.Status
  association [1..1] to zdt_priority_168 as _Priority on _Priority.priority_code = $projection.Priority

{
        key zdt_inct_168.inc_uuid as IncUUID,
            zdt_inct_168.incident_id as IncidentID,
            zdt_inct_168.title as Title,
            zdt_inct_168.description as Description,
            zdt_inct_168.status as Status,
            zdt_inct_168.priority as Priority,
            zdt_inct_168.creation_date as CreationDate,
            zdt_inct_168.changed_date as ChangedDate,
            zdt_inct_168.local_created_by as LocalCreatedBy,
            zdt_inct_168.local_created_at as LocalCreatedAt,
            zdt_inct_168.local_last_changed_by as LocalLastChangedBy,
            zdt_inct_168.local_last_changed_at as LocalLastChangedAt,
            zdt_inct_168.last_changed_at as LastChangedAt, 
            //Publicando
            _History, 
            _Status, 
            _Priority
  }
