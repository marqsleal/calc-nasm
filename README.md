# Projeto: Calculadora em C e Assembly
Este projeto implementa uma calculadora que realiza operações matemáticas básicas (adição, subtração, multiplicação e divisão) implementando operações escritas em **Assembly** em um fluxo escrito em **C**.

## Ferramentas Necessárias:
### GCC (GNU Compiler Colection):
```bash
sudo apt install gcc
```
### NASM (Netwide Assembler):
```bash
sudo apt install nasm
```
### Make:
```bash
sudo apt install make
```

## Estrutura do projeto:
### Arquivos `.asm`:
`sum.asm`: Operação de adição;  
`subtract.asm`: Operação de subtração;  
`multiplication.asm`: Operação de multiplicação;  
`division.asm`: Operação de divisão.  
### Arquivos `.c`:
`main.c`: Controle de fluxo do programa.
### Compilação:
`Makefile`: Ferramenta de automação para compilação.

## Compilação do projeto:
Para compilar o projeto, execute o comando:
```bash
make
```

Para limpar arquivos desnecessários, execute:
```bash
make clean
```

## Execução do projeto:
Para executar a calculadora, execute o programa com a seguinte estrutura:
```bash
./calc.out <operation> <num1> <num2>
```
Onde:  
- `<operacao>`: Nome da operação ("sum", "sub", "mult", ou "div");

- `<numero1>` e `<numero2>`: Os dois operandos para a operação.

### Exemplo:
Input:
```bash
./calc.out sum 17 24
```
Output:
```bash
17 sum 24 = 41
```

