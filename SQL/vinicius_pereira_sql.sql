
CREATE TABLE pacientes (
	paciente_id SERIAL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	data_nascimento DATE,
	telefone VARCHAR(15),
	cpf VARCHAR(50) UNIQUE NOT NULL,
	endereco VARCHAR (100)
);

SELECT * from pacientes;

DELETE FROM pacientes;

CREATE TABLE medicos (
    medico_id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    especilidade VARCHAR(50),
    telefone VARCHAR(15)
);
SELECT * from medicos;

    CREATE TABLE consultas (
        consulta_id SERIAL PRIMARY KEY,
        paciente_id INT NOT NULL,
        medico_id INT NOT NULL,
        data_consulta DATE ,
        hora_consulta TIME ,
        FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id),
        FOREIGN KEY (medico_id) REFERENCES medicos(medico_id)
    );

    SELECT * FROM consultas;

    INSERT INTO pacientes (nome, data_nascimento, telefone, cpf, endereco) VALUES ('vitor', '1990-01-01', '(19) 9913-9285', '109.787.090-11', 'Rua das Flores, 123');

    INSERT INTO pacientes (nome, data_nascimento, telefone, cpf, endereco) VALUES ('maria', '2000-10-05', '(19) 9876-8888', '145.787.111-34', 'Rua brasil, 244');
    INSERT INTO pacientes (nome, data_nascimento, telefone, cpf, endereco) VALUES ('miguel', '2007-03-29', '(19) 9937-9564', '190.454.-808-00', 'Rua yhoshida tomiyoshi , 123');

  UPDATE pacientes SET endereco = 'Rua yhoshida tomiyoshi, 244' WHERE nome = 'miguel';

  INSERT INTO medicos (nome, especilidade, telefone) VALUES ('joao', 'nutricao', '(19) 9955-9735');
  INSERT INTO medicos (nome , especilidade, telefone) VALUES ('pereira',  'psicologo', '(19) 7302-8322');
  INSERT INTO medicos (nome, especilidade, telefone) VALUES ('rebeca', 'ortopedista', '(19) 2347-0987');

  INSERT INTO medicos (nome, especilidade, telefone) VALUES ('dr.eduardo', 'cardiologista', '(19) 9183-7233');
  INSERT INTO medicos (nome, especilidade, telefone) VALUES ('dr.paula', 'neurologista', '(19) 9991-8965');

  SELECT * FROM medicos;

  INSERT INTO consultas (paciente_id, medico_id, data_consulta, hora_consulta) VALUES (1, 1, '2020-01-01', '10:00:00');
    INSERT INTO consultas (paciente_id, medico_id, data_consulta, hora_consulta) VALUES (4, 2, '2020-01-02', '13:30:00');
    INSERT INTO consultas (paciente_id, medico_id, data_consulta, hora_consulta) VALUES (5, 3, '2020-01-03', '15:45:00');


    DROP TABLE consultas;

    DROP TABLE medicos;

    DROP TABLE pacientes;

    SELECT 
    p.nome AS nome_paciente,
    m.nome AS nome_medico,
    c.data_consulta AS data_consulta,
    c.hora_consulta AS hora_consulta,
    m.especilidade AS especilidade_medico
    FROM consultas c
INNER JOIN pacientes p ON c.paciente_id = p.paciente_id
INNER JOIN medicos m ON c.medico_id = m.medico_id;


SELECT 
p.nome AS nome_paciente,
c.data_consulta AS data_consulta,
c.hora_consulta 
FROM pacientes p
LEFT JOIN consultas c on p.paciente_id = c.paciente_id;

SELECT 
m.nome AS nome_medico,
m.especilidade AS especilidade_medico
FROM medicos m
LEFT JOIN consultas c on m.medico_id = c.medico_id;
WHERE c.consulta_id IS NULL; 

INSERT INTO pacientes (nome, data_nascimento, telefone, cpf, endereco) VALUES ('lucas', '1995-08-20', '(19) 9944-9200', '200.797.093-23', 'Rua alto da boa vista, 21');

INSERT INTO medicos (nome, especilidade, telefone) VALUES ('Dr.eduardo', 'cardiologista', '(19) 9183-7233');

INSERT INTO consultas (paciente_id, medico_id, data_consulta, hora_consulta) VALUES (4, 4, '2024-12-15', '14:00:00');

SELECT
    p.nome AS nome_paciente,
    m.nome AS nome_medico,
    c.data_consulta AS data_consulta,
    c.hora_consulta AS hora_consulta,
    m.especilidade AS especilidade
    FROM consultas c
INNER JOIN pacientes p ON c.paciente_id = p.paciente_id
INNER JOIN medicos m ON c.medico_id = m.medico_id
WHERE c.data_consulta > CURRENT_DATE;

SELECT 
m.nome AS nome_medico,
m.especilidade AS especilidade
FROM medicos m

LEFT JOIN consultas c on m.medico_id = c.medico_id
WHERE c.consulta_id IS NULL;