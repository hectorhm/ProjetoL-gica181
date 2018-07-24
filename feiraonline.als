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

pred show[]{
}

check show for 2
