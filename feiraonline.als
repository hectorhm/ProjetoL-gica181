// Projeto da disciplina Lógica aplicada a Computação do curso de Ciência da Computação da UFCG, período 2018.1
module Feira

//Classe artesão que possui um conjunto de lojas
sig Artesao {
	lojas: set Loja
}

sig Loja {
	produto: set Produto
	-- itens: set Compra
}

sig Cliente {
	favoritos: set Loja,
	compras: set Compra

}

sig Compra{
	
	produtos: set Produto,
	frete : lone Frete
}
sig Frete{}

sig Produto{

	tipo: one Tipo
}

abstract sig Tipo{}
sig Couro extends Tipo{}
sig Metal extends Tipo{}
sig Vime extends Tipo{}
sig Papel extends Tipo{}


fact {
	#(Artesao) = 5
	all l: Loja | one l.~lojas
-- Toda Loja possui exatamente um Artesão
	all c1,c2 : Cliente  |verificaClienteCompra[c1,c2]
-- Todo Cliente possui uma Compra única
	all c: Compra | one c.~compras
-- Toda Compra pertence a exatamente um Cliente
	all c: Compra | some c.produtos
-- Toda Compra possui pelo menos um Produto
	all l1,l2: Loja | verificaLojaProduto[l1,l2]
-- Todo Loja possui um Produto único
	all p: Produto | one p.~produto
-- Todo Produto pertence a exatamente uma Loja
	all c1,c2:Compra | verificaCompraProduto[c1,c2]
-- Toda Compra possui um Produto único
	all p: Produto | one p.~produtos
-- Todo Produto pertence a exatamente uma Compra
--	all f: Frete | one f.~frete
-- Toda Compra possui um Frete
	
}

fact{
	
	all t:Tipo | one t.~tipo
	all p:Produto | one p.~produtos
	all f:Frete | one f.~frete
	
	all c:Compra |  temFreteProdutoMenorQue5[c]
	all c:Compra | naoTemFrete[c]
	all c:Compra | temFreteProdutoCouroMenorQue3[c]
}


--Predicado referente a relação entre cliente e compra
pred verificaClienteCompra[c1,c2:Cliente] {
	 c1 != c2 implies getComprasCliente[c1] != getComprasCliente[c2]
}

-- predicado referente a relação entre loja e produto
pred verificaLojaProduto[l1,l2:Loja] {
	l1 != l2 implies getProdutoLoja[l1] != getProdutoLoja[l2]
}

-- Predicado referente a relação entre compra e produto
pred verificaCompraProduto[c1,c2:Compra] {
	c1 != c2 implies getProdutosCompra[c1] != getProdutosCompra[c2]
}

pred temFavorito[f:Loja] {
	some f.produto
}

pred temFreteProdutoMenorQue5[c:Compra]{
	#getProdutosCompra[c] < 5 implies #c.frete = 1
}

 pred temFreteProdutoCouroMenorQue3[c:Compra] {
	( #getProdutosCompra[c].tipo & Couro < 3) implies #getFrete[c] = 1 
}

pred naoTemFrete[c:Compra] {
	(#getProdutosCompra[c] > 4 and #getProdutosCompra[c].tipo & Couro > 2) implies #getFrete[c] = 0 
}

---------------------------------FUNÇÕES--------------------------------------------------------


fun getProdutosCompra[c:Compra] : set Produto{
	c.produtos
}

fun getComprasCliente[c:Cliente] : set Compra {
	c.compras
}

fun getProdutoLoja[l:Loja] : set Produto{
	l.produto
}

fun getFrete[c:Compra] : set Frete{
	c.frete
}

---------------------------------ASSERTS--------------------------------------------------------

-- Verifica se toda Compra tem Frete
assert compraTemFrete {
	all c: Compra | one c.frete or no c.frete
}

assert produtoTemTipo {
	all p:Produto | one p.tipo
}

assert artesaoTemLoja {
	some a:Artesao | some a.lojas
}

assert lojaTemProduto{
	some l:Loja | some l.produto
}

-------- Testes e Runs ---------

check compraTemFrete for 10
check produtoTemTipo for 5
check artesaoTemLoja for 10
check lojaTemProduto for 10

pred show[] {}

run show for 5
