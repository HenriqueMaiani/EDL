Trabalho 01: Estrutura de Linguagens UERJ: 2016.1
Aluno: Henrique Trinas Maiani Matrícula:201410050811

Origem do C# (Sharp):
A linguagem C# foi criada junto com a arquitetura .NET existe outras linguagens que suportam essa tecnologia, porém C# é considerado é considerado símbolo do .NET.
A criação da linguagem, foi feita por vários desenvolvedores, mas ela é atribuída principalmente a Anders Hejlsberg (uma de suas criações é o Delphi), ao contrário de linguagens prioritárias como Visual Basic, a Microsoft submeteu o C# a ECMA para uma padronização formal e em dezembro de 2003 tornou-se um padrão ISO.

Classificação:
C# é uma linguagem totalmente Orientada a Objetos (OO) e de tipos protegidos;
Suporta métodos de tipos genéricos, como uma linguagem OO o C# suporta conceitos de encapsulamento, herança e polimorfismo. Além dos princípios básicos OO o C# facilita o desenvolvimento de componentes de software por meio de vários constructos (Assinaturas de métodos encapsulados, Propriedades, Atributos, Comentários XML, LINQ, ...), o C# suporta ponteiros.

Exemplos de códigos:
Hello Word:
using System;
public class ClasseExemplo {
public static void Main() {
Console.WriteLine("Hello Word!");
}
}
}
Vetores:
public static void Main(string[] args) {
int[] primos = {2,3,5,7,11,13,17,29,23,29,31};
int[] somas = new int[11];
for(int i = 0; i < 11; i++) {
somas[i] = 0;
for(int j = 0; j <= i; j++) {
somas[i] += primos[j];
}
}
Console.Write("somas: ", somas);
for(int i = 0; i < 11; i++) {
Console.Write(" {0}", somas[i]);
}
Console.WriteLine();
}
Herança:
using System;

public class Animal{
private string raca;

public Animal(string raca) {
Raca = raca;
}
public string Raca {
get { return raca; }
set { raca = value; }
}
public void Respirar() {
// …
}
}
public class Cachorro : Animal {
public Cachorro(string raca) : base(raca) {}
}
namespace Hello{
public class Application {
static void Main() {
Cachorro cachorro = new Cachorro("beagle");
cachorro.Respirar();
}
}

Conversão de tipo:
// converte uma string para um byte
byte numero8bits = Convert.ToByte("123");
// converte uma string para um short
short numero16bits = Convert.ToInt16("1024");
// converte uma string para um int
int numero32bits = Convert.ToInt32("34123");
// converte uma string para um double
double numeroReal64bits = Convert.ToDouble("132123.12455");
// converte um inteiro para uma string
string palavra1 = Convert.ToString(123);
// outra forma de se obter o mesmo resultado anterior
string palavra2 = 123.ToString();

Comparações:
C e C++:
Membros de enumeração são colocados em seu próprio espaço de nomes (namespace)
A sintaxe para a declaração de vetores é diferente ("int[] a = new int[5]" ao invés de "int a[5]").
Ponteiros e aritmética sem checagem só podem ser utilizados em uma modalidade especial chamada modo inseguro (unsafe mode).
* Objetos não são liberados explicitamente, mas através de um processo de coleta de lixo (garbage collector) quando não há referências aos mesmos, prevenindo assim referências inválidas.
C# é mais seguro com tipos que C++. As únicas conversões implícitas por default são conversões seguras, tais como ampliação de inteiros e conversões de um tipo derivado para um tipo base. Não existem conversões implícitas entre inteiros e variáveis lógicas ou enumerações. Não existem ponteiros nulos (void pointers). E qualquer conversão implícita definida pelo usuário deve ser marcada explicitamente.
Não é permitida herança múltipla, mas uma classe pode implementar várias interfaces abstratas. O objetivo principal é simplificar a implementação do ambiente de execução.
Java:
O Java utiliza comentários Javadoc e o C# utiliza comentários baseados em XML.
O C# possui indexadores. O Java tem Listeners.
O Java utiliza a JVM, o C# o .Net Framework, Mono e DotGnu.
Um dos principais editores do Java é o Eclipse, o do C# é o Visual Studio. Mas ambos têm compiladores de linha de comando.


Fontes:
PORTAL EDUCAÇÃO - Cursos Online;
Wikipédia: https://pt.wikipedia.org/wiki/C_Sharp#Etimologia;
Use a cabeça C# (Andrew Stellman and Jennifer Greene).