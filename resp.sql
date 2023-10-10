
   
	 #1. Mostrar a lista de fornecedores dos produtos que aparecem em pedidos;
		SELECT * FROM fornecedores as f
	JOIN
    	pedidos as p
        ON
        f.id = p.idFornecedor
   
	 
	 #     Melhorias:
   #1.1        Mostrar a lista de fornecedores em ordem alfabética e sem repetições
	 SELECT * FROM fornecedores as f
	JOIN
    	pedidos as p
        ON
        f.id = p.idFornecedor
        GROUP BY
        	f.nome
        ORDER BY
        	f.nome ASC
   
	 
	 #1.2         Mostrar a lista de fornecedores com o nome dos produtos fornecidos
	 
	 SELECT * FROM fornecedores as f
	JOIN
    	pedidos as p
        ON
        f.id = p.idFornecedor
        JOIN
        	produtos pd
            ON
            p.idProduto = pd.id
	 
	 
   #1.3         Mostrar a lista de fornecedores com o valor total de vendas
	 
	 SELECT 
	f.nome as Fornecedor, 
    sum(pe.valor) as 'Total de Vendas' 
    FROM 
    	fornecedores f
	JOIN
    	pedidos pe
        ON	
        	pe.idFornecedor = f.id
            GROUP BY 
            	f.nome
	 
	 
 #2.   Mostrar a lista completa de pedidos com as dados de cada produto;
 SELECT * from pedidos
	JOIN
    	produtos
        ON
        pedidos.idProduto = produtos.id
 # Melhorias
 #2.1 Mostre uma tabela com Quantidade, Nome do Produto, Peso do produto e Peso Total do pedido(quantidade * peso)
						SELECT 	pe.quantidade, 
		pr.nome, 
        pr.peso, 
        (pr.peso*pe.quantidade) as 'Peso Total'  
    FROM 
    	pedidos pe
	JOIN
    	produtos pr
        ON
        	pe.idProduto = pr.id
  
	# 2.2 Inclua na tabela anterior o nome e email do fornecedor.
	SELECT 	pe.quantidade, 
		pr.nome, 
        pr.peso, 
        (pr.peso*pe.quantidade) as 'Peso Total',
        f.email
    FROM 
    	pedidos pe
	JOIN
    	produtos pr
        ON
        	pe.idProduto = pr.id
        JOIN
        	fornecedores f
            ON
            	pe.idFornecedor = f.id
   
	 Mostrar a lista de produtos e seus fornecedores para os produtos que não estejam disponíveis;
        Melhorias
            Inclua os dados dos produtos na pesquisa anterior
						
						SELECT 	pe.quantidade, 
		pr.nome, 
        pr.peso, 
        (pr.peso*pe.quantidade) as 'Peso Total',
        f.email
    FROM 
    	pedidos pe
	JOIN
    	produtos pr
        ON
        	pe.idProduto = pr.id
        JOIN
        	fornecedores f
            ON
            	pe.idFornecedor = f.id
						
          ## 3.2  Ajuste a tabela anterior para apresentar somente dados amigáveis para humanos
					SELECT pr.nome "Produto Indiponível", 
	   f.nome "Fornecedor Atual",
       f.email "E-mail",
       e.custo "Custo unitário atual"
	FROM produtos pr
	JOIN
    	estoque e
        ON
        e.idProduto=pr.id
        JOIN
        	fornecedores f
            ON
            	e.idFornecedor = f.id
                WHERE
                	e.disponiveis = 0
									
         ## 3.3  Mostre uma tabela com o total disponível de cada produto em estoque por fornecedor
SELECT 	pr.nome 'Produto',
		f.nome 'Fornecedor',
        e.disponiveis 'Quantidade disponível'
        FROM
	produtos pr
    JOIN
    	estoque e
       	ON
        	e.idProduto=pr.id
            JOIN
            	fornecedores f
                ON
                	f.id = e.idFornecedor
                    WHERE
                    	e.disponiveis>0
