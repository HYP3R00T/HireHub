-- Create the Company table
CREATE TABLE Company (
    company_id INTEGER PRIMARY KEY AUTOINCREMENT,
    company_name VARCHAR(255) NOT NULL,
    website_url VARCHAR(255),
    contact_email VARCHAR(255),
    address TEXT,
    industry VARCHAR(255),
    phone_number VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Company (
    company_id INTEGER PRIMARY KEY AUTOINCREMENT,
    company_name TEXT NOT NULL,
    website_url TEXT,
    contact_email TEXT,
    address TEXT,
    industry TEXT,
    phone_number TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the Platform table
CREATE TABLE Platform (
    platform_id INTEGER PRIMARY KEY AUTOINCREMENT,
    platform_name VARCHAR(255) NOT NULL,
    website_url VARCHAR(255),
    description TEXT,
    contact_email VARCHAR(255),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the Application table
CREATE TABLE Application (
    application_id INTEGER PRIMARY KEY AUTOINCREMENT,
    company_id INTEGER NOT NULL,
    platform_id INTEGER NOT NULL,
    position VARCHAR(255) NOT NULL,
    applied_date DATE NOT NULL,
    email_used VARCHAR(255),
    resume_used VARCHAR(255),
    reply_status VARCHAR(50),
    offer_letter_status VARCHAR(50),
    notes TEXT,
    follow_up_date DATE,
    interview_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (company_id) REFERENCES Company(company_id) ON DELETE CASCADE,
    FOREIGN KEY (platform_id) REFERENCES Platform(platform_id) ON DELETE CASCADE
);

-- Example indices for performance optimization
CREATE INDEX idx_company_name ON Company(company_name);

CREATE INDEX idx_platform_name ON Platform(platform_name);

CREATE INDEX idx_position ON Application(position);

-- s
UPDATE
    applications
SET
    (
        company_name = ?,
        position = ?,
        applied_date = ?,
        applied_platform = ?,
        email_used = ?,
        resume_used = ?,
        status = ?,
        offer_letter_status = ?,
        notes = ?,
        follow_up_date = ?,
        interview_date = ?,
        created_at = ?
    )
VALUES
    (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
WHERE
    application_id = ?