%pointer
%option noyywrap

 /* ── Sección de definiciones ERX ───────────────────────────────────────
   Las definiciones permiten nombrar expresiones regulares para reutilizarlas.
   Formato:   nombre   expresion_regular
   Uso en reglas:  {nombre}
   ─────────────────────────────────────────────────────────────────── */

 /* Definición ya dada como ejemplo: */
digitoHexa      [0-9a-fA-F]

digito          [0-9]

letra           [a-zA-Z_]

identificador   {letra}({letra}|{digito})*

%%

 /* ── Reglas usando las definiciones ─────────────────────────────────── */

 /* Regla ya dada como ejemplo: usa {digitoHexa} y muestra yyleng */
0[xX]{digitoHexa}+  { printf("constante hexadecimal de longitud %d: %s\n", yyleng, yytext); }

[1-9]{digito}*  { printf("constante decimal de longitud %d: %s\n", yyleng, yytext); }

{identificador}  { printf("identificador de longitud %d: %s\n", yyleng, yytext); }

[ \t\n]     { }
.           { printf("caracter no reconocido: %s\n", yytext); }

%%

int main(void) {
    yylex();
    return 0;
}
