	----------- INDICES -----------

-- PESQUISAR PELO NOME --
CREATE INDEX idx_nome_produto ON produto (nome);

SELECT * FROM produto WHERE nome LIKE '%Café%';

-- PESQUISAR VENDAS POR DATA --
CREATE INDEX idx_data_vendas ON venda (dt);

SELECT * FROM venda ORDER BY valor_total DESC;
SELECT * FROM venda WHERE dt BETWEEN '2023-06-016 08:00:00' AND '2023-06-016 12:00:00';

----------- PROCEDURE -----------

-- CADASTRAR FUNCIONARIO --
CREATE OR REPLACE PROCEDURE cadastrar_funcionario(
    IN nome_funcionario VARCHAR(45),
    IN cpf_funcionario CHAR(11),
    IN telefone_funcionario CHAR(13)
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Inserir nome, telefone e fk_idmercado na tabela de funcionários
    BEGIN
        INSERT INTO funcionario (nome, telefone, fk_idmercado)
        VALUES (nome_funcionario, telefone_funcionario, 1);
        
        -- Verificar se houve algum erro durante a inserção dos dados
        IF NOT FOUND THEN
            -- Caso tenha ocorrido erro, reverter a transação e levantar exceção
            ROLLBACK;
            RAISE EXCEPTION 'Erro ao inserir nome, telefone e fk_idmercado.';
        END IF;
    END;

    -- Verificar se o CPF já está cadastrado
    IF EXISTS (SELECT 1 FROM funcionario WHERE cpf = cpf_funcionario) THEN
        -- Caso o CPF já esteja cadastrado, reverter a transação e levantar a exceção
        ROLLBACK;
        RAISE EXCEPTION 'Este CPF já está cadastrado no sistema.';
    ELSE
        -- Caso o CPF não esteja cadastrado, inserir o CPF do funcionário na tabela
        BEGIN
            UPDATE funcionario
            SET cpf = cpf_funcionario
            WHERE nome = nome_funcionario;

            -- Verificar se houve algum erro durante a atualização do CPF
            IF NOT FOUND THEN
                -- Caso tenha ocorrido erro, reverter a transação e levantar exceção
                ROLLBACK;
                RAISE EXCEPTION 'Erro ao atualizar o CPF do funcionário.';
            END IF;
        END;

        -- Confirmar a transação
        COMMIT;
        RAISE NOTICE 'Funcionário cadastrado com sucesso.';
    END IF;
END;
$$;

CALL cadastrar_funcionario('João Silva', '12345678901', '(11)999999999');


SELECT * FROM funcionario;

----------- FUNCTIONS -----------

-- VERIFICAR DISPONIBILIDADE --

CREATE OR REPLACE FUNCTION verificar_disponibilidade(codbarras CHAR(13))
RETURNS BOOLEAN AS $$
DECLARE
    disponivel BOOLEAN;
    quantidade_estoque INT;
BEGIN
    SELECT quantidade
    INTO quantidade_estoque
    FROM unidade_produto
    WHERE codbarras = cod_barras;
    
    IF quantidade_estoque > 0 THEN
        disponivel := TRUE;
    ELSE
        disponivel := FALSE;
    END IF;
    
    RETURN disponivel;
END;
$$ LANGUAGE plpgsql;

SELECT verificar_disponibilidade('8954703260396'); 


----------- MEDIA PREÇO CATEGORIA -----------

CREATE OR REPLACE FUNCTION calcular_media_categoria(categoria INT)
RETURNS DECIMAL(10,2) AS $$
DECLARE
    media_precos DECIMAL(10,2);
BEGIN
    SELECT AVG(valor) INTO media_precos
    FROM produto
    WHERE fk_idCategoria = categoria;
    
    RETURN media_precos;
END;
$$ LANGUAGE plpgsql;

SELECT calcular_media_categoria(2); 


----------- VIEW -----------

CREATE VIEW view_mercado AS
SELECT cliente.nome, venda.valor_total, cupom_fiscal.codigo
FROM cliente
FULL JOIN venda ON cliente.idCliente = venda.idVenda
FULL JOIN cupom_fiscal ON venda.idVenda = cupom_fiscal.idCupom_fiscal;

SELECT * FROM view_mercado;
