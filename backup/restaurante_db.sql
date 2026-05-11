CREATE DATABASE restaurante_db;

USE restaurante_db;

-- 1. Tabela de Clientes
CREATE TABLE  clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) UNIQUE,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 2. Tabela de Funcionários
CREATE TABLE funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    telefone VARCHAR(20),
    data_contratacao DATE NOT NULL
);

-- 3. Tabela de Mesas
CREATE TABLE  mesas (
    id_mesa INT AUTO_INCREMENT PRIMARY KEY,
    numero_mesa INT NOT NULL UNIQUE,
    capacidade INT NOT NULL,
    status VARCHAR(20) DEFAULT 'disponivel'
);

-- 4. Tabela de Reservas de Mesa
CREATE TABLE  reservas (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_mesa INT NOT NULL,
    id_funcionario INT,
    data_reserva DATE NOT NULL,
    hora_reserva TIME NOT NULL,
    quantidade_pessoas INT NOT NULL,
    status_reserva VARCHAR(20) DEFAULT 'confirmada',
    observacao TEXT,
    data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 5. Tabela de Categorias do Cardápio
CREATE TABLE categorias_cardapio (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL UNIQUE,
    descricao VARCHAR(200)
);

-- 6. Tabela de Itens do Cardápio
CREATE TABLE  itens_cardapio (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT NOT NULL,
    nome_item VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    disponivel BOOLEAN DEFAULT TRUE
);

-- 7. Tabela de Pedidos
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_mesa INT,
    id_cliente INT,
    id_funcionario INT NOT NULL,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    status_pedido VARCHAR(20) DEFAULT 'em_preparo',
    valor_total DECIMAL(10,2) DEFAULT 0.00
);

-- 8. Tabela de Itens do Pedido
CREATE TABLE  itens_pedido (
    id_item_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_item INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 1,
    preco_unitario DECIMAL(10,2) NOT NULL,
    observacao VARCHAR(200)
);

-- Inserir dados na tabela clientes
INSERT INTO clientes (nome, telefone, email) VALUES
('Ana Carolina Silva', '(11) 98765-4321', 'ana.silva@email.com'),
('Bruno Mendes', '(11) 99876-5432', 'bruno.mendes@email.com'),
('Carla Pereira', '(11) 91234-5678', 'carla.pereira@email.com'),
('Daniel Rocha', '(11) 92345-6789', 'daniel.rocha@email.com'),
('Eduarda Santos', '(11) 93456-7890', 'eduarda.santos@email.com');

-- Inserir dados na tabela funcionarios
INSERT INTO funcionarios (nome, cargo, telefone, data_contratacao) VALUES
('Felipe Almeida', 'Gerente', '(11) 94567-8901', '2022-03-15'),
('Gabriela Costa', 'Garçom', '(11) 95678-9012', '2023-06-20'),
('Henrique Souza', 'Garçom', '(11) 96789-0123', '2023-08-10'),
('Isabela Fernandes', 'Cozinheiro', '(11) 97890-1234', '2021-11-05'),
('João Victor', 'Auxiliar de Cozinha', '(11) 98901-2345', '2024-01-12');

-- Inserir dados na tabela mesas
INSERT INTO mesas (numero_mesa, capacidade, status) VALUES
(1, 4, 'disponivel'),
(2, 6, 'disponivel'),
(3, 2, 'disponivel'),
(4, 8, 'ocupada'),
(5, 4, 'disponivel'),
(6, 10, 'manutencao'),
(7, 2, 'disponivel'),
(8, 6, 'reservada');

-- Inserir dados na tabela reservas
INSERT INTO reservas (id_cliente, id_mesa, id_funcionario, data_reserva, hora_reserva, quantidade_pessoas, status_reserva, observacao) VALUES
(1, 2, 2, '2026-05-05', '19:00:00', 5, 'confirmada', 'Aniversário de casal - preferem mesa perto da janela'),
(2, 3, 3, '2026-05-05', '20:30:00', 2, 'confirmada', 'Cliente com alergia a camarão'),
(3, 5, 2, '2026-05-06', '18:45:00', 4, 'confirmada', ' '),
(4, 7, 3, '2026-05-06', '19:15:00', 2, 'cancelada', 'Cliente ligou e desmarcou'),
(5, 1, 2, '2026-05-07', '20:00:00', 4, 'confirmada', 'Grupo de amigos - chegam separados');

