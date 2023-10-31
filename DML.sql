-- INSERTS

INSERT INTO public.mercado(
	nome, cnpj)
	VALUES ('Mercado Fopa', '46579108000181');


INSERT INTO public.endereco(
	rua, numero, bairro, cidade, fk_idmercado, fk_fornecedor)
	VALUES ('Rua Engenheiro Otávio Furtado', 76, 'Ipanema', 'Porto Alegre', 1, null);


INSERT INTO public.funcionario(
	nome, cpf, telefone, fk_idmercado)
	VALUES
	('Carolina Luna Cardoso', '50568765931', '(67)35466513', 1),
	('Luana Eloá Rosângela Ribeiroo', '48580085500', '(84)27721227', 1),
	('Silvana Isis Viana', '13762141134', '(61)31143118', 1),
	('Emanuel Pedro Henrique Rodrigues', '96945952827', '(94)25428336', 1);


INSERT INTO public.caixa(
	numero, tipo, fk_idmercado)
	VALUES 
	(1, 'Normal', 1),
	(2, 'Normal', 1),
	(3, 'Normal', 1),
	(4, 'Rápido', 1);


INSERT INTO public.jornada(
	data_abertura, data_fechamento, valor_abertura, valor_fechamento, valor_gerado, fk_idcaixa, fk_idfuncionario)
	VALUES 
	('2023-06-16 08:00:00', '2023-06-16 20:00:00', 100, 254.94, 154.94, 1, 1),
	('2023-06-16 08:00:00', '2023-06-16 20:00:00', 100, 351.15, 251.15, 2, 2),
	('2023-06-16 08:00:00', '2023-06-16 20:00:00', 100, 429.93, 329.93, 3, 3),
	('2023-06-16 08:00:00', '2023-06-16 20:00:00', 100, 249.52, 149.52, 4, 4);


INSERT INTO public.cliente(
	nome, cpf, telefone)
	VALUES
	('Enzo Ricardo Carvalho', '94846679454', '(81)991490812'),
	('Manoel Raul Tiago Nascimento', '42770884816', '(98)998517683'),
	('Gabriela Rosa Stella Almada', '31851635670', '(63)994392017'),
	('Analu Maya Analu Souza', '91874116369', '(92)992550973'),
	('Sônia Luiza Daniela Ferreira', '81558847405', '(67)988887200'),
	('Levi César Aragão', '33265472345', '(83)983614199');


INSERT INTO public.estoque(
	reposicao, produto)
	VALUES
	('2023-06-15 07:00:00', 'Coca-Cola'),
	('2023-06-15 07:05:00', 'Heineken'),
	('2023-06-15 07:10:00', 'Leite Elegê'),
	('2023-06-15 07:15:00', 'Suco Tang'),
	('2023-06-15 07:20:00', 'Arroz Tio João'),
	('2023-06-15 07:25:00', 'Feijão Namorado'),
	('2023-06-15 07:30:00', 'Bolacha Maria Parati'),
	('2023-06-15 07:35:00', 'Massa Isabela Espaguete'),
	('2023-06-15 07:40:00', 'Detergente Ypê'),
	('2023-06-15 07:45:00', 'Sabão em pó OMO'),
	('2023-06-15 07:50:00', 'Sabonete Protex'),
	('2023-06-15 07:55:00', 'Amaciante Downy'),
	('2023-06-16 07:00:00', 'Café Melitta'),
	('2023-06-16 07:05:00', 'Açucar União'),
	('2023-06-16 07:10:00', 'Lentilha Frits Frida'),
	('2023-06-16 07:15:00', 'Creme Dental Colgate'),
	('2023-06-16 07:20:00', 'Desodorante Rexona'),
	('2023-06-16 07:25:00', 'Papel Toalha Snob'),
	('2023-06-16 07:30:00', 'Filtro de café Caiçara');


INSERT INTO public.categoria(
	tipo_categoria)
	VALUES 
	('Bebida'),
	('Comida'),
	('Limpeza'),
	('Dia a dia'),
	('Higiene pessoal');


