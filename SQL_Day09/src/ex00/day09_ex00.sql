CREATE TABLE person_audit (
    created TIMESTAMP NOT NULL DEFAULT current_timestamp,
    type_event CHAR(1) NOT NULL DEFAULT 'I' CHECK (type_event = 'I' OR type_event = 'D' OR type_event = 'U'),
    row_id BIGINT NOT NULL ,
    name VARCHAR,
    age INTEGER,
    gender VARCHAR,
    address VARCHAR
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
RETURNS TRIGGER AS
$$
    BEGIN
    INSERT INTO
        person_audit(row_id, name, age, gender, address)
    VALUES
        (NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
    RETURN NEW;
    END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
AFTER INSERT
ON person
FOR EACH ROW
EXECUTE PROCEDURE fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10,'Damir', 22, 'male', 'Irkutsk')