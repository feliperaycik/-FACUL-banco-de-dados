
use aula10;

-- ETAPA 1

-- 1
select * from tb_livros
where id = 71;

delete from tb_livros
where id = 71;

-- 2
truncate table tb_livros;

-- 3
-- (execute aqui o INSERT completo fornecido pelo professor, com os 71 registros)

select
	count(*) as total_registros
from tb_livros;

-- ETAPA 2

-- 1
insert into tb_livros (id, titulo, autor, ano_publicacao, disponivel)
values (72, 'A Montanha Mágica', 'Thomas Mann', 1924, true);

-- 2
insert into tb_livros (id, titulo, autor, ano_publicacao, disponivel)
values (73, 'O Lobo da Estepe', 'Hermann Hesse', 1927, false);

-- 3
insert into tb_livros (id, titulo, autor, ano_publicacao)
values (74, 'Solaris', 'Stanisław Lem', 1961);

select * from tb_livros
where id = 74;

-- 4
insert into tb_livros (id, titulo, autor, ano_publicacao, disponivel)
values (75, 'O Som e a Fúria', 'William Faulkner', 1929, true);

-- 5
insert into tb_livros (id, titulo, autor, ano_publicacao, disponivel)
values (76, 'Horizontes do Amanhã', 'Albert Camus', 2020, false);

-- ETAPA 3

-- 1
select
	count(*) as livros_disponiveis
from tb_livros
where disponivel = true;

-- 2
select
	autor,
    count(*) as qtd_registros
from tb_livros
group by autor
order by qtd_registros desc, autor asc;

-- 3
select
	titulo,
    autor,
    ano_publicacao
from tb_livros
where ano_publicacao = (select min(ano_publicacao) from tb_livros);

-- 4
select
	autor,
    count(*) as qtd_registros
from tb_livros
group by autor
having count(*) > 2;

-- ETAPA 4

-- 1
select * from tb_livros
where titulo = 'Dom Casmurro';

update tb_livros
set disponivel = false
where titulo = 'Dom Casmurro';

-- 2
select * from tb_livros
where titulo = 'O Cortiço';

update tb_livros
set ano_publicacao = 1891
where titulo = 'O Cortiço';

-- 3
select * from tb_livros
where id = 6;

update tb_livros
set disponivel = true
where id = 6;

-- 4
select * from tb_livros
where autor = 'George Orwell';

update tb_livros
set autor = 'George Orwell (Verificado)'
where autor = 'George Orwell';

-- 5
select * from tb_livros
where autor = 'Fiódor Dostoiévski';

update tb_livros
set disponivel = true
where autor = 'Fiódor Dostoiévski';

-- 6
select * from tb_livros
where id = 18;

update tb_livros
set titulo = 'O Senhor dos Anéis: A Sociedade do Anel'
where id = 18;

-- ETAPA 5

-- 1
select * from tb_livros
where autor = 'J.K. Rowling'
and ano_publicacao < 1999;

update tb_livros
set disponivel = false
where autor = 'J.K. Rowling'
and ano_publicacao < 1999;

-- 2
select * from tb_livros
where disponivel = false
and ano_publicacao between 1950 and 2000;

update tb_livros
set disponivel = true
where disponivel = false
and ano_publicacao between 1950 and 2000;

-- 3
select * from tb_livros
where id in (
	select id from (
		select id from tb_livros
		where autor = 'Victor Hugo'
	) as t
);

update tb_livros
set disponivel = false
where id in (
	select id from (
		select id from tb_livros
		where autor = 'Victor Hugo'
	) as t
);

-- 4
select * from tb_livros
where id in (
	select id from (
		select id from tb_livros
		where disponivel = false
		and ano_publicacao between 1930 and 1950
	) as t
);

update tb_livros
set disponivel = true
where id in (
	select id from (
		select id from tb_livros
		where disponivel = false
		and ano_publicacao between 1930 and 1950
	) as t
);

-- 5
select * from tb_livros
where autor like '%Kafka%';

update tb_livros
set disponivel = true
where autor like '%Kafka%';

-- 6
select * from tb_livros
where autor in ('Dan Brown', 'George Orwell (Verificado)', 'H.G. Wells');

update tb_livros
set disponivel = false
where autor in ('Dan Brown', 'George Orwell (Verificado)', 'H.G. Wells');

-- 7
select * from tb_livros
where ano_publicacao between 1930 and 1969;

update tb_livros
set disponivel = true
where ano_publicacao between 1930 and 1969;

-- 8
select * from tb_livros
where autor like '%Tolstói%';

update tb_livros
set autor = 'Autor Revisado'
where autor like '%Tolstói%';

-- 9
select * from tb_livros
where ano_publicacao < 1950
or titulo like '%Mundo%';

update tb_livros
set disponivel = false
where ano_publicacao < 1950
or titulo like '%Mundo%';

-- 10
select * from tb_livros
where id in (3, 6, 11, 18, 45);

update tb_livros
set disponivel = true
where id in (3, 6, 11, 18, 45);

-- 11
select * from tb_livros
where titulo like '%Senhor%'
or titulo like '%Nárnia%';

update tb_livros
set titulo = concat(titulo, ' (Coleção Especial)')
where titulo like '%Senhor%'
or titulo like '%Nárnia%';

-- ETAPA 6

-- 1
select * from tb_livros
where titulo = 'O Código Da Vinci';

delete from tb_livros
where titulo = 'O Código Da Vinci';

-- 2
select * from tb_livros
where autor = 'H.G. Wells'
and disponivel = false;

delete from tb_livros
where autor = 'H.G. Wells'
and disponivel = false;

-- 3
select * from tb_livros
where autor = 'Eça de Queirós';

delete from tb_livros
where autor = 'Eça de Queirós';

-- 4
select * from tb_livros
where ano_publicacao < 0;

delete from tb_livros
where ano_publicacao < 0;

-- 5
select * from tb_livros
where autor = 'José de Alencar'
and disponivel = true;

delete from tb_livros
where autor = 'José de Alencar'
and disponivel = true;

-- 6
select * from tb_livros
where autor in ('Victor Hugo', 'Franz Kafka')
and disponivel = false;

delete from tb_livros
where autor in ('Victor Hugo', 'Franz Kafka')
and disponivel = false;

-- 7
select * from tb_livros
where disponivel = false
and ano_publicacao between 1800 and 1900;

delete from tb_livros
where disponivel = false
and ano_publicacao between 1800 and 1900;

-- 8
select * from tb_livros
where disponivel = false
and ano_publicacao < 1900;

delete from tb_livros
where disponivel = false
and ano_publicacao < 1900;

-- 9
select * from tb_livros
where disponivel = false
and ano_publicacao >= 2000;

delete from tb_livros
where disponivel = false
and ano_publicacao >= 2000;

-- ETAPA 7

-- 1
select * from tb_livros
where autor in (
	select autor from (
		select autor from tb_livros
		group by autor
		having count(*) > 2
	) as t
);

delete from tb_livros
where autor in (
	select autor from (
		select autor from tb_livros
		group by autor
		having count(*) > 2
	) as t
);

-- 2
select * from tb_livros
where autor not like '%J.K. Rowling%';

delete from tb_livros
where autor not like '%J.K. Rowling%';

select * from tb_livros;