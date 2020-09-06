package gt.edu.url.compiladores.EvalarNumero;
%%
/*Esta clase va a indicar con que nombre va a generar el archivo Java*/
%class Operadores
/*Esto es para que la clase tenga su propio main*/
%standalone 
%line
%column
MENOS = "-"
MAS = "+"
PUNTO = "."
DECIMO = "E"
N0 = 0
NUMERO09 = [0-9]
NUMERO19 = [1-9]
/*Numero decimal valido*/
NUMERO_DECIMAL = {MENOS}?{NUMERO19}{NUMERO09}*{PUNTO}({NUMERO09}*{NUMERO19}|{N0})

/*Numero entoro valido*/
NUMERO_ENTERO = {MENOS}?{NUMERO19}{NUMERO09}*

/*Cadenas invalidas de numeros decimales: */
/*Numero decimal invalido con mas de un signo*/
NUMERO_DECIMAL_INVALIDO_1 = ({MENOS}|{MAS})({MENOS}|{MAS})+{NUMERO19}{NUMERO09}*{PUNTO}(({NUMERO09}*{NUMERO19})|{N0})
/*Numero decimal con ceros al inicio*/
NUMERO_DECIMAL_INVALIDO_2 = ({MENOS})?{N0}{NUMERO09}*{PUNTO}(({NUMERO09}*{NUMERO19})|{N0})
/*Numero decimal con mas de un punto*/
NUMERO_DECIMAL_INVALIDO_3 = {MENOS}?{NUMERO19}{NUMERO09}*{PUNTO}{PUNTO}+({NUMERO09}*{NUMERO19}|{N0})
/*Numero decimal con puntos y numeros intercalados o solo un punrto al final de la primera cifra*/
NUMERO_DECIMAL_INVALIDO_4 = {MENOS}?{NUMERO19}{NUMERO09}*{PUNTO}({PUNTO}|{NUMERO09})*

/*Numero entero invalalido con mas de un signo*/
NUMERO_ENTERO_INVALIDO = ({MENOS}|{MAS})({MENOS}|{MAS})+{NUMERO19}{NUMERO09}*

NOMEGLA_CIENTIFICA = ({NUMERO_DECIMAL}|{NUMERO_ENTERO}){DECIMO}{NUMERO_ENTERO}

%%
/*Seccione en donde indicamos como queremos encontrar la informacion*/
/*Esto indica que debe de hacer la variable, y es un codigo escrito en java*/


/*Forma correcta */
{NUMERO_DECIMAL} {
System.out.println("Numero con punto decimal valido: "+yytext());
}
/*Errores*/
{NUMERO_DECIMAL_INVALIDO_1} {
System.out.println("Numero invalido, el numero tiene las de un signo: "+yytext()+"\n"+"En la linea: "+yyline+"\n"+"En la columna: "+yycolumn);
}
{NUMERO_DECIMAL_INVALIDO_2} {
System.out.println("Numero invalido, el numero tiene ceros al inicio: "+yytext()+"\n"+"En la linea: "+yyline+"\n"+"En la columna: "+yycolumn);
}
{NUMERO_DECIMAL_INVALIDO_3} {
System.out.println("Numero invalido, el numero tine mas de un punto: "+yytext()+"\n"+"En la linea: "+yyline+"\n"+"En la columna: "+yycolumn);
}
{NUMERO_DECIMAL_INVALIDO_4} {
System.out.println("Numero invalido, error 4: "+yytext()+"\n"+"En la linea: "+yyline+"\n"+"En la columna: "+yycolumn);
}

{NUMERO_ENTERO_INVALIDO} {
System.out.println("Numero invalido, el numero tiene mas de un signo: "+yytext()+"\n"+"En la linea: "+yyline+"\n"+"En la columna: "+yycolumn);
}
/*correctos*/

{NUMERO_ENTERO} {
System.out.println("Numero entero valido: "+yytext());
}

{NOMEGLA_CIENTIFICA} {
System.out.println("Numero valido en nomenglatura cientifica: "+yytext());
}

.  {  }
