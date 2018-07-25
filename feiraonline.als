// Projeto da disciplina Lógica aplicada a Computação do curso de Ciência da Computação da UFCG, período 2018.1
module Feira

//Classe artesão que possui um conjunto de lojas
sig Artesao{
	lojas: set Loja
}

sig Loja {
	dono: one Artesao,
	produtos: some Produto
}


sig Cliente {
	favoritos: set Loja,
	--historico: compras do usuario 
}


sig Produto{

}

pred temFavorito[f:Loja]{
	some f.produtos
}



-- Verifica se um produto está disponível

-------- Testes e Runs ---------

-- Teste se toda loja possui um unico dono
assert testaDono {
	all l:Loja | #(l.dono) = 1
}

-- Testa se o produtos está disponível --
assert testaDisponibilidade{
	all p:Produto | #(p) > 0
}

-- Teste se todos os produtos comprados estão no historico--
assert testaHistorico{}

-- Testa se o numero de produtos comprados satisfaz a condicao de frete livre--
assert minProdutos{
	produtosComprado:Produto | // testar aqui se produtosComprados >= 5
}



check testaFavoritos

pred show[]{
}

run show for 2