INSERT INTO public.produto(
	nome, valor, dt_validade, cod_barras, fk_idcategoria, fk_idestoque)
	VALUES 
	('Coca-Cola', 4.99, '2023-10-15', '1030604070595', 1, 1),
	('Heineken', 11.49, '2023-12-15', '2010504080636', 1, 2),
	('Leite Elegê', 5.29, '2023-11-25', '4312657490652', 1, 3),
	('Suco Tang', 1.50, '2023-12-29', '6467634387296', 1, 4),
	('Arroz Tio João', 36.90, '2023-12-27', '8753183690547', 2, 5),
	('Feijão Namorado', 21.85, '2023-11-05', '8954703260396', 2, 6),
	('Bolacha Maria Parati', 6.90, '2023-11-09', '5423806916046', 2, 7),
	('Massa Isabela Espaguete', 4.95, '2023-12-03', '1030604070539', 2, 8),
	('Detergente Ypê', 3.40, '2023-11-18', '1598375081341', 3, 9),
	('Sabão em pó OMO', 18.10, '2023-12-12', '4367289437458', 3, 10),
	('Sabonete Protex', 0.99, '2023-12-20', '8737519053289', 3, 11),
	('Amaciante Downy', 30.70, '2023-11-25', '3256498610279', 3, 12),
	('Café Melitta', 9.99, '2023-10-30', '6824634086419', 1, 13),
	('Açucar União', 3.59, '2023-11-17','8535185036750', 2, 14),
	('Lentilha Fritz e Frida', 8.99, '2023-12-11', '6498357220984', 2, 15),
	('Creme Dental Colgate', 7.90, '2023-11-22', '8947135094246', 5, 16),
	('Desodorante Rexona', 16.49, '2023-12-14', '7659832648410', 5, 17),
	('Papel Toalha Snob', 5.99, '2023-10-29', '9068371436513', 4, 18),
	('Filtro de café Caiçara', 8.89, '2023-11-12', '0847134983628', 4, 19);



INSERT INTO public.fardo_produto(
	nome, num_fardo, unidade, valor, dt_validade, cod_barras, fk_idestoque)
	VALUES 
	('Coca-Cola', 10, 6, 48, '2023-10-15', '5260247590356', 1),
	('Heineken', 10, 6, 75, '2023-11-12', '8715348460253', 2),
	('Leite Elegê', 10, 12, 59.90, '2023-12-31', '8721653862406', 3);


INSERT INTO public.unidade_produto(
	nome, quantidade, valor, dt_validade, cod_barras, fk_idestoque)
	VALUES 
	('Coca-Cola', 60, 4.80, '2023-10-15', '5260247590356', 1),
	('Heineken', 60, 11.49, '2023-11-12', '8715348460253', 2),
	('Leite Elegê', 120, 5.29, '2023-12-31', '8721653862406', 3),
	('Suco Tang', 70, 1.50, '2023-12-29', '6467634387296', 4),
	('Arroz Tio João', 80, 36.9, '2023-12-27', '8753183690547', 5),
	('Feijão Namorado', 80, 21.85, '2023-11-05', '8954703260396', 6),
	('Bolacha Maria Parati', 60, 6.9, '2023-11-09', '5423806916046', 7),
	('Massa Isabela Espaguete', 65, 4.95, '2023-12-03', '1030604070539', 8),
	('Detergente Ypê', 65, 3.4, '2023-11-18', '1598375081341', 9),
	('Sabão em pó OMO', 70, 18.1, '2023-12-12', '4367289437458', 10),
	('Sabonete Protex', 75, 0.99, '2023-12-20', '8737519053289', 11),
	('Amaciante Downy', 70, 30.7, '2023-11-25', '3256498610279', 12),
	('Café Melitta', 80, 9.99, '2023-10-30', '6824634086419', 13),
	('Açucar União', 75, 3.59, '2023-11-17', '8535185036750', 14),
	('Lentilha Fritz e Frida', 70, 8.99, '2023-12-11', '6498357220984', 15),
	('Creme Dental Colgate', 65, 7.9, '2023-11-22', '8947135094246', 16),
	('Desodorante Rexona', 70, 16.49, '2023-12-14', '7659832648410', 17),
	('Papel Toalha Snob', 75, 5.99, '2023-10-29', '9068371436513', 18),
	('Filtro de café Caiçara', 75, 8.89, '2023-11-12', '0847134983628', 19);

	
	INSERT INTO public.fornecedor(
	nome, email, telefone, cnpj, "fk_idEstoque")
	VALUES
	('Coca-Cola Femsa', 'cocacolafemsa@cocacola.com', '08006428991', '49190159000105', 1),
	('Heineken', 'lgpd@heineken.com.br', '40001122', '21900899000179', 2),
	('Elegê', 'elege@elege.com.br', '08000512198', '95813887001620', 3),
	('Tang', 'tang@tang.com.br', '08007041940', '87265140953612', 4),
	('Tio João', 'tiojoao@tiojoao.com.br', '0800531800', '09628532000142', 5),
	('Namorado', 'televendas@camil.com.br', '08000133300', '64904295000103', 6),
	('Parati', 'parati@parati.com.br', '(49)33447000', '82945932000171', 7),
	('Espaguete', 'sac@adria.com.br', '08007021117', '87547139000138', 8),
	('Ypê', 'suporte_fornecedores@ype.ind.br', '08001300544', '52678943000171', 9),
	('OMO', 'omo@omo.com.br', '(11)974800970', '86383510000100', 10),
	('Protex', 'protex@protex.com.br', '08007037722', '18176057000101', 11),
	('Downy', 'downy@downy.com.br', '08007015515', '68632611000196', 12),
	('Melitta', 'melitta@melitta.com.br', '(11)28530386', '62000278000116', 13),
	('União', 'televendas@camil.com.br', '08000132027', '07191991000186', 14),
	('Fritz e Frida', 'fritzefrida@fronhlich.com.br', '08007077720', '89716195000184', 15),
	('Colgate', 'colgate@colgate.com.br', '08007037722', '03816532000190', 16),
	('Rexona', 'rexona@unilever.com.br', '08007077512', '61068276000104', 17),
	('Snob', 'fale.conosco@santher.com.br', '08007711411', '61101895002865', 18),
	('Caiçara', 'vendas2@caicara.com.br', '(11)964157805', '50929884000131', 19);


