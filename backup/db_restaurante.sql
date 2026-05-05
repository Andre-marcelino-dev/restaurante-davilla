CREATE DATABASE IF NOT EXISTS db_restaurante;


-- 1. Tabela de Clientes
CREATE TABLE IF NOT EXISTS tbl_clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) UNIQUE,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Inserir dados na tabela tbl_clientes
INSERT INTO clientes (nome, telefone, email) VALUES
('Ana Carolina Silva', '(11) 98765-4321', 'ana.silva@email.com'),
('Bruno Mendes', '(11) 99876-5432', 'bruno.mendes@email.com'),
('Carla Pereira', '(11) 91234-5678', 'carla.pereira@email.com'),
('Daniel Rocha', '(11) 92345-6789', 'daniel.rocha@email.com'),
('Eduarda Santos', '(11) 93456-7890', 'eduarda.santos@email.com');

select *from tbl_pedidos;
-- 2. Tabela de Funcionários
CREATE TABLE IF NOT EXISTS tbl_funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    telefone VARCHAR(20),
    data_contratacao DATE NOT NULL
);

-- 3. Tabela de Mesas
CREATE TABLE IF NOT EXISTS tbl_mesas (
    id_mesa INT AUTO_INCREMENT PRIMARY KEY,
    numero_mesa INT NOT NULL UNIQUE,
    capacidade INT NOT NULL,
    status VARCHAR(20) DEFAULT 'disponivel'
);

select *from tbl_mesas;

-- 4. Tabela de Reservas de Mesa
CREATE TABLE IF NOT EXISTS tbl_reservas (
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
CREATE TABLE IF NOT EXISTS tbl_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL UNIQUE,
    descricao VARCHAR(200)
);

-- 6. Tabela de Itens do Cardápio
CREATE TABLE IF NOT EXISTS tbl_itens_cardapio (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT NOT NULL,
    nome_item VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    disponivel BOOLEAN DEFAULT TRUE
);

-- 7. Tabela de Pedidos
CREATE TABLE IF NOT EXISTS tbl_pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_mesa INT,
    id_cliente INT,
    id_funcionario INT NOT NULL,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    status_pedido VARCHAR(20) DEFAULT 'em_preparo',
    valor_total DECIMAL(10,2) DEFAULT 0.00
);

-- 8. Tabela de Itens do Pedido
CREATE TABLE IF NOT EXISTS tbl_itens_pedido (
    id_item_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_item INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 1,
    preco_unitario DECIMAL(10,2) NOT NULL,
    observacao VARCHAR(200)
);

select *from tbl_cardapio;

ALTER TABLE categorias_cardapio RENAME TO tbl_categorias;



-- Tabela reservas
ALTER TABLE tbl_reservas
ADD CONSTRAINT fk_reserva_cliente
FOREIGN KEY (id_cliente) REFERENCES tbl_clientes(id_cliente);



ALTER TABLE tbl_reservas
ADD CONSTRAINT fk_reserva_mesa
FOREIGN KEY (id_mesa) REFERENCES tbl_mesas(id_mesa);


ALTER TABLE tbl_reservas
ADD CONSTRAINT fk_reserva_funcionario
FOREIGN KEY (id_funcionario) REFERENCES tbl_funcionarios(id_funcionario);


-- Tabela pedidos
ALTER TABLE  tbl_pedidos
ADD CONSTRAINT fk_pedido_mesa
FOREIGN KEY (id_mesa) REFERENCES tbl_mesas(id_mesa);

ALTER TABLE tbl_pedidos
ADD CONSTRAINT fk_pedido_cliente
FOREIGN KEY (id_cliente) REFERENCES tbl_clientes(id_cliente);



ALTER TABLE tbl_pedidos
ADD CONSTRAINT fk_pedido_funcionario
FOREIGN KEY (id_funcionario) REFERENCES tbl_funcionarios(id_funcionario);



-- Tabela itens_pedido
ALTER TABLE tbl_itens
ADD CONSTRAINT fk_item_pedido_pedido
FOREIGN KEY (id_pedido) REFERENCES tbl_pedidos(id_pedido);

ALTER TABLE tbl_itens
ADD CONSTRAINT fk_item_pedido_item
FOREIGN KEY (id_item) REFERENCES tbl_cardapio(id_item);


-- Tabela itens_cardapio
ALTER TABLE tbl_cardapio
ADD CONSTRAINT fk_item_categoria
FOREIGN KEY (id_categoria) REFERENCES tbl_categorias(id_categoria);

ALTER TABLE tbl_reservas
ADD UNIQUE KEY idx_mesa_horario (id_mesa, data_reserva, hora_reserva);

select *from tbl_reservas;