-- CREATES --

-- MERCADO
CREATE TABLE Mercado(
	idMercado SERIAL PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	cnpj CHAR(14) NOT NULL
);

-- FUNCIONARIO
CREATE TABLE Funcionario(
	idFuncionario SERIAL PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	cpf CHAR(11) NOT NULL,
	telefone CHAR(13) NOT NULL,
	fk_idMercado INT NOT NULL,
	FOREIGN KEY (fk_idMercado) REFERENCES mercado (idMercado),
	UNIQUE(cpf)
);

-- CAIXA
CREATE TABLE Caixa(
	idCaixa SERIAL PRIMARY KEY,
	numero INT NOT NULL,
	tipo VARCHAR(45) NOT NULL,
	fk_idMercado INT NOT NULL,
	FOREIGN KEY (fk_idMercado) REFERENCES mercado (idMercado)
);

-- JORNADA
CREATE TABLE Jornada(
	idJornada SERIAL PRIMARY KEY,
	data_abertura TIMESTAMP NOT NULL,
	data_fechamento TIMESTAMP NOT NULL,
	valor_abertura FLOAT NOT NULL,
	valor_fechamento FLOAT NOT NULL,
	valor_gerado FLOAT NOT NULL,
	fk_idCaixa INT NOT NULL,
	fk_idFuncionario INT NOT NULL,
	FOREIGN KEY (fk_idCaixa) REFERENCES caixa (idCaixa),
	FOREIGN KEY (fk_idFuncionario) REFERENCES funcionario (idFuncionario)
);

-- CLIENTE
CREATE TABLE Cliente(
	idCliente SERIAL PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	cpf CHAR(11) NOT NULL,
	telefone CHAR(13) NOT NULL,
	UNIQUE(cpf)
);

-- CUPOM_FISCAL
CREATE TABLE Cupom_fiscal(
	idCupom_fiscal SERIAL PRIMARY KEY,
	codigo CHAR(10) NOT NULL,
	fk_idMercado INT NOT NULL,
	fk_idVenda INT NOT NULL,
	FOREIGN KEY (fk_idMercado) REFERENCES mercado (idMercado)
);

-- VENDA
CREATE TABLE Venda(
	idVenda SERIAL PRIMARY KEY,
	valor_total FLOAT NOT NULL,
	dt TIMESTAMP NOT NULL,
	forma_pag VARCHAR(45) NOT NULL,
	fk_idCliente INT NOT NULL,
	fk_idJornada INT NOT NULL,
	fk_idCaixa INT NOT NULL,
	fk_idCupom_fiscal INT NOT NULL,
	FOREIGN KEY (fk_idCliente) REFERENCES cliente (idCliente),
	FOREIGN KEY (fk_idJornada) REFERENCES jornada (idJornada),
	FOREIGN KEY (fk_idCaixa) REFERENCES caixa (idCaixa),
	FOREIGN KEY (fk_idCupom_fiscal) REFERENCES cupom_fiscal (idcupom_fiscal)
);

-- ESTOQUE
CREATE TABLE Estoque(
	idEstoque SERIAL PRIMARY KEY,
	reposicao TIMESTAMP NOT NULL,
	produto VARCHAR(45) NOT NULL
);

-- CATEGORIA
CREATE TABLE Categoria(
	idCategoria SERIAL PRIMARY KEY,
	tipo_categoria VARCHAR(45) NOT NULL
);

-- PRODUTO
CREATE TABLE Produto(
	idProduto SERIAL PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	valor FLOAT NOT NULL,
	dt_validade DATE NOT NULL,
	cod_barras CHAR(13) NOT NULL,
	fk_idCategoria INT NOT NULL,
	fk_idEstoque INT NOT NULL,
	FOREIGN KEY (fk_idCategoria) REFERENCES categoria (idCategoria),
	FOREIGN KEY (fk_idEstoque) REFERENCES estoque (idEstoque)
);

-- VENDA_ITEM
CREATE TABLE Venda_item(
	idVenda_item SERIAL PRIMARY KEY,
	quantidade INT NOT NULL,
	fk_idVenda INT NOT NULL,
	fk_idEstoque INT NOT NULL,
	FOREIGN KEY (fk_idVenda) REFERENCES venda (idVenda),
	FOREIGN KEY (fk_idEstoque) REFERENCES estoque (idEstoque)
);

-- FORNECEDOR
CREATE TABLE Fornecedor(
	idFornecedor SERIAL PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	email VARCHAR(45) NOT NULL,
	telefone CHAR(13) NOT NULL,
	cnpj CHAR(19) NOT NULL,
	fk_idEstoque INT NOT NULL,
	fk_idEndereco INT NOT NULL,
	FOREIGN KEY (fk_idEstoque) REFERENCES estoque (idEstoque),
	UNIQUE(cnpj)
);

-- ENDERECO
CREATE TABLE Endereco(
	idEndereco SERIAL PRIMARY KEY,
	rua VARCHAR(45) NOT NULL,
	numero INT NOT NULL,
	bairro VARCHAR(45) NOT NULL,
	cidade VARCHAR(45) NOT NULL,
	fk_idMercado INT,
	fk_Fornecedor INT,
	FOREIGN KEY (fk_idMercado) REFERENCES mercado (idMercado),
	FOREIGN KEY (fk_Fornecedor) REFERENCES fornecedor (idFornecedor)
);

-- FARDO_PRODUTO
CREATE TABLE Fardo_produto(
	idFardo_produto SERIAL PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	num_fardo INT NOT NULL,
	unidade INT NOT NULL,
	valor FLOAT NOT NULL,
	dt_validade DATE NOT NULL,
	cod_barras CHAR(13) NOT NULL,
	fk_idEstoque INT NOT NULL,
	FOREIGN KEY (fk_idEstoque) REFERENCES estoque (idEstoque)	
);

-- UNIDADE_PRODUTO
CREATE TABLE Unidade_produto(
	idUnidade_produto SERIAL PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	quantidade INT NOT NULL,
	valor FLOAT NOT NULL,
	dt_validade DATE NOT NULL,
	cod_barras CHAR(13) NOT NULL,
	fk_idEstoque INT NOT NULL,
	FOREIGN KEY (fk_idEstoque) REFERENCES estoque (idEstoque)	
);





