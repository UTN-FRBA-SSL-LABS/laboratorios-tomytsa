%pointer
%option noyywrap

%%

 /* ── Reglas ya implementadas ────────────────────────── */

 /* Constante octal: 0 seguido de dígitos octales (o solo 0) */
0[0-7]*         { printf("constante octal: %s\n", yytext); }

 /* Ignorar espacios, tabs y saltos de línea */
[ \t\n]         { }

  /* Constante decimal: sin cero inicial */
[1-9][0-9]*        { printf("constante decimal: %s\n", yytext); }

 /* Constante hexadecimal: 0x o 0X seguido de digitos hexadecimales */
0[xX][0-9a-fA-F]+  { printf("constante hexadecimal: %s\n", yytext); }

 /* Identificador: letra o _ seguido de letras, digitos o _ */
[a-zA-Z_][a-zA-Z_0-9]*  { printf("identificador: %s\n", yytext); }

 /* Comodin: cualquier caracter no reconocido */
.                  { printf("caracter no reconocido: %s\n", yytext); }
%%

int main(void) {
    yylex();
    return 0;
}
