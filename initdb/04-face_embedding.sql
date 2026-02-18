-- Create table for face embeddings in schema dat
CREATE TABLE
	IF NOT EXISTS dat.face_embeddings (
		id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
		employee_id UUID NOT NULL,
		embedding vector (512),
		model_name TEXT,
		model_version TEXT,
		dimension INTEGER,
		created_at TIMESTAMPTZ DEFAULT now (),
		CONSTRAINT fk_face_embedding_employee FOREIGN KEY (employee_id) REFERENCES dat.employees (user_id) ON DELETE CASCADE
	);

CREATE INDEX IF NOT EXISTS idx_face_embeddings_employee_id ON dat.face_embeddings (employee_id);