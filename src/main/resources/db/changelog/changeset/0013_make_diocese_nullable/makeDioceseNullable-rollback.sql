-- Rollback Step 1: Re-add the foreign key constraint
ALTER TABLE agency
ADD CONSTRAINT agency_ibfk_1 FOREIGN KEY (diocese_id) REFERENCES diocese(id);

-- Rollback Step 2: Set the diocese_id column back to NOT NULL
ALTER TABLE agency
MODIFY diocese_id INT NOT NULL;