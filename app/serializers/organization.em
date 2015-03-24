class OrganizationSerializer extends DS.ActiveModelSerializer with DS.EmbeddedRecordsMixin
  attrs:
    employees: { embedded: 'always' }

`export default OrganizationSerializer`