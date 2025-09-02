CREATE DATABASE petshop_db;
USE petshop_db;

CREATE TABLE cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE pet (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    nome VARCHAR(100),
    especie ENUM('cachorro', 'gato', 'pássaro', 'roedor') NOT NULL,
    porte ENUM('pequeno', 'médio', 'grande') NOT NULL,
    nascimento DATE,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

CREATE TABLE servico (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE,
    preco DECIMAL(6,2) NOT NULL CHECK (preco >= 0),
    duracao_min INT NOT NULL CHECK (duracao_min > 0)
);

CREATE TABLE agendamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pet_id INT NOT NULL,
    servico_id INT NOT NULL,
    data_hora DATETIME NOT NULL,
    status ENUM('agendado', 'concluido', 'cancelado') NOT NULL,
    observacoes TEXT,
    FOREIGN KEY (pet_id) REFERENCES pet(id),
    FOREIGN KEY (servico_id) REFERENCES servico(id),
    INDEX (data_hora)
);

INSERT INTO cliente (nome, cpf, telefone, email) VALUES
('Ana Souza', '123.456.789-00', '11999999999', 'ana@email.com'),
('Carlos Lima', '987.654.321-00', '11988888888', 'carlos@email.com'),
('Beatriz Melo', '111.222.333-44', '11977777777', 'beatriz@email.com');

INSERT INTO pet (cliente_id, nome, especie, porte, nascimento) VALUES
(1, 'Rex', 'cachorro', 'grande', '2018-05-10'),
(2, 'Mimi', 'gato', 'pequeno', '2020-11-23'),
(3, 'Bolinha', 'roedor', 'pequeno', '2022-03-15');

INSERT INTO servico (nome, preco, duracao_min) VALUES
('Banho', 50.00, 30),
('Tosa', 70.00, 45),
('Vacina', 90.00, 20);

INSERT INTO agendamento (pet_id, servico_id, data_hora, status, observacoes) VALUES
(1, 1, '2025-09-03 10:00:00', 'agendado', 'Banho completo'),
(2, 2, '2025-09-04 14:30:00', 'agendado', 'Tosa higiênica'),
(3, 3, '2025-09-05 09:00:00', 'agendado', 'Vacina anual');