-- Inserir dados na tabela categorias_cardapio
INSERT INTO categorias_cardapio (nome_categoria, descricao) VALUES
('Entradas', 'Pratos pequenos para iniciar a refeição'),
('Pratos Principais', 'Refeições completas e substanciais'),
('Bebidas Não Alcoólicas', 'Sucos, refrigerantes, águas e chás'),
('Bebidas Alcoólicas', 'Vinhos, cervejas e destilados'),
('Sobremesas', 'Doces e sobremesas para finalizar');

-- Inserir dados na tabela itens_cardapio
INSERT INTO itens_cardapio (id_categoria, nome_item, descricao, preco, disponivel) VALUES
(1, 'Bruschetta', 'Pão italiano grelhado com tomate, manjericão e azeite', 18.90, TRUE),
(1, 'Camarão Empanado', 'Camarões frescos empanados e fritos, servidos com molho tártaro', 32.50, TRUE),
(2, 'Filé Mignon ao Molho Madeira', 'Filé de carne nobre com molho rico de vinho madeira e cogumelos', 64.90, TRUE),
(2, 'Risoto de Cogumelos', 'Arroz arbóreo cozido lentamente com cogumelos variados e queijo parmesão', 48.50, TRUE),
(3, 'Suco de Laranja Natural', 'Suco fresco de laranjas selecionadas - 500ml', 9.80, TRUE),
(3, 'Refrigerante', 'Diversos sabores - 350ml', 6.50, TRUE),
(4, 'Vinho Tinto Seco', 'Garrafa 750ml - Safra 2022', 89.00, TRUE),
(4, 'Cerveja Artesanal', 'Lata 355ml - Lúpulo fresco', 14.20, TRUE),
(5, 'Pudim de Leite', 'Pudim tradicional com calda de açúcar queimado', 16.90, TRUE),
(5, 'Torta de Limão', 'Massa crocante com recheio cremoso de limão e cobertura de merengue', 19.50, TRUE);

-- Inserir dados na tabela pedidos
INSERT INTO pedidos (id_mesa, id_cliente, id_funcionario, status_pedido, valor_total) VALUES
(4, NULL, 2, 'pago', 128.70),
(1, 1, 3, 'em_preparo', 89.40),
(5, 3, 2, 'entregue', 76.30),
(8, NULL, 3, 'em_preparo', 152.60);

-- Inserir dados na tabela itens_pedido
INSERT INTO itens_pedido (id_pedido, id_item, quantidade, preco_unitario, observacao) VALUES
(1, 1, 1, 18.90, ''),
(1, 3, 1, 64.90, 'Sem pimenta'),
(1, 6, 2, 6.50, ''),
(1, 9, 1, 16.90, ''),
(2, 2, 1, 32.50, ''),
(2, 4, 1, 48.50, 'Mais queijo parmesão'),
(2, 5, 1, 9.80, ''),
(3, 1, 1, 18.90, ''),
(3, 7, 1, 89.00, ''),
(4, 3, 2, 64.90, ''),
(4, 8, 4, 14.20, 'Gelo à parte');


ALTER TABLE reservas
ADD CONSTRAINT fk_reserva_cliente
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente);

ALTER TABLE reservas
ADD CONSTRAINT fk_reserva_mesa
FOREIGN KEY (id_mesa) REFERENCES mesas(id_mesa);

ALTER TABLE reservas
ADD CONSTRAINT fk_reserva_funcionario
FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario);

-- Tabela itens_cardapio
ALTER TABLE itens_cardapio
ADD CONSTRAINT fk_item_categoria
FOREIGN KEY (id_categoria) REFERENCES categorias_cardapio(id_categoria);

-- Tabela pedidos
ALTER TABLE pedidos
ADD CONSTRAINT fk_pedido_mesa
FOREIGN KEY (id_mesa) REFERENCES mesas(id_mesa);

ALTER TABLE pedidos
ADD CONSTRAINT fk_pedido_cliente
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente);

ALTER TABLE pedidos
ADD CONSTRAINT fk_pedido_funcionario
FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario);

-- Tabela itens_pedido
ALTER TABLE itens_pedido
ADD CONSTRAINT fk_item_pedido_pedido
FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido);

ALTER TABLE itens_pedido
ADD CONSTRAINT fk_item_pedido_item
FOREIGN KEY (id_item) REFERENCES itens_cardapio(id_item);

ALTER TABLE reservas
ADD UNIQUE KEY id_mesa_horario (id_mesa, data_reserva, hora_reserva);

DROP DATABASE restaurante_db;
CREATE DATABASE restaurante_db;

use restaurante_db;

select * from itens_cardapio;
