package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
Letra=[a-zA-Z_]+
digito=[0-9]+
espacio=[ ,\t,\r\n]+
GUION_BAJO=[_]

%{
     private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%
( set )     {return new Symbol(sym.Set, yychar, yyline, yytext());}
( int )     {return new Symbol(sym.T_dato, yychar, yyline, yytext());}
( if ) {return new Symbol(sym.If, yychar, yyline, yytext());}
( puts )   {return new Symbol(sym.Puts, yychar, yyline, yytext());}
( while )   {return new Symbol(sym.While, yychar, yyline, yytext());}
( "main" )   {return new Symbol(sym.Main, yychar, yyline, yytext());}
( expr ) {return new Symbol(sym.Expr, yychar, yyline, yytext());}
{espacio} {/*Ignore*/} 
"//".* {/*Ignore*/}
( "=" ) {return new Symbol(sym.Igual, yychar, yyline, yytext());}
( "+" ) {return new Symbol(sym.Suma, yychar, yyline, yytext());}
"-" {return new Symbol(sym.Resta, yychar, yyline, yytext());}
"*" {return new Symbol(sym.Multiplicacion, yychar, yyline, yytext());}
"/" {return new Symbol(sym.Division, yychar, yyline, yytext());}
{Letra}{Letra}* {return new Symbol(sym.Cadena, yychar, yyline, yytext());}
{Letra}({Letra}|{digito}|GUION_BAJO)*   {return new Symbol(sym.Identificador, yychar, yyline, yytext());}
("(-"{digito}+")")|{digito}+  {return new Symbol(sym.Numero, yychar, yyline, yytext());}

/* Llave de apertura */
( "{" ) {return new Symbol(sym.Llave_a, yychar, yyline, yytext());}

/* Llave de cierre */
( "}" ) {return new Symbol(sym.Llave_c, yychar, yyline, yytext());}

/* Corchete de apertura */
( "[" ) {return new Symbol(sym.Corchete_a, yychar, yyline, yytext());}



/* Corchete de cierre */
( "]" ) {return new Symbol(sym.Corchete_c, yychar, yyline, yytext());}

/* Marcador de inicio de algoritmo */
( "main" ) {return new Symbol(sym.Main, yychar, yyline, yytext());}

/* Comillas */
( "\"" ) {return new Symbol(sym.Comillas, yychar, yyline, yytext());}

/* Dolar */
( "$" ) {return new Symbol(sym.Dolar, yychar, yyline, yytext());}

/* Punto y coma */
( ";" ) {return new Symbol(sym.P_coma, yychar, yyline, yytext());}
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}

