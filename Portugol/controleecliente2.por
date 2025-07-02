//Feito por: Vinicius Fellipe Silva
//Esse programa é um programa onde ajuda a gerenciar algum estoque
programa
{
	inclua biblioteca Util --> u
	inclua biblioteca Teclado --> T
	//inicio da principal funcao do código
	funcao inicio()
	{
		//declarando as primeiras variaveis
		inteiro opcao
		cadeia produto[100000]
		real disponivel[100000]
		real valor[100000]
		cadeia carrinhon [100000]
		inteiro totalprodutos = 0
		cadeia r = "sim"
		inteiro pessoa
		cadeia enter
		logico sair = falso
		real carrinhoq[100000]
		real carrinhop[100000]
		inteiro totalcarrinho = 0
		inteiro totalenderecos = 1
		cadeia enderecos[100000]

		//inicio do sistema
		enquanto(sair == falso)
		{
		limpa()
		escreva("Bem vindo ao gerenciamento de estoque \n")
		escreva("Tecle 1 para vendendor\n")
		escreva("Tecle 2 para cliente\n")
		escreva("Tecle 3 para fechar o sistema\n")
		//mudança para o menu inicial
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
			escreva("Editar um produto  |---------------- Tecle 4  |  Sair conta vendedor               |---------------- Tecle 8\n")
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
					real valortotal = 0.00
					calcular(valor, disponivel, totalprodutos, valortotal)
					escreva("O valor total do estoque é:R$", valortotal, "\n")
					escreva("Para voltar ao menu inicial, tecle ENTER")
					leia (enter)
				}
				se(opcao == 6)
				{
					cadeia texto = " | Quantidade disponivel: "
					cadeia texto2 = " | Preço do produto:R$"
					cadeia continua = "excluir"
					cadeia mensagem = "excluir do estoque?"
					cadeia completo = "excluido"
					
					excluir(produto, totalprodutos, disponivel, valor, texto, texto2, continua, mensagem, completo)
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
					animacao("Saindo da conta: vendedor\n")
					pessoa = 1
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
			r = "sim"
			
			escreva("Escreva seu nome\n")
			leia(nomepe)
			limpa()
			
			enquanto (r == "sim" ou r == "SIM" ou r == "Sim" ou r == "s" ou r == "S")
			{
				limpa()
				escreva("Bem vindo ", nomepe, "\n")	
				escreva("\n")
				escreva("Ver os produtos               |---------------- Tecle 1\n")
				escreva("Pesquisar produto             |---------------- Tecle 2\n")
				escreva("Visualizar carrinho           |---------------- Tecle 3\n")
				escreva("Sair conta cliente            |---------------- Tecle 4\n")
				leia(opcao)

				se(opcao == 1)
				{
					exibir(produto, disponivel, valor, totalprodutos)
					escreva("Para voltar ao menu inicial, tecle ENTER")
					leia (enter)
				}
				se(opcao == 2)
				{
					cadeia tn = "sim"
					
					enquanto(tn == "sim" ou tn == "SIM" ou tn == "Sim" ou tn == "s" ou tn == "S")
					{
					pesquisar(totalprodutos, produto , achou, posicao, disponivel, valor, carrinhon, totalcarrinho, carrinhoq, carrinhop, tn, totalenderecos, enderecos)
					}
				}
				se(opcao == 3)
				{
					logico saindo = falso
					
					carrinho(carrinhon, carrinhoq, carrinhop, totalcarrinho, totalenderecos, enderecos, disponivel, saindo, valor, produto, totalprodutos)
				}
				se(opcao == 4)
				{
					r = "não"
					animacao("saindo da conta: cliente\n")
				}
			}
		}
		se(pessoa == 3)
		{
			sair = verdadeiro
			escreva("Finalizando programa, tenha um ótimo dia")
		}
		se(pessoa != 1 e pessoa != 2 e pessoa != 3)
		{
			escreva("Opção incorreta, tente novamente")
			u.aguarde(5000)
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
	funcao calcular(real preco[], real quantidade[], inteiro &numeroproduto, real &valortotal)
	{

		real totalproduto[100000]
		valortotal = 0.0
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
	}
	funcao excluir(cadeia nome[], inteiro &numeroproduto, real quantidade[], real preco[], cadeia texto, cadeia texto2, cadeia continua, cadeia mensagem, cadeia completo)
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
			
			escreva("Escreva o nome do produto que você deseja ", mensagem, "\n")
			leia(n)
			limpa()
			procurar(numeroproduto, nome, achou, n, posicao)
			se (achou == verdadeiro)
			{
				escreva("Produto encontrado:")
					escreva("Nome do produto: ", nome[posicao], texto , quantidade[posicao], texto2 , preco[posicao], "\n")
					escreva("É este o produto que você deseja ",mensagem,"\n")
					leia(r)
					se(r == "sim" ou r == "Sim" ou r == "SIM" ou r == "s" ou r == "S")
					{
						escreva("Você tem certeza que deseja ",continua," o produto ", nome[posicao], " ?\n")
						leia(res)
						se(res == "sim" ou res == "Sim" ou res == "SIM" ou res == "s" ou res == "S")
						{
							nome[posicao] = ""
							quantidade[posicao] = 0.00
							preco[posicao] = 0.00
							numeroproduto--
							escreva("Produto ",completo , " com sucesso\n")
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
		real valortotal = 0
		exibir(nome, quantidade, preco, numeroproduto)
		calcular(preco, quantidade, numeroproduto, valortotal)
		escreva("Total de produtos cadastrados no sistema: ", numeroproduto, "\n")
		escreva("Preço total do estoque é: R$", valortotal)
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
	funcao pesquisar(inteiro &totalprodutos,cadeia nome[], logico achou, inteiro posicao, real quantidade[], real preco[], cadeia carrinhon[], inteiro &totalcarrinho, real carrinhoq[], real carrinhop[], cadeia &tn, inteiro &totalenderecos, cadeia enderecos[])
	{
		cadeia n
		cadeia r
		cadeia enter
		inteiro opcao = 2
		
		enquanto (opcao != 3)
		{
		limpa()
		escreva("escreva o nome do produto que você deseja pesquisar\n")
		leia(n)
		procurar(totalprodutos, nome, achou, n, posicao)
		se(achou == verdadeiro)
		{
			limpa()
			escreva("Produto encontrado:\n")
			escreva("Nome do produto: ", nome[posicao], " | Quantidade disponivel: ", quantidade[posicao], " | Preço do produto:R$", preco[posicao], "\n")
			escreva("Colocar no carrinho     |--------  Tecle 1\n")
			escreva("Procurar outro produto  |--------  Tecle 2\n")
			escreva("Voltar para o menu      |--------  Tecle 3\n")
			leia(opcao)
			se(opcao == 1)
			{
				logico saindo = falso
				
				adicionar(nome, quantidade, preco, carrinhon, carrinhoq, carrinhop, totalcarrinho, posicao, totalenderecos, enderecos, saindo, totalprodutos)
				se(saindo == verdadeiro)
				{
					opcao = 3
				}
			}
			se(opcao == 3)
			{
				limpa()
				animacao("Voltando para o menu inicial\n")
				tn = "nao"
			}
		}
		se (achou == falso)
		{
			limpa()
			escreva("Produto não encontrado\n")
			escreva("Tente novamente\n")
			escreva("Tecle 1 para pesquisar outro produto\n")
			escreva("Tecle 2 para voltar para o menu inicial\n")
			leia(opcao)
			se(opcao == 2)
			{
				opcao = 3
				tn = "nao"
			}
		}				
		}
	}
	funcao adicionar(cadeia nome[], real quantidade[], real preco[], cadeia carrinhon[], real carrinhoq[], real carrinhop[], inteiro &totalcarrinho, inteiro &posicao, inteiro &totalenderecos, cadeia enderecos[], logico &saindo, inteiro numeroproduto)
	{
		carrinhon[totalcarrinho] = nome[posicao]
		escreva("Escreva quantos produtos você quer(Disponivel: ", quantidade[posicao], ")\n")
		leia(carrinhoq[totalcarrinho])
		carrinhop[totalcarrinho] = preco[posicao]*carrinhoq[totalcarrinho]
		totalcarrinho++
		carrinho(carrinhon, carrinhoq, carrinhop, totalcarrinho, totalenderecos, enderecos, quantidade, saindo, preco, nome, numeroproduto)
	}
	funcao carrinho(cadeia carrinhon[], real carrinhoq[], real carrinhop[], inteiro &totalcarrinho, inteiro &totalenderecos, cadeia enderecos[], real quantidade[], logico &saindo, real preco[], cadeia nome[], inteiro numeroproduto)
	{
		inteiro opcao
		logico sair = falso
		logico achou = falso
		real valortotal = 0
		inteiro i = 0
		limpa()

		enquanto (sair == falso)
		{
			se (totalcarrinho == 0) 
			{
    				escreva("O carrinho está vazio!\n")
			}
			senao
			{
			exibircarri(totalcarrinho, carrinhon, carrinhoq, carrinhop)
			calcular(carrinhop, carrinhoq, totalcarrinho, valortotal)
			escreva("Valor Total do carrinho: ", valortotal,"\n")
			escreva("Finalizar compra                 |-------------  Tecle 1\n")
			escreva("Adcionar mais um produto         |-------------  Tecle 2\n")
			escreva("Editar quantidade de um produto  |-------------  Tecle 3\n")
			escreva("Excluir item do carrinho         |-------------  Tecle 4\n")
			leia(opcao)

			se(opcao == 1)
			{
				finalizar(totalcarrinho, carrinhon, carrinhoq, carrinhop, totalenderecos, enderecos, valortotal, quantidade)
				sair = verdadeiro
				saindo = verdadeiro
			}
			se(opcao == 2)
			{
				sair = verdadeiro
			}
			se(opcao == 3)
			{
				logico repetir = verdadeiro
				enquanto(repetir == verdadeiro)
				{
				mudarq(totalcarrinho, carrinhon, i, carrinhoq, carrinhop, repetir, preco, nome, numeroproduto)
				}
			}
			se(opcao == 4)
			{
				cadeia texto = " | Quantidade escolhida: "
				cadeia texto2 = " | Preço total do produto:R$"
				cadeia continua = "remover"
				cadeia mensagem = "remover do Carrinho?"
				cadeia completo = "removido"
				
				excluir(carrinhon, totalcarrinho, carrinhoq, carrinhop, texto, texto2, continua, mensagem, completo)
			}
			}
		}
	}
	funcao animacao(cadeia texto)
	{
		para(inteiro i = 0; i<3; i++)
		{
			limpa()
			escreva(texto)
			escreva("aguarde")
			para(inteiro n = 0; n<3; n++)
			{
				escreva(".")
				u.aguarde(500)
			}
			u.aguarde(1000)
		}
		limpa()
	}
	funcao finalizar(inteiro totalcarrinho, cadeia carrinhon[], real carrinhoq[], real carrinhop[], inteiro &totalendereco, cadeia enderecos[], real valortotal, real quantidade[])
	{
		inteiro formapagamento
		cadeia r
		cadeia escolhido = ""
		cadeia enter
		
		enquanto(escolhido == "")
		{
			endereco(totalendereco, enderecos, escolhido)
			se(escolhido == "")
			{
				escreva("Antes de continuar o processo, escolha um endereço")
				u.aguarde(10000)
			}
		}
		
		escreva("Qual é a forma de pagamento?")
		escreva(" 1 ---------> Pix\n")
		escreva(" 2 ---------> Débito\n")
		escreva(" 3 ---------> Crédito\n")
		escreva(" 4 ---------> Dinheiro\n")
		leia(formapagamento)
		se(formapagamento != 1 e formapagamento != 2 e formapagamento != 3 e formapagamento != 4)
		{
			escreva("Opção incorreta, tente novamente")
		}
		senao
		{
			limpa()
			escreva("Informações do pedido: \n")
			escreva("Todos os itens: \n")
			exibircarri(totalcarrinho, carrinhon, carrinhoq, carrinhop)
			escreva("Forma de pagamento: \n")
			se(formapagamento == 1)
			{
				escreva("Pix\n")	
			}
			se(formapagamento == 2)
			{
				escreva("Débito\n")
			}
			se(formapagamento == 3)
			{
				escreva("Crédito\n")
			}
			se(formapagamento == 4)
			{
				escreva("Dinheiro\n")
			}
			exibircarri(totalcarrinho, carrinhon, carrinhoq, carrinhop)
			escreva("Total: R$", valortotal, "\n")
			escreva(escolhido)
			escreva("Finalizar o pedido?\n")
			leia(r)
			se(r == "Sim" ou r == "sim" ou r == "SIM" ou r == "s" ou r == "S")
			{
				animacao("Gerando código do pix\n")
				limpa()
				escreva("Código gerado com sucesso\n")
				escreva("Copie o código a seguir: (Obs:aperte qualquer tecla para continuar)\n")
				escreva("0c274ffb-3285-4c9a-a4db-540ae98c8e30\n")
				leia(enter)
				para(inteiro n = 0; n<totalcarrinho; n++)
				{
					quantidade[n] = quantidade[n] - carrinhoq[n]
					carrinhon[n] = ""
					carrinhoq[n] = 0
					carrinhop[n] = 0
					totalcarrinho--
				}
			}
			
		}
	}
	funcao mudarq(inteiro &totalcarrinho, cadeia carrinhon[], inteiro i, real carrinhoq[], real carrinhop[], logico &repetir, real preco[], cadeia nome[], inteiro numeroproduto)
	{
		cadeia ajuda
		logico achou = falso
		cadeia r
		
		escreva("Escreva o nome do produto que você deseja editar a quantidade\n")
		leia(ajuda)
		procurar(totalcarrinho, carrinhon, achou, ajuda, i)
		se(achou == verdadeiro)
		{
			inteiro posicao = 0
			procurar(numeroproduto, nome, achou, carrinhon[i], posicao)
			cadeia resposta = "nao"
			enquanto(resposta == "Não" ou resposta == "não" ou resposta == "NÃO" ou resposta == "NAO" ou resposta == "nao" ou resposta == "Nao")
			{
				escreva("Digite a nova quantidade do produto ", carrinhon[i], "\n")
				leia(carrinhoq[i])
				carrinhop[i] = carrinhoq[i]*preco[posicao]
				limpa()
				escreva("Confirme as informações a seguir\n")
				escreva("Nome do produto: ", carrinhon[i], "\t Quantidade escolhida: ", carrinhoq[i], "\t Preco total do produto: R$ ", carrinhop[i], "\n")
				escreva("As informações estão corretas?\n")
				leia(resposta)
			}
			escreva("Deseja repetir o processo?")
			leia(r)
			se(r == "Não" ou r == "não" ou r == "NÃO" ou r == "n" ou r == "N" ou r == "nao" ou r == "Nao" ou r == "NAO")
			{
				repetir = falso
			}
		}
		se(achou == falso)
		{
			escreva("produto não está no carrinho\n")
			escreva("tente de novo com outro produto ou coloque ele no carrinho")
			u.aguarde(10000)
			repetir = falso
		}
	}
	funcao exibircarri(inteiro totalcarrinho, cadeia carrinhon[], real carrinhoq[], real carrinhop[])
	{
		para(inteiro n=0;n<totalcarrinho;n++)
			{
				escreva("Nome do produto: ", carrinhon[n], " | Quantidade escolhida: ", carrinhoq[n], " | Preço total do produto:R$", carrinhop[n], "\n")
				escreva("------------------------------------------------------------------------------------------------------------------------------------------------------\n")
			}
	}
	funcao endereco(inteiro &totalendereco,cadeia enderecos[], cadeia &escolhido)
	{
		inteiro n
		logico sair = falso
		logico sair1 = falso
		cadeia r = "nao"
		cadeia res
		inteiro opcao
		
		enquanto (sair == falso)
		{
		limpa()
		se(totalendereco == 1)
		{
			escreva("Nenhum endereco foi cadastrado ainda\n")
			enquanto (sair1 == falso)
			{
				escreva("Deseja cadastrar um novo endereço?\n")
				leia(res)
				se(res == "Sim" ou res == "sim" ou res == "SIM" ou res == "s" ou res == "S")
				{
					cadastrar(enderecos, totalendereco, sair)
				}
				senao
				{
					sair1 = verdadeiro
				}
			}
		}
		senao
		{
			enquanto(r == "Não" ou r == "não" ou r == "NÃO" ou r == "n" ou r == "N" ou r == "nao" ou r == "Nao" ou r == "NAO")
			{
				limpa()
				escreva("Endereços cadastrados:\n")
				para(inteiro i = 0; i<totalendereco; i++)
				{
					se(i != 0)
					{
						escreva(i, "-----> ", enderecos[i], "\n")
					}
				}
				escreva("Escolha um endereço ou tecle 0 para cadastrar um novo endereço ou para excluir um produto\n")
				leia(n)
				//verifica se o numero do usúario foi diferente de 0 para escolher um endereço
				se (n != 0)
				{
					//verifica se o usúario escolheu uma opção correta
					se (enderecos[n] == "")
					{
						//mostra para o usúario que ele escolheu uma opção incorreta
						escreva("Opção errada, tente novamente\n")
						u.aguarde(5000)
					}
					senao
					{
						limpa()
						//mostra para o usúario qual foi o endereço que ele escolheu
						escreva("Endereço escolhido:", enderecos[n], "\n")
						escreva("O endereço está certo?\n")
						leia(r)
						se(r != "Não" ou r != "não" ou r != "NÃO" ou r != "n" ou r != "N" ou r != "nao" ou r != "Nao" ou r != "NAO")
						{
							escolhido = enderecos[n]
							sair = verdadeiro
						}
					}
				}
				se (n == 0)
				{
					limpa()
					escreva("Cadastrar endereço |------- Tecle 1\n")
					escreva("Excluir endereço   |------- Tecle 2\n")
					leia(opcao)

					se(opcao == 1)
					{
					cadastrar(enderecos, totalendereco, sair)
					}
					se (opcao == 2)
					{
						cadeia no
						r = "não"
						inteiro totalproduto
		
						enquanto (r == "Não" ou r == "não" ou r == "NÃO" ou r == "Nao" ou r == "nao" ou r == "NAO" ou r == "n" ou r == "N")
						{
							limpa()
							inteiro posicao = 0
			
							escreva("Escreva o numero da posicao do endereço que você deseja excluir\n")
							leia(n)
							limpa()
							se (enderecos[n] == "")
							{
								limpa()
								escreva("Opção incorreta\n")
								escreva("Tente novamente ou cadastre ele antes de procurar\n")
								escreva("Deseja voltar para o menu inicial?\n")
								leia (r)
							}
							se(enderecos[n] != "")
							{
								limpa()
								escreva("Endereço: ", enderecos[n], "\n")
								escreva("É este o endereço que você deseja excluir? \n")
								leia(r)
								se(r == "sim" ou r == "Sim" ou r == "SIM" ou r == "s" ou r == "S")
								{
									escreva("Você tem certeza que deseja excluir o endereço ", enderecos[n], " ?\n")
									leia(res)
									se(res == "sim" ou res == "Sim" ou res == "SIM" ou res == "s" ou res == "S")
									{
										enderecos[n] = ""
										totalendereco--
										escreva("Produto excluido com sucesso\n")
									}
									se(res == "Não" ou res == "não" ou res == "NÃO" ou res== "Nao" ou res == "nao" ou res == "NAO" ou res == "n" ou res == "N")
									{
										escreva("Endereço não foi excluido tente novamente\n")
									}
									escreva("Deseja voltar para o menu inicial?\n")
									leia(r)
								}
							}
						}
					}
				}
				}
			}
		}
	}
	funcao cadastrar(cadeia enderecos[], inteiro &totalendereco, logico &sair1)
	{
		cadeia res

		limpa()
		escreva("Digite um novo endereço(Obs: escreva como no exemplo Ex: Avenida Brasil, 2026 - Nossa Sra. Aparecida\n")
		leia(enderecos[totalendereco])
		escreva("Confirme o endereço a seguir: \n")
		escreva(enderecos[totalendereco], "\n")
		escreva("O endereco está correto?\n")
		leia(res)
		se(res == "Sim" ou res == "sim" ou res == "SIM" ou res == "s" ou res == "S")
		{
			totalendereco++
			sair1 = verdadeiro
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 22599; 
 * @DOBRAMENTO-CODIGO = [189, 194, 203, 241, 255, 284, 360, 379, 432, 443, 456, 511, 520, 577, 593, 708, 716, 848];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */