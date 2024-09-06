CREATE DATABASE mercado;
 
USE mercado;
 
CREATE TABLE categorias(
id_categoria INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(10)
);
 
CREATE TABLE produtos(
id_produto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(10),
preco VARCHAR(20),
categoriaId INT,
FOREIGN KEY (categoriaId) REFERENCES categorias (id_categoria)
);
 
CREATE TABLE clientes (
id_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
email VARCHAR(100),
telefone VARCHAR(20)
);
 
CREATE TABLE pedidos (
id_pedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
data_pedido DATE,
clienteId INT,
FOREIGN KEY (clienteId) REFERENCES clientes (id_cliente)
);
 
CREATE TABLE pagamentos (
id_pagamento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
metodo_pagamento VARCHAR(100),
valor_pago INT,
data_pagamento DATE,
pedidoId INT,
FOREIGN KEY (pedidoId) REFERENCES pedidos (id_pedido)
);
 
CREATE TABLE itenspedidos(
 
id_itenspedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
quantidade INT ,
preco_unitario INT,
pedidoId INT,
produtoId INT,
FOREIGN KEY (pedidoId) REFERENCES pedidos (id_pedido),
FOREIGN KEY (produtoId) REFERENCES produtos (id_produto)
);
 
INSERT INTO categorias (nome) VALUES
('Frutas'),
('Bebidas'),
('Carnes'),
('Laticínios'),
('Limpeza');
 
INSERT INTO produtos (nome, preco, categoriaId) VALUES
('Maçã', '3.50', 1),
('Suco', '5.00', 2),
('Carne', '20.00', 3),
('Leite', '4.50', 4),
('Sabão', '2.00', 5);
 
INSERT INTO clientes (nome, email, telefone) VALUES
('João Silva', 'joao.silva@email.com', '11987654321'),
('Maria Oliveira', 'maria.oliveira@email.com', '11987654322'),
('Carlos Souza', 'carlos.souza@email.com', '11987654323'),
('Ana Costa', 'ana.costa@email.com', '11987654324'),
('Pedro Lima', 'pedro.lima@email.com', '11987654325');
 
INSERT INTO pedidos (data_pedido, clienteId) VALUES
('2024-09-01', 1),
('2024-09-02', 2),
('2024-09-03', 3),
('2024-09-04', 4),
('2024-09-05', 5);
 
INSERT INTO pagamentos (metodo_pagamento, valor_pago, data_pagamento, pedidoId) VALUES
('Cartão de Crédito', 35, '2024-09-01', 1),
('Boleto', 25, '2024-09-02', 2),
('Pix', 20, '2024-09-03', 3),
('Dinheiro', 50, '2024-09-04', 4),
('Cartão de Débito', 15, '2024-09-05', 5);
 
INSERT INTO itenspedidos (quantidade, preco_unitario, pedidoId, produtoId) VALUES
(2, 3, 1, 1),
(1, 5, 2, 2),
(1, 20, 3, 3),
(3, 4, 4, 4),
(5, 2, 5, 5);
 
  SELECT prod.nome,
  prod.preco,
  categorias.nome
  FROM produtos AS prod
  INNER JOIN categorias ON prod.categoriaId = categorias.id_categoria;
  
 SELECT cli.nome, cli.email, cli.telefone, pedidos.data_pedido
 FROM clientes AS cli
 INNER JOIN pedidos ON cli.id_cliente = pedidos.clienteId;

 SELECT pedidos.data_pedido, produtos.nome, cat.nome,itenspedidos.quantidade
 FROM categorias AS cat
 INNER JOIN produtos ON  cat.id_categoria = produtos.categoriaId
 INNER JOIN itenspedidos ON  produtos.id_produto = itenspedidos.produtoId
 INNER JOIN pedidos ON  pedidos.id_pedido = itenspedidos.pedidoId;

 
 
 




