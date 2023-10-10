/*
# Com base no modelo crie consultas utilizando o comando JOIN para os seguintes casos de uso:
# 01. Mostrar a lista de fornecedores dos produtos que aparecem em pedidos.
#
# Melhorias:
# - Mostrar a lista de fornecedores em ordem alfabética e sem repetições
# - Mostrar a lista de fornecedores com o nome dos produtos fornecidos
# - Mostrar a lista de fornecedores com o valor total de vendas */

	SELECT f.nome AS Nome_Fornecedor,
		   GROUP_CONCAT(DISTINCT pr.nome ORDER BY pr.nome ASC) 
		   AS Produtos_Fornecidos, 
		   SUM(p.quantidade * p.valor) AS Valor_Total_Vendas 
	FROM fornecedores AS f

	INNER JOIN estoque AS e 
	ON f.id = e.idFornecedor		/* JOIN relação fornecedor - estoque */
	INNER JOIN produtos AS pr 
	ON e.idProduto = pr.id			/* JOIN relação estoque - Produto */
	LEFT JOIN pedidos AS p 
	ON e.idProduto = p.idProduto	/* JOIN relação estoque - pedido */

	GROUP BY f.nome;

/*
# ----------------------------------------
# 02. Mostrar a lista completa de pedidos com as dados de cada produto;
# 
# Melhorias
# - Mostre uma tabela com Quantidade, Nome do Produto, Peso do produto e Peso Total do pedido(quantidade * peso)
# - Inclua na tabela anterior o nome e email do fornecedor.*/

	SELECT
		pr.nome AS NomeProduto,
		pr.descricao AS DescricaoProduto,
		f.nome AS NomeFornecedor,
		f.email AS EmailFornecedor,
		e.disponiveis AS QuantidadeDisponivel,
		SUM(e.disponiveis) 
		OVER (PARTITION BY pr.id) 
		AS TotalDisponivelPorProduto
	FROM produtos AS pr
	INNER JOIN estoque AS e ON pr.id = e.idProduto
	INNER JOIN fornecedores AS f ON e.idFornecedor = f.id
	WHERE e.disponiveis = 0;

/* 
# ----------------------------------------
# 03. Mostrar a lista de produtos e seus fornecedores para os produtos que não estejam disponíveis;
# 
# Melhorias
# - Inclua os dados dos produtos na pesquisa anterior 
# - Ajuste a tabela anterior para apresentar somente dados amigáveis para humanos */

	SELECT
		pr.nome AS NomeProduto,
		f.nome AS NomeFornecedor,
		f.email AS EmailFornecedor,
		e.disponiveis AS Quantidade,
		pr.peso AS PesoProduto,
		(e.disponiveis * pr.peso) AS PesoTotalPedido
	FROM produtos AS pr
	INNER JOIN estoque AS e ON pr.id = e.idProduto
	INNER JOIN fornecedores AS f ON e.idFornecedor = f.id
	WHERE e.disponiveis = 0;

/*
# Melhorias
# - Mostre uma tabela com o total disponível de cada produto em estoque por fornecedor */

	SELECT
		f.nome AS NomeFornecedor,
		pr.nome AS NomeProduto,
		SUM(e.disponiveis) AS TotalDisponivel
	FROM estoque AS e
	INNER JOIN produtos AS pr ON e.idProduto = pr.id
	INNER JOIN fornecedores AS f ON e.idFornecedor = f.id
	WHERE e.disponiveis = 0
	GROUP BY f.nome, pr.nome;

/* 
# guia para comandos
# GROUP_CONCAT	-> lista produtos fornecidos por cada fornecedor
# GROUP			-> agrupa pelo nome do fornecedor
# (DISTINCT)	-> garante que não haja fornecedores duplicados
# (ORDER BY ASC)-> ordena por nome crescente
# SUM 			-> faz o cálculo das vendas = (qtde x valor) 
# OVER 			-> clausula de janela
# PARTITION BY 	-> dados são divididos em grupos separados, onde cada grupo tem o mesmo valor em pr.id.

# alias de tabela
# 'f'  para fornecedores
# 'e'  para estoque
# 'p'  para pedidos
# 'pr' para produtos */