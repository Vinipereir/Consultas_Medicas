
CREATE TABLE pacientes (
	paciente_id INT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	data_nascimento DATE,
	telefone VARCHAR(15),
	cpf VARCHAR(11) UNIQUE NOT NULL,
	endereco VARCHAR (100)
);

SELECT * from pacientes;

CREATE TABLE medicos (
    medico_id INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    especilidade VARCHAR(50),
    telefone VARCHAR(15)
);
SELECT * from medicos;

CREATE TABLE consultas (
    consulta_id INT PRIMARY KEY,
    paciente_id INT,
    data_consulta DATE,
    hora_consulta TIME,
    medico_id INT,
    FOREING KEY (paciente_id) REFERENCES pacientes (pacientes_id),
    FOREING KEY (medico_id) REFERENCES medicos (medicos_id)
);
    
    SELECT * FROM consultas;
