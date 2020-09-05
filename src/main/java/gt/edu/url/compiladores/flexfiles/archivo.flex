package gt.edu.url.compiladores.EvalarNumero;
%%
/*Esta clase va a indicar con que nombre va a generar el archivo Java*/
%class Operadores
/*Esto es para que la clase tenga su propio main*/
%standalone 
%line
%column
MAS = "+"
MENOS = "-"
SIGNO = ({MAS}|{MENOS})?
NUMERO = [0-9]
CADENA = {SIGNO}{NUMERO}

 /*Estas variables son expresiones regulares*/

%%
/*Seccione en donde indicamos como queremos encontrar la informacion*/
/*Esto indica que debe de hacer la variable, y es un codigo escrito en java*/
{CADENA} {
System.out.println("Numero aceptado: "+yytext());
}

.  { }
