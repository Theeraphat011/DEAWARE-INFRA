-- Create table for attendances in schema dat
CREATE TABLE
	IF NOT EXISTS dat.attendances (
		id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
		employee_id UUID NOT NULL,
		check_in TIMESTAMPTZ NOT NULL,
		check_out TIMESTAMPTZ,
		work_hours DOUBLE PRECISION,
		check_in_device VARCHAR(100),
		check_in_confidence NUMERIC(5, 2),
		check_out_device VARCHAR(100),
		check_out_confidence NUMERIC(5, 2),
		created_at TIMESTAMPTZ DEFAULT now (),
		updated_at TIMESTAMPTZ DEFAULT now (),
		CONSTRAINT fk_attendance_employee FOREIGN KEY (employee_id) REFERENCES dat.employees (user_id) ON DELETE CASCADE
	);

CREATE INDEX IF NOT EXISTS idx_attendances_employee_id ON dat.attendances (employee_id);

-- Create table for mapping attendance images (1 attendance : many images)
CREATE TABLE
	IF NOT EXISTS dat.attendance_images (
		id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
		attendance_id UUID NOT NULL,
		image_url TEXT NOT NULL,
		image_type VARCHAR(20) NOT NULL CHECK (image_type IN ('check_in', 'check_out')),
		captured_at TIMESTAMPTZ,
		CONSTRAINT fk_attendance_image_attendance FOREIGN KEY (attendance_id) REFERENCES dat.attendances (id) ON DELETE CASCADE
	);

CREATE INDEX IF NOT EXISTS idx_attendance_images_attendance_id ON dat.attendance_images (attendance_id);