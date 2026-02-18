-- Create table for employees in schema dat
CREATE TABLE
	IF NOT EXISTS dat.employees (
		user_id UUID PRIMARY KEY,
		email VARCHAR(255),
		display_name VARCHAR(255),
		phone_number VARCHAR(50),
		position VARCHAR(100),
		url_image TEXT,
		created_at TIMESTAMPTZ DEFAULT now (),
		updated_at TIMESTAMPTZ DEFAULT now ()
	);

CREATE INDEX IF NOT EXISTS idx_employees_email ON dat.employees (email);