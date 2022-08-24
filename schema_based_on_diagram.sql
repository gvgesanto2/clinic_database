CREATE TABLE patients (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR NOT NULL,
    date_of_birth DATE NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE medical_histories (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP NOT NULL,
    patient_id INT NOT NULL,
    status VARCHAR NOT NULL,
    CONSTRAINT fk_patients FOREIGN KEY (patient_id) REFERENCES patients(id),
    PRIMARY KEY (id)
);

CREATE TABLE invoices (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL NOT NULL,
    generated_at TIMESTAMP NOT NULL,
    payed_at TIMESTAMP NOT NULL,
    medical_history_id INT NOT NULL,
    CONSTRAINT fk_medical_histories FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
    PRIMARY KEY (id)
);

CREATE TABLE invoice_items (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL NOT NULL,
    invoice_id INT NOT NULL,
    treatment_id INT NOT NULL,
    CONSTRAINT fk_invoices FOREIGN KEY (invoice_id) REFERENCES invoices(id)
    CONSTRAINT fk_treatments FOREIGN KEY (treatment_id) REFERENCES treatments(id)
    PRIMARY KEY (id)
);

CREATE TABLE treatments (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    type VARCHAR NOT NULL,
    name VARCHAR NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE medical_histories_treatments (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  medical_history_id INT NOT NULL,
  treatment_id INT NOT NULL,
  CONSTRAINT fk_medical_histories FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
  CONSTRAINT fk_treatments FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);
