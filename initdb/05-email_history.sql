-- Create table for tracking email sending history per employee
CREATE TABLE
    IF NOT EXISTS dat.email_history (
        id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
        employee_id UUID NOT NULL,
        email_type VARCHAR(100) NOT NULL,
        recipient_email VARCHAR(255) NOT NULL,
        subject TEXT,
        status VARCHAR(20) NOT NULL DEFAULT 'sent' CHECK (status IN ('sent', 'failed', 'pending')),
        error_message TEXT,
        sent_at TIMESTAMPTZ DEFAULT now (),
        created_at TIMESTAMPTZ DEFAULT now (),
        CONSTRAINT fk_email_history_employee FOREIGN KEY (employee_id) REFERENCES dat.employees (user_id) ON DELETE CASCADE
    );

CREATE INDEX IF NOT EXISTS idx_email_history_employee_id ON dat.email_history (employee_id);

CREATE INDEX IF NOT EXISTS idx_email_history_sent_at ON dat.email_history (sent_at);

-- View: total email count per employee
CREATE
OR REPLACE VIEW dat.v_employee_email_count AS
SELECT
    e.user_id AS employee_id,
    e.email,
    e.display_name,
    COUNT(eh.id) AS total_emails_sent,
    COUNT(eh.id) FILTER (
        WHERE
            eh.status = 'sent'
    ) AS successful_emails,
    COUNT(eh.id) FILTER (
        WHERE
            eh.status = 'failed'
    ) AS failed_emails,
    MAX(eh.sent_at) AS last_sent_at
FROM
    dat.employees e
    LEFT JOIN dat.email_history eh ON e.user_id = eh.employee_id
GROUP BY
    e.user_id,
    e.email,
    e.display_name;