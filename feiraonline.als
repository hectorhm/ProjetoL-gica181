// Projeto da disciplina Lógica aplicada a Computação do curso de Ciência da Computação da UFCG, período 2018.1
module Feira

//Classe artesão que possui um conjunto de lojas
sig Artesao{
	lojas: set Loja
}

sig Loja {
	produtos: some Produto
}


sig Cliente {
	favoritos: set Loja,
	historicoDeCompras: set Compra
	--historico: compras do usuario 
}


sig Compra {
	--frete: 
	produtos: set Produto
}

sig Metal extends Produto{}
sig Couro extends Produto {}
sig Vime extends Produto{}
sig PapelMache extends Produto {}


abstract sig Produto{

}

fact{
	#(Artesao )= 2

	one cliente:Cliente | one cliente.historicoDeCompras

}


pred temFavorito[f:Loja]{
	some f.produtos
}



-- Verifica se um produto está disponível

-------- Testes e Runs ---------

-- Teste se toda loja possui um unico dono







pred show[]{
}

run show for 5
