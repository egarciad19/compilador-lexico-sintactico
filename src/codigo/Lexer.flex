package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
Letra=[a-zA-Z_]+
GUION_BAJO=[_]
digito=[0-9]+
espacio=[ ,\t,\r]+
%{
    public String lexeme;
%}
%%
"//".* {/*Ignore*/}
{espacio} {/*Ignore*/}
set {lexeme=yytext(); return Set;}
if {lexeme=yytext(); return If;}
( "\n" ) {return Linea;}
"=" {return Igual;}
( "+" ) {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"/" {return Division;}
puts {lexeme=yytext(); return Puts;}
while {lexeme=yytext(); return While;}
main {lexeme=yytext(); return Main;}
int {lexeme=yytext(); return T_dato;}
expr {lexeme=yytext(); return Expr;}
( "{" ) {lexeme=yytext(); return Llave_a;}
( "}" ) {lexeme=yytext(); return Llave_c;}
( "[" ) {lexeme = yytext(); return Corchete_a;}
( "]" ) {lexeme = yytext(); return Corchete_c;}
( ";" ) {lexeme=yytext(); return P_coma;}
( "$" ) {lexeme=yytext(); return Dolar;}
( "\"" ) {lexeme=yytext(); return Comillas;}
{Letra}{Letra}* {lexeme=yytext(); return Cadena;}
{Letra}({Letra}|{digito}|GUION_BAJO)* {lexeme=yytext(); return Identificador;}
("(-"{digito}+")")|{digito}+ {lexeme=yytext(); return Numero;}
 . {return ERROR;}
