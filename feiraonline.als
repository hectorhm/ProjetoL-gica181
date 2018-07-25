// Projeto da disciplina Lógica aplicada a Computação do curso de Ciência da Computação da UFCG, período 2018.1
module Feira

//Classe artesão que possui um conjunto de lojas
sig Artesao{
	lojas: set Loja
}

sig Loja {
	produto: set Produto
}


sig Cliente {
	favoritos: set Loja,
	compras: set Compra
	--historico: compras do usuario 
}


sig Compra {
	--frete: 
	produtos: set Produto
	
}

abstract sig Produto{

}

sig Metal extends Produto{}
sig Couro extends Produto {}
sig Vime extends Produto{}
sig PapelMache extends Produto {}


fact{
	#(Artesao )= 5

	all l:Loja | one l.~lojas
	all c1,c2 : Cliente  |verificaClienteCompra[c1,c2]
	all c: Compra | one c.~compras
	all l1,l2: Loja | verificaLojaProduto[l1,l2]
	all l:Loja | one l.produto
	all l:Produto | one l.~produto
	all c1,c2:Compra | verificaCompraProduto[c1,c2]
	all p:Produto | one p.~produtos
}


--Predicado referente a relação entre cliente e compra
pred verificaClienteCompra[c1,c2:Cliente]{
	 c1 != c2 implies c1.compras != c2.compras
}

-- predicado referente a relação entre loja e produto
pred verificaLojaProduto[l1,l2:Loja]{
	l1 != l2 implies l1.produto != l2.produto
}

-- Predicado referente a relção entre compra e produto
pred verificaCompraProduto[c1,c2:Compra]{
	c1 != c2 implies c1.produtos != c2.produtos
}



pred temFavorito[f:Loja]{
	some f.produto
}

---------------------------------ASSERTS--------------------------------------------------------

-- verifica se toda loja possui pelo menos um produto
assert lojaTemProdutos{
	all l:Loja | some l.produto
}

-- Verifica se um produto está disponível

-------- Testes e Runs ---------

check lojaTemProdutos for 10




pred show[]{
}

run show for 5
