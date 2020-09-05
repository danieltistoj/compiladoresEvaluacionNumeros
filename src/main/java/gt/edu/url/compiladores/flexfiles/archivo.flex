package gt.edu.url.compiladores.EvalarNumero;
%%
/*Esta clase va a indicar con que nombre va a generar el archivo Java*/
%class Operadores
/*Esto es para que la clase tenga su propio main*/
%standalone 
%line
%column
MENOS = "-"
PUNTO = "."
N0 = 0
SIGNO = ({MENOS})?
NUMERO09 = [0-9]
NUMERO19 = [1-9]
NUMERO_DECIMAL = {SIGNO}{NUMERO19}{NUMERO09}*{PUNTO}({NUMERO09}*{NUMERO19}|{N0})
NUMERO_ENTERO = {SIGNO}{NUMERO19}{NUMERO09}*



 /*Estas variables son expresiones regulares*/


%%
/*Seccione en donde indicamos como queremos encontrar la informacion*/
/*Esto indica que debe de hacer la variable, y es un codigo escrito en java*/
{NUMERO_DECIMAL} {
System.out.println("Numero con punto decimal valido: "+yytext());
}
{NUMERO_ENTERO} {
System.out.println("Numero entero valido: "+yytext());
}

.  { }
