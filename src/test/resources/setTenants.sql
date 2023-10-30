update AGENCY set TENANT_ID = '1';
update AGENCY_POSTCODE_RANGE set TENANT_ID = '1';

update AGENCY set TENANT_ID = '2' where ID = '1734';
update AGENCY_POSTCODE_RANGE set TENANT_ID = '2' where ID = '14351';
