CREATE DATABASE IF NOT EXISTS bd_missoes_loja;
USE bd_missoes_loja;

DROP TABLE IF EXISTS produtos;

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL
);

-- Os dados contemplam produtos sem estoque, estoques criticos,
-- quantidades nao divisiveis por 4 e 6, precos decimais e categorias
-- com diferentes volumes e valores de estoque.
INSERT INTO produtos (nome, categoria, preco, estoque) VALUES
('Notebook Pro 15', 'Eletronicos', 4299.90, 2),
('Smartphone Max', 'Eletronicos', 2199.99, 8),
('Tablet 10', 'Eletronicos', 899.50, 0),
('Monitor 27', 'Eletronicos', 1299.90, 15),
('Smart TV 43', 'Eletronicos', 1899.00, 23),
('Caixa de Som Bluetooth', 'Eletronicos', 149.99, 45),
('Mouse Gamer', 'Perifericos', 89.90, 0),
('Teclado Mecanico', 'Perifericos', 259.90, 4),
('Webcam Full HD', 'Perifericos', 179.50, 7),
('Headset USB', 'Perifericos', 129.99, 12),
('Mousepad XL', 'Perifericos', 49.90, 25),
('Hub USB-C', 'Perifericos', 119.90, 36),
('Cabo HDMI', 'Acessorios', 29.90, 80),
('Cabo USB-C', 'Acessorios', 24.50, 60),
('Carregador Rapido', 'Acessorios', 99.90, 40),
('Suporte de Celular', 'Acessorios', 39.90, 22),
('Adaptador USB', 'Acessorios', 19.99, 18),
('Power Bank', 'Acessorios', 199.90, 13),
('Cadeira Ergonomica', 'Moveis', 899.90, 3),
('Mesa de Escritorio', 'Moveis', 649.99, 5),
('Estante Compacta', 'Moveis', 329.50, 0),
('Gaveteiro', 'Moveis', 249.90, 10),
('Controle Sem Fio', 'Games', 299.90, 1),
('Jogo de Corrida', 'Games', 199.90, 4),
('Console Portatil', 'Games', 1599.90, 8),
('Headset Gamer', 'Games', 399.99, 12),
('Caderno Universitario', 'Papelaria', 29.90, 0),
('Caneta Kit 10', 'Papelaria', 18.50, 2),
('Agenda Executiva', 'Papelaria', 59.90, 4),
('Organizador de Mesa', 'Papelaria', 79.99, 6);



-- Conferencia inicial (nao e gabarito das missoes)
SELECT * FROM produtos ORDER BY id_produto;
SELECT COUNT(*) AS total_produtos FROM produtos;

-- FLOOR

-- 1
select
	nome,
    preco,
    floor(preco) as preco_floor
from produtos;

-- 2
select
	nome,
    estoque,
    floor(estoque / 6) as caixas_completas
from produtos;

-- 3
select
	nome,
    estoque,
    floor(estoque / 4) as kits_completas
from produtos;

-- 4
select
	categoria,
    avg(preco) as media_original,
    floor(avg(preco)) as media_floor
from produtos
group by categoria;

-- CEILING

-- 5
select
	nome,
    preco,
    ceiling(preco) as preco_ceiling
from produtos;

-- 6
select
	nome,
    preco,
    ceiling(estoque / 6) as caixas_necessarias
from produtos;

-- 7 
select
	nome,
    ceiling(25/8) as pacotes_a_comprar
from produtos;

-- 8
select
    nome,
    preco,
    floor(preco) as preco_floor,
    ceiling(preco) as preco_ceiling,
    ceiling(preco) - floor(preco) as diferenca
from produtos;

-- HAVING

-- 9
select
    categoria,
    count(*) as qtd_produtos
from produtos
group by categoria
having count(*) > 3;

-- 10
select
    categoria,
    sum(estoque) as total_estoque
from produtos
group by categoria
having sum(estoque) > 50;

-- 11
select
    categoria,
    avg(preco) as preco_medio
from produtos
group by categoria
having avg(preco) > 100;

-- 12
select
    categoria,
    sum(preco * estoque) as valor_total_estoque
from produtos
where estoque > 0
group by categoria
having sum(preco * estoque) > 5000;

-- CASE

-- 13
select
    nome,
    estoque,
    case
        when estoque = 0 then 'Fora de estoque'
        else 'Disponível'
    end as situacao
from produtos;

-- 14
select
    nome,
    estoque,
    case
        when estoque = 0 then 'Esgotado'
        when estoque between 1 and 5 then 'Estoque crítico'
        when estoque between 6 and 20 then 'Estoque moderado'
        else 'Estoque adequado'
    end as classificacao_estoque
from produtos;

-- 15
select
    nome,
    preco,
    case
        when preco < 100 then 'Econômico'
        when preco <= 500 then 'Intermediário'
        else 'Premium'
    end as faixa_preco
from produtos;

-- 16
select
    nome,
    estoque,
    case
        when estoque >= 20 then 0
        else 20 - estoque
    end as qtd_reposicao
from produtos;

-- DESAFIO FINAL

-- 17
select
    categoria,
    count(*) as qtd_produtos,
    sum(estoque) as total_unidades,
    avg(preco) as preco_medio,
    ceiling(avg(preco)) as preco_medio_ceiling,
    sum(preco * estoque) as valor_total_estoque,
    case
        when sum(estoque) < 20 then 'Reposição urgente'
        when sum(estoque) between 20 and 50 then 'Atenção'
        else 'Estoque confortável'
    end as classificacao_estoque
from produtos
group by categoria
having count(*) >= 2
order by total_unidades asc;