INSERT INTO public.endereco(
	rua, numero, bairro, cidade, fk_idmercado, fk_fornecedor)
	VALUES
	('Av. Assis Brasil', 11200, 'Sarandi', 'Porto Alegre', null, 1),
	('Rodovia RS-115', 14777, 'Km 14.5', 'Igrejinha', null, 2),
	('Av. das Industrias', 720, 'São João', 'Porto Alegre', null, 3),
	('Rua Santa Maria', 140, 'Drews', 'Cachoeira do Sul', null, 4),
	('Rodovia BR 116', 14075, 'Km 512', 'Pelotas', null, 5),
	('Rodovia BR 116', 802, 'Km 526', 'Capão do Leão', null, 6),
	('Rua Tiradentes', 475, 'São Francisco', 'São Lourenço do Oeste', null, 7),
	('Rua Remo Artini', 278, 'Santa Rita', 'Bento Gonçalves', null, 8),
	('Av. Waldyr Beira', 1000, 'Figueira', 'Amparo', null, 9),
	('Rod. Eng. Ermênio de Oliveira Penteado', 52, 'Marginal Norte', 'Indaiatuba', null, 10),
	('Rua Gravataí', 814, 'Vila Cachoeirinha', 'Cachoeirinha', null, 11),
	('Rua Professor Zeferino', 736, 'Vila Arapuã', 'São Paulo', null, 12),
	('Estrada Comendador Ismael', 150, 'Chaves Barcellos', 'Guaíba', null, 13),
	('Rua Fortunato Ferraz', 1001, 'Vila Anastacio', 'São Paulo', null, 14),
	('Av. Bom Jardim', 2772, 'Cidade Nova', 'Ivoti', null, 15),
	('Rua Gravataí', 814, 'Vila Cachoeirinha', 'Cachoeirinha', null, 16),
	('Rod. Eng. Ermênio de Oliveira Penteado', 52, 'Marginal Norte', 'Indaiatuba', null, 17),
	('Vila Passo Fundo', 645, 'Passo Fundo', 'Guaíba', null, 18),
	('Rua Cica', 452, 'Vila Angelica', 'Jundiaí', null, 19);


INSERT INTO public.cupom_fiscal(
	codigo, fk_idmercado)
	VALUES 
	('44771768', 1),
	('61086490', 1),
	('52632644', 1),
	('81087169', 1),
	('20381496', 1),
	('91888876', 1);

INSERT INTO public.venda(
	valor_total, dt, forma_pag, fk_idcliente, fk_idjornada, fk_idcaixa, fk_idcupom_fiscal)
	VALUES 
	(88.72, '2023-06-16 08:16:20', 'Crédito', 1, 1, 1, 1),
	(107.9, '2023-06-16 10:18:43', 'Crédito', 2, 2, 2, 2),
	(44.7, '2023-06-16 11:48:01', 'Débito', 3, 3, 3, 3),
	(69.23, '2023-06-16 14:10:54', 'Dinheiro', 4, 4, 4, 4),
	(66.22, '2023-06-16 16:16:16', 'Débito', 5, 1, 1, 5),
	(143.35, '2023-06-16 18:49:29', 'Crédito', 6, 2, 2, 6);


INSERT INTO public.venda_item(
	quantidade, fk_idvenda, fk_idestoque)
	VALUES
	(1, 1, 6), (1, 1, 5),
	(2, 1, 13), (1, 2, 1),
	(1, 2, 3), (3, 3, 9),
	(5, 3, 11), (1, 3, 12),
	(3, 4, 14), (3, 4, 17),
	(1, 4, 15), (3, 5, 2),
	(2, 5, 8), (1, 5, 6),
	(3, 6, 1), (10, 6, 4),
	(2, 6, 5), (1, 6, 13),
	(1, 6, 19), (3, 6, 7);
	