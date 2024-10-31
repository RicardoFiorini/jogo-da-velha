algoritmo "Jogo da Velha"
variáveis
    tabuleiro : vetor[1..3, 1..3] de caractere // matriz 3x3 para o tabuleiro
    jogadorAtual : caractere // 'X' ou 'O'
    linha, coluna : inteiro // posição da jogada
    jogadas : inteiro // contador de jogadas
    vencedor : lógico // indica se há um vencedor
início
    // Função para inicializar o tabuleiro com espaços vazios
    funcao inicializarTabuleiro()
        para i de 1 até 3 faça
            para j de 1 até 3 faça
                tabuleiro[i, j] ← ' '
            fimpara
        fimpara
    fimenquanto

    // Função para exibir o tabuleiro atualizado
    funcao exibirTabuleiro()
        escreva("\n   1   2   3\n")
        para i de 1 até 3 faça
            escreva(i, " ")
            para j de 1 até 3 faça
                escreva(" ", tabuleiro[i, j])
                se j < 3 então
                    escreva(" |")
                fimse
            fimpara
            se i < 3 então
                escreva("\n  ---+---+---\n")
            fimse
        fimpara
        escreva("\n")
    fimenquanto

    // Função para alternar o jogador atual
    funcao alternarJogador()
        se jogadorAtual = 'X' então
            jogadorAtual ← 'O'
        senão
            jogadorAtual ← 'X'
        fimse
    fimenquanto

    // Função para verificar se há um vencedor
    funcao verificarVencedor() : lógico
        para i de 1 até 3 faça
            // Verifica linhas e colunas
            se (tabuleiro[i, 1] = jogadorAtual e tabuleiro[i, 2] = jogadorAtual e tabuleiro[i, 3] = jogadorAtual) ou
               (tabuleiro[1, i] = jogadorAtual e tabuleiro[2, i] = jogadorAtual e tabuleiro[3, i] = jogadorAtual) então
                retorne verdadeiro
            fimse
        fimpara
        // Verifica diagonais
        se (tabuleiro[1, 1] = jogadorAtual e tabuleiro[2, 2] = jogadorAtual e tabuleiro[3, 3] = jogadorAtual) ou
           (tabuleiro[1, 3] = jogadorAtual e tabuleiro[2, 2] = jogadorAtual e tabuleiro[3, 1] = jogadorAtual) então
            retorne verdadeiro
        fimse
        retorne falso
    fimenquanto

    // Inicializa o jogo
    inicializarTabuleiro()
    jogadorAtual ← 'X'
    jogadas ← 0
    vencedor ← falso

    escreva("=== Bem-vindo ao Jogo da Velha! ===\n")

    // Loop principal do jogo
    repita
        exibirTabuleiro()
        escreva("\nJogador ", jogadorAtual, ", é sua vez!\n")
        
        // Solicita a posição da jogada
        escreva("Digite a linha (1-3): ")
        leia(linha)
        escreva("Digite a coluna (1-3): ")
        leia(coluna)

        // Verifica se a jogada é válida
        se linha < 1 ou linha > 3 ou coluna < 1 ou coluna > 3 então
            escreva("Posição inválida! Tente novamente.\n")
        senão
            se tabuleiro[linha, coluna] <> ' ' então
                escreva("A posição já está ocupada! Escolha outra.\n")
            senão
                // Realiza a jogada
                tabuleiro[linha, coluna] ← jogadorAtual
                jogadas ← jogadas + 1

                // Verifica se houve um vencedor
                vencedor ← verificarVencedor()
                se vencedor então
                    exibirTabuleiro()
                    escreva("Parabéns, jogador ", jogadorAtual, "! Você venceu o jogo!\n")
                fimse

                // Alterna para o próximo jogador, caso não haja vencedor
                se não vencedor então
                    alternarJogador()
                fimse
            fimse
        fimse
    até vencedor ou jogadas = 9

    // Verifica se houve empate
    se não vencedor então
        exibirTabuleiro()
        escreva("O jogo terminou em empate!\n")
    fimse

    escreva("=== Fim do jogo ===\n")
fimalgoritmo
