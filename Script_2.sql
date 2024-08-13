-- Criação das tabelas
CREATE DATABASE IF NOT EXISTS ClinicaVeterinaria;
USE ClinicaVeterinaria;

CREATE TABLE Cliente (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Endereco VARCHAR(200),
    Telefone VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE Veterinario (
    ID_Veterinario INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Especialidade VARCHAR(100)
);

CREATE TABLE Animal (
    ID_Animal INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Especie ENUM('Gato', 'Cachorro') NOT NULL,
    Raca VARCHAR(100),
    Idade INT,
    Condicao VARCHAR(255),
    Tipo_Racao VARCHAR(100),
    Habitos VARCHAR(255),
    ID_Cliente INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE TABLE Agenda (
    ID_Agenda INT AUTO_INCREMENT PRIMARY KEY,
    Data_Inicio DATE NOT NULL,
    Horario_Inicio TIME NOT NULL,
    Data_Fim DATE NOT NULL,
    Horario_Termino TIME NOT NULL,
    Disponivel BOOLEAN NOT NULL,
    ID_Veterinario INT,
    FOREIGN KEY (ID_Veterinario) REFERENCES Veterinario(ID_Veterinario)
);

CREATE TABLE Atendimento (
    ID_Atendimento INT AUTO_INCREMENT PRIMARY KEY,
    Data_Hora DATETIME NOT NULL,
    ID_Animal INT,
    ID_Veterinario INT,
    Receita VARCHAR(255),
    Observacoes TEXT,
    ID_Agenda INT,
    FOREIGN KEY (ID_Animal) REFERENCES Animal(ID_Animal),
    FOREIGN KEY (ID_Veterinario) REFERENCES Veterinario(ID_Veterinario),
    FOREIGN KEY (ID_Agenda) REFERENCES Agenda(ID_Agenda)
);

-- Inserção de dados de exemplo

-- Clientes
INSERT INTO Cliente (Nome, Endereco, Telefone, Email) VALUES 
('João Silva', 'Rua das Flores, 123', '9999-8888', 'joao.silva@gmail.com'),
('Maria Souza', 'Av. Central, 456', '9888-7777', 'maria.souza@yahoo.com'),
('Carlos Oliveira', 'Rua dos Pássaros, 789', '9777-6666', 'carlos.oliveira@hotmail.com'),
('Ana Costa', 'Av. das Nações, 234', '9666-5555', 'ana.costa@gmail.com'),
('Fernanda Lima', 'Rua Verde, 345', '9555-4444', 'fernanda.lima@gmail.com'),
('Paulo Ricardo', 'Av. Azul, 456', '9444-3333', 'paulo.ricardo@yahoo.com'),
('Juliana Mendes', 'Rua Amarela, 567', '9333-2222', 'juliana.mendes@hotmail.com'),
('Roberto Carvalho', 'Av. Rosa, 678', '9222-1111', 'roberto.carvalho@gmail.com'),
('Renata Silva', 'Rua Lilás, 789', '9111-0000', 'renata.silva@yahoo.com'),
('Marcelo Teixeira', 'Av. Laranja, 890', '9000-9999', 'marcelo.teixeira@gmail.com');

-- Veterinários
INSERT INTO Veterinario (Nome, Especialidade) VALUES 
('Dr. Pedro Rocha', 'Clínica Geral'),
('Dra. Ana Lima', 'Cirurgia'),
('Dr. Carlos Santos', 'Dermatologia'),
('Dra. Paula Costa', 'Ortopedia'),
('Dr. Ricardo Moreira', 'Odontologia'),
('Dra. Fernanda Souza', 'Neurologia'),
('Dr. João Mendes', 'Oftalmologia'),
('Dra. Carla Nogueira', 'Cardiologia'),
('Dr. Lucas Oliveira', 'Oncologia'),
('Dra. Marina Almeida', 'Endocrinologia');

-- Animais
INSERT INTO Animal (Nome, Especie, Raca, Idade, Condicao, Tipo_Racao, Habitos, ID_Cliente) VALUES 
('Rex', 'Cachorro', 'Labrador', 5, 'Alergia a pulgas', 'Ração Premium', 'Passeios diários', 1),
('Mimi', 'Gato', 'Siamês', 3, 'Apatia e perda de apetite', 'Ração para gatos adultos', 'Prefere lugares altos', 2),
('Bobby', 'Cachorro', 'Poodle', 7, 'Problemas de pele', 'Ração para pele sensível', 'Adora correr', 3),
('Luna', 'Gato', 'Persa', 4, 'Obesidade', 'Ração light', 'Gosta de dormir o dia todo', 4),
('Thor', 'Cachorro', 'Bulldog', 6, 'Problemas respiratórios', 'Ração específica para Bulldogs', 'Adora brincar com crianças', 5),
('Nina', 'Gato', 'Maine Coon', 2, 'Infecção urinária', 'Ração para trato urinário', 'Muito curiosa', 6),
('Max', 'Cachorro', 'Beagle', 8, 'Problemas de ouvido', 'Ração regular', 'Caça insetos', 7),
('Lily', 'Gato', 'Bengal', 5, 'Problemas digestivos', 'Ração para sensibilidade estomacal', 'Muito ativa', 8),
('Toby', 'Cachorro', 'Golden Retriever', 3, 'Displasia de quadril', 'Ração com glucosamina', 'Ama nadar', 9),
('Bella', 'Gato', 'Sphynx', 1, 'Problemas de pele', 'Ração para pele sensível', 'Adora atenção', 10);

-- Agenda
INSERT INTO Agenda (Data_Inicio, Horario_Inicio, Data_Fim, Horario_Termino, Disponivel, ID_Veterinario) VALUES
('2024-08-14', '09:00:00', '2024-08-14', '09:30:00', TRUE, 1),
('2024-08-14', '09:30:00', '2024-08-14', '10:00:00', TRUE, 1),
('2024-08-14', '10:00:00', '2024-08-14', '10:30:00', TRUE, 2),
('2024-08-14', '10:30:00', '2024-08-14', '11:00:00', TRUE, 2),
('2024-08-14', '11:00:00', '2024-08-14', '11:30:00', TRUE, 1),
('2024-08-14', '11:30:00', '2024-08-14', '12:00:00', FALSE, 1),
('2024-08-14', '12:00:00', '2024-08-14', '12:30:00', TRUE, 2),
('2024-08-14', '12:30:00', '2024-08-14', '13:00:00', TRUE, 2),
('2024-08-14', '13:00:00', '2024-08-14', '13:30:00', TRUE, 1),
('2024-08-14', '13:30:00', '2024-08-14', '14:00:00', TRUE, 1);


-- Atendimentos
INSERT INTO Atendimento (Data_Hora, ID_Animal, ID_Veterinario, Receita, Observacoes, ID_Agenda) VALUES 
('2024-08-14 09:00:00', 1, 1, 'Antialérgico', 'Animal com reação alérgica leve.', 1),
('2024-08-14 10:00:00', 2, 2, 'Suplemento vitamínico', 'Animal apático e com perda de apetite.', 2),
('2024-08-14 11:00:00', 3, 3, 'Pomada para dermatite', 'Animal com irritação na pele.', 3),
('2024-08-14 12:00:00', 4, 4, 'Ração light', 'Animal com sobrepeso.', 4),
('2024-08-14 13:00:00', 5, 5, 'Inalador', 'Problemas respiratórios crônicos.', 5),
('2024-08-14 14:00:00', 6, 6, 'Antibiótico', 'Infecção urinária detectada.', 6),
('2024-08-14 15:00:00', 7, 7, 'Gotas para ouvido', 'Animal com otite.', 7),
('2024-08-14 16:00:00', 8, 8, 'Probiótico', 'Problemas digestivos.', 8),
('2024-08-14 17:00:00', 9, 9, 'Suplemento para articulações', 'Displasia de quadril.', 9),
('2024-08-14 18:00:00', 10, 10, 'Creme hidratante', 'Animal com pele sensível.', 10);
