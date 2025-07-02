//Feito por: Vinicius Fellipe Silva
//Esse programa é um programa onde ajuda a gerenciar algum estoque
programa
{
	inclua biblioteca Teclado --> T
	//inicio da principal funcao do código
	funcao inicio()
	{
		//declarando as primeiras variaveis
		inteiro opcao
		cadeia produto[100000]
		real disponivel[100000]
		real valor[100000]
		cadeia carrinho [100000]
		inteiro totalprodutos = 0
		cadeia r = "sim"
		inteiro pessoa
		cadeia enter
		logico sair = falso

		//inicio do sistema
		enquanto(sair == falso)
		{
		escreva("Bem vindo ao gerenciamento de estoque \n")
		escreva("Tecle 1 para vendendor")
		escreva("Tecle 2 para cliente")
		escreva("Tecle 3 para fechar o sistema")
		//mudança para o menu inici	al
		leia (pessoa)
		se(pessoa == 1)
		{
		enquanto (r == "sim" ou r == "SIM" ou r == "Sim" ou r == "s" ou r == "S")
		{
			//Aqui esta "desenhando" o menu inicial
			//No menu inicial temos as opções que o usúario pode fazer nesse sistema
			limpa()
			escreva("Escolha uma das opções abaixo\n")
			escreva("Registrar Produto  |---------------- Tecle 1  |  Calcular valor total do estoque   |---------------- Tecle 5\n")
			escreva("Exibir estoque     |---------------- Tecle 2  |  Para excluir um produto           |---------------- Tecle 6\n")
			escreva("Pesquisar produto  |---------------- Tecle 3  |  Para ver o relatorio              |---------------- Tecle 7\n")
			escreva("Editar um produto  |---------------- Tecle 4  |  Para sair como vendedor           |---------------- Tecle 8\n")
			leia (opcao)

			//Aqui verifica se o numero que o usúario digitou está na regra
			se (opcao == 1 ou opcao == 2 ou opcao == 3 ou opcao == 4 ou opcao == 5 ou opcao == 6 ou opcao == 7 ou opcao == 8)
			{
				//se estiver na regra ele inicia as verificações para saber qual foi a ação que o usúario escolheu
				//Opção 1 irá Cadastrar um produto no estoque
				//Obs: a Opção 1 e a Opção 8 são as unicas que não são necessarias que um produto ja esteja cadastrado para funcionar corretamente
				se (opcao == 1)
				{
					//Aqui "res" é atribuida a "s", para que seja possivel a entrada no loop a seguir
					cadeia res = "s"
					//Aqui temos um loop onde o usúario o usúario poderá cadastrar varios produtos sem que ele volte para o menu
					//Aqui ocorre a verificação da regra do loop
					enquanto (res == "Sim" ou res == "sim" ou res == "SIM" ou res == "s" ou res == "S")
					{
						//Aqui ele vai para a funcao registrar e irá fazer as ações que foram programadas dentro da função
						registrar(produto, disponivel, valor, totalprodutos) 
						totalprodutos++
						//Aqui é a pergunta onde é feita para caso o usúario queira voltar para o menu, ele possa voltar
						//pois o valor de "res" foi trocado"
						escreva("Deseja cadastrar um novo produto?\n")
						leia (res)
					}	
				}
				//Opção 2 irá mostrar todos os produtos que foram cadastrados no estoque 
				se(opcao == 2)
				{
					//Aqui irá para a função "exibir" e irá fazer as ações programadas dentro dela
					exibir(produto, disponivel, valor, totalprodutos)
					escreva("Para voltar ao menu inicial, tecle ENTER")
					leia (enter)
				}
				//Opção 3 irá dar a opção do usúario pesquisar algum produto que ja está cadastrado
				se(opcao == 3)
				{
					//Aqui irá para a função "consultar" e irá fazer as ações programadas dentro dela
					consultar(produto, disponivel, valor, totalprodutos)
				}
				//Na Opção 4 é onde é possivel editar a quantidade de algum produto que ja foi cadastrado
				se(opcao == 4)
				{
					//Aqui irá para a função "editar" e irá fazer as ações programadas dentro dela
					editar(produto, disponivel, valor, totalprodutos)
				}
				//Na Opção 5 é onde estará calculando o valor total que possui dentro do estoque
				se(opcao == 5)
				{
					//Aqui irá para a função "calcular" e irá fazer as ações programdas dentro dela
					limpa()
					calcular(valor, disponivel, totalprodutos)
					escreva("Para voltar ao menu inicial, tecle ENTER")
					leia (enter)
				}
				se(opcao == 6)
				{
					excluir(produto, totalprodutos, disponivel, valor)
				}
				se(opcao == 7)
				{
					detalhar(produto, disponivel, valor, totalprodutos)
				}
				//Na opção 8 é onde caso o usúario queira, ele poderá estar finalizando o sistema
				se(opcao == 8)
				{
					//Aqui o valor de "r" é trocado para que ele não entre na regra do loop, assim finalizando o sistema
					r = "nao"
					limpa()
					//Exibe a ultima mensagem mostrado antes do sistema ser realmente fechado
					escreva("Sistema finalizado, tenha um ótimo dia")
				}
			}
			//Aqui acontecerá caso o usúario tenha escrevido um número que não encaixa dentro da regra, assim ele voltará para o menu inicial
			senao
			{
				//Aqui mostra a mensagem onde que o usúario não escreveu o numero certo
				escreva("Opção incorreta, tecle ENTER para voltar ao menu inicial e tente novamente")
				leia(enter)
			}
		}
		}
		se(pessoa == 2)
		{
			cadeia nomepe
			cadeia n
			logico achou = falso
			inteiro posicao = 0
			
			escreva("Escreva seu nome\n")
			leia(nomepe)
			limpa()
			
			enquanto (r == "sim" ou r == "SIM" ou r == "Sim" ou r == "s" ou r == "S")
			{
				escreva("Bem vindo ", nomepe, "\n")	
				escreva("\n\n")
				escreva("Ver os produtos               |---------------- Tecle 1\n")
				escreva("Pesquisar produto             |---------------- Tecle 2\n")
				escreva("Visualizar carrinho           |---------------- Tecle 3\n")
				escreva("Para sair como cliente        |---------------- Tecle 4\n")
				leia(opcao)

				se(opcao == 1)
				{
					exibir(produto, disponivel, valor, totalprodutos)
					escreva("Para voltar ao menu inicial, tecle ENTER")
					leia (enter)
				}
				se(opcao == 2)
				{
					adcionar(totalprodutos,produto , achou, posicao, disponivel, valor, carrinho)
				}
				se(opcao == 3)
				{
					carrinho()
				}
			}
		}
		}
		
	}

	funcao registrar(cadeia nome[], real quantidade[], real preco[], inteiro numeroproduto)
	{

	cadeia resposta = "nao"
	cadeia enter
			enquanto (resposta == "Não" ou resposta == "não" ou resposta == "NÃO" ou resposta == "NAO" ou resposta == "nao" ou resposta == "Nao")
			{
				logico achou = falso
				cadeia ajuda
				inteiro posicao = 0
				
				limpa()
				escreva("Qual o nome do produto?\n")
				leia (ajuda)

				procurar(numeroproduto, nome, achou, ajuda, posicao)
				se(achou == verdadeiro)
				{
					escreva("O produto ", ajuda , " ja foi cadastrado, tente novamente com outro nome\n")
					escreva("Aperte ENTER para tentar de novo\n")
					leia(enter)
				}
				se(achou == falso)
				{
				nome[numeroproduto] = ajuda
				escreva("Qual a quantidade do produto?\n") 
				leia(quantidade[numeroproduto])
				escreva ("Qual o preço do produto?\n")
				leia(preco[numeroproduto])
				limpa()
				escreva("Confirme o produto a seguir:\n\n")
				escreva("Nome do produto: ", nome[numeroproduto], "\t Quantidade do produto: ", quantidade[numeroproduto], "\t Preco do produto: R$ ", preco[numeroproduto], "\n")
				escreva("As informações estão corretas?\n")
				leia(resposta)
				}
			}
	}
	
	funcao exibir(cadeia nome[], real quantidade[], real preco[], inteiro numeroproduto)
	{	
		cadeia enter
		limpa()
		escreva("lista de produtos no estoque com nome, quantidade e preço\n\n")
		para(inteiro i = 0; i<numeroproduto; i++)
		{
			se(nome[i] != "" ou quantidade[i] != 0 ou preco[i] != 0)
			{
			escreva("Nome do produto: ", nome[i], " | Quantidade disponivel: ", quantidade[i], " | Preço do produto:R$", preco[i], "\n")
			escreva("------------------------------------------------------------------------------------------------------------------------------------------------------\n")
			}
		}
	}
	funcao consultar(cadeia nome[], real quantidade[], real preco[], inteiro numeroproduto)
	{
		cadeia n
		cadeia r = "sim"
		
		enquanto (r == "Sim" ou r == "sim" ou r == "SIM" ou r == "s" ou r == "S")
		{
			limpa()
			logico achou = falso
			escreva("Qual o nome do produto que você deseja procurar?\n")
			leia(n)
			limpa()
			inteiro posicao = 0

			procurar(numeroproduto, nome, achou, n, posicao)
			se (achou == verdadeiro)
			{
				escreva("Nome do produto: ", nome[posicao], " | Quantidade disponivel: ", quantidade[posicao], " | Preço do produto:R$", preco[posicao], "\n")
			}
			se (achou == falso)
			{
				limpa()
				escreva("Produto não encontrado\n")
				escreva("Tente novamente ou cadastre ele antes de procurar\n")
			}
			escreva("Deseja repetir o processo de pesquisa?\n")
			leia (r)
		}
	}
	funcao editar(cadeia nome[], real quantidade[], real preco[], inteiro numeroproduto)
	{
		cadeia n
		cadeia r = "sim"
		cadeia edicao

		enquanto (r == "Sim" ou r == "sim" ou r == "SIM" ou r == "s" ou r == "S")
		{
		limpa()
		cadeia resposta = "não"
		logico achou = falso
		inteiro posicao = 0
		
		escreva("Escreva o nome do produto que você quer editar\n")
		leia(n)

		procurar(numeroproduto, nome, achou, n, posicao)
		se (achou == verdadeiro)
		{
			escreva("Você deseja editar a quantidade, o nome ou o preço do produto?\n")
			leia(edicao)
				se(edicao == "quantidade" ou edicao == "Quantidade")
				{
					enquanto (resposta == "Não" ou resposta == "não" ou resposta == "NÃO" ou resposta == "NAO" ou resposta == "nao" ou resposta == "Nao")
					{
						escreva("Digite a nova quantidade do produto ", nome[posicao], "\n")
						leia(quantidade[posicao])
						limpa()
						escreva("Confirme as informações a seguir\n")
						escreva("Nome do produto: ", nome[posicao], "\t Quantidade do produto: ", quantidade[posicao], "\t Preco do produto: R$ ", preco[posicao], "\n")
						escreva("As informações estão corretas?\n")
						leia(resposta)
					}
				}
				se(edicao == "nome" ou edicao == "Nome")
				{
					enquanto (resposta == "Não" ou resposta == "não" ou resposta == "NÃO" ou resposta == "NAO" ou resposta == "nao" ou resposta == "Nao")
					{
						escreva("Digite o novo nome do produto ", nome[posicao], "\n")
						leia(nome[posicao])
						limpa()
						escreva("Confirme as informações a seguir\n")
						escreva("Nome do produto: ", nome[posicao], "\t Quantidade do produto: ", quantidade[posicao], "\t Preco do produto: R$ ", preco[posicao], "\n")
						escreva("As informações estão corretas?\n")
						leia(resposta)
					}
				}
				se(edicao == "preco" ou edicao == "Preco")
				{
					
					enquanto (resposta == "Não" ou resposta == "não" ou resposta == "NÃO" ou resposta == "NAO" ou resposta == "nao" ou resposta == "Nao")
					{
						escreva("Digite o preco novo do produto ", nome[posicao], "\n")
						leia(preco[posicao])
						limpa()
						escreva("Confirme as informações a seguir\n")
						escreva("Nome do produto: ", nome[posicao], "\t Quantidade do produto: ", quantidade[posicao], "\t Preco do produto: R$ ", preco[posicao], "\n")
						escreva("As informações estão corretas?\n")
						leia(resposta)
					}
				}
			limpa()
	      	escreva("Deseja editar mais alguma informação de mais algum produto?\n")
			leia(r)
		}
			se (achou == falso)
			{
				limpa()
				escreva("Produto não encontrado\n")
				escreva("Tente novamente com outro produto ou cadastre ele antes de procurar\n")
				escreva("Deseja repetir o processo?\n")
				leia (r)
			}
			
		}
	}
	funcao calcular(real preco[], real quantidade[], inteiro numeroproduto)
	{

		real totalproduto[100000]
		real valortotal = 0.0
		real valorajuda
		cadeia enter

		para(inteiro i = 0; i<numeroproduto; i++)
		{
			totalproduto[i] = quantidade[i] * preco[i]
		}
	
		para(inteiro n = 0; n<numeroproduto; n++)
		{
			valorajuda = valortotal + totalproduto[n]
			valortotal = valorajuda
		}
		escreva("O valor total do estoque é:R$", valortotal, "\n")
	}
	funcao excluir(cadeia nome[], inteiro numeroproduto, real quantidade[], real preco[])
	{
		cadeia n
		cadeia r = "não"
		cadeia res
		inteiro totalproduto
		
		enquanto (r == "Não" ou r == "não" ou r == "NÃO" ou r == "Nao" ou r == "nao" ou r == "NAO" ou r == "n" ou r == "N")
		{
			limpa()
			logico achou = falso
			inteiro posicao = 0
			
			escreva("Escreva o nome do produto que você deseja excluir\n")
			leia(n)
			limpa()
			procurar(numeroproduto, nome, achou, n, posicao)
			se (achou == verdadeiro)
			{
				escreva("Produto encontrado:")
					escreva("Nome do produto: ", nome[posicao], " | Quantidade disponivel: ", quantidade[posicao], " | Preço do produto:R$", preco[posicao], "\n")
					escreva("É este o produto que você deseja excluir?\n")
					leia(r)
					se(r == "sim" ou r == "Sim" ou r == "SIM" ou r == "s" ou r == "S")
					{
						escreva("Você tem certeza que deseja excluir o produto ", nome[posicao], " ?\n")
						leia(res)
						se(res == "sim" ou res == "Sim" ou res == "SIM" ou res == "s" ou res == "S")
						{
							nome[posicao] = ""
							quantidade[posicao] = 0.00
							preco[posicao] = 0.00
							numeroproduto = numeroproduto - 1
							escreva("Produto excluido com sucesso\n")
						}
						se(res == "Não" ou res == "não" ou res == "NÃO" ou res== "Nao" ou res == "nao" ou res == "NAO" ou res == "n" ou res == "N")
						{
							escreva("Produto não foi excluido tente novamente\n")
						}
						escreva("Deseja voltar para o menu inicial?\n")
						leia(r)
					}
			}
			se (achou == falso)
			{
				limpa()
				escreva("Produto não encontrado\n")
				escreva("Tente novamente ou cadastre ele antes de procurar\n")
				escreva("Deseja voltar para o menu inicial?\n")
				leia (r)
			}
		}
	}
	funcao detalhar(cadeia nome[], real quantidade[], real preco[], inteiro numeroproduto)
	{
		cadeia enter
		exibir(nome, quantidade, preco, numeroproduto)
		calcular(preco, quantidade, numeroproduto)
		escreva("Total de produtos cadastrados no sistema: ", numeroproduto, "\n")
		escreva("Para voltar ao menu inicial, tecle ENTER")
		leia (enter)
	}
	funcao procurar(inteiro numeroproduto, cadeia nome[], logico &achou, cadeia n, inteiro &posicao)
	{
		inteiro i = 0
		para(posicao = 0; posicao<numeroproduto;posicao++)
		{
			se(nome[posicao] == n)
			{
			 achou = verdadeiro
			 i = posicao
			}
		}
		posicao = i
	}
	funcao adcionar(inteiro &totalprodutos,cadeia nome[], logico achou, inteiro posicao, real quantidade[], real preco[], cadeia carrinho[])
	{
		cadeia n
		cadeia r
		
		escreva("escreva o nome do produto que você deseja pesquisar")
		leia(n)
		procurar(totalprodutos, nome, achou, n, posicao)
		se(achou == verdadeiro)
		{
			escreva("Produto encontrado:\n")
			escreva("Nome do produto: ", nome[posicao], " | Quantidade disponivel: ", quantidade[posicao], " | Preço do produto:R$", preco[posicao], "\n")
			escreva("Deseja colocar o produto ", nome[posicao],"no carrinho?\n")
			leia(r)
			se(r == "sim" ou r == "SIM" ou r == "Sim" ou r == "s" ou r == "S")
			{
				nome[posicao] = carrinho[]
			}
		se (achou == falso)
			{
				limpa()
				escreva("Produto não encontrado\n")
				escreva("Tente novamente\n")
				escreva("Tecle 1 para menu inicial\n Tecle 2 para procurar outro produto")
			}				
		}
		
	}
	funcao carrinho()
	{
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 14712; 
 * @DOBRAMENTO-CODIGO = [163, 201, 244, 320, 340, 393, 402];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */