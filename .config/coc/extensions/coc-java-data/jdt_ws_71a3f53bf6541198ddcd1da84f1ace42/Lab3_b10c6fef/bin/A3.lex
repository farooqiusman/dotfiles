import java_cup.runtime.*;
%%

%implements java_cup.runtime.Scanner
%function next_token
%type Symbol
%class A3Scanner
%eofval{ return null;
%eofval}

%state QUOTE, COMMENT

IDENTIFIER = [a-zA-Z][a-zA-Z0-9]*
NUMBER = [0-9]+\.[0-9]+|[0-9]+
%%
<YYINITIAL> "\"" { yybegin(QUOTE); }
<QUOTE> "\"" { yybegin(YYINITIAL); System.out.println("[" + yytext() + "] -> QUOTE"); return new Symbol(A3Symbol.QUOTE); }
<QUOTE>. {}

<YYINITIAL> "/**" { yybegin(COMMENT); }
<COMMENT> "**/" { yybegin(YYINITIAL); }
<COMMENT>. {}

<YYINITIAL>"STRING" { System.out.println("[" + yytext() + "] -> STRING"); return new Symbol(A3Symbol.STRING); }
<YYINITIAL>"INT" { System.out.println("[" + yytext() + "] -> INT"); return new Symbol(A3Symbol.INT); }
<YYINITIAL>"REAL" { System.out.println("[" + yytext() + "] -> REAL"); return new Symbol(A3Symbol.REAL); }
<YYINITIAL>"BEGIN" { System.out.println("[" + yytext() + "] -> BEGIN"); return new Symbol(A3Symbol.BEGIN); }
<YYINITIAL>"END" { System.out.println("[" + yytext() + "] -> END"); return new Symbol(A3Symbol.END); }
<YYINITIAL>"IF" { System.out.println("[" + yytext() + "] -> IF"); return new Symbol(A3Symbol.IF); }
<YYINITIAL>"ELSE" { System.out.println("[" + yytext() + "] -> ELSE"); return new Symbol(A3Symbol.ELSE); }
<YYINITIAL>"READ" { System.out.println("[" + yytext() + "] -> READ"); return new Symbol(A3Symbol.READ); }
<YYINITIAL>"WRITE" { System.out.println("[" + yytext() + "] -> WRITE"); return new Symbol(A3Symbol.WRITE); }
<YYINITIAL>"RETURN" { System.out.println("[" + yytext() + "] -> RETURN"); return new Symbol(A3Symbol.RETURN); }
<YYINITIAL>"MAIN" { System.out.println("[" + yytext() + "] -> MAIN"); return new Symbol(A3Symbol.MAIN); }

<YYINITIAL>"+" { System.out.println("[" + yytext() + "] -> PLUS"); return new Symbol(A3Symbol.PLUS); }
<YYINITIAL>"-" { System.out.println("[" + yytext() + "] -> MINUS"); return new Symbol(A3Symbol.MINUS); }
<YYINITIAL>"*" { System.out.println("[" + yytext() + "] -> TIMES"); return new Symbol(A3Symbol.TIMES); }
<YYINITIAL>"/" { System.out.println("[" + yytext() + "] -> DIVIDE"); return new Symbol(A3Symbol.DIVIDE); }
<YYINITIAL>"==" { System.out.println("[" + yytext() + "] -> EQUALTO"); return new Symbol(A3Symbol.EQUALTO); }
<YYINITIAL>"!=" { System.out.println("[" + yytext() + "] -> NOTEQUALTO"); return new Symbol(A3Symbol.NOTEQUALTO); }
<YYINITIAL>"," { System.out.println("[" + yytext() + "] -> COMMA"); return new Symbol(A3Symbol.COMMA); }
<YYINITIAL>"(" { System.out.println("[" + yytext() + "] -> LPAREN"); return new Symbol(A3Symbol.LPAREN); }
<YYINITIAL>")" { System.out.println("[" + yytext() + "] -> RPAREN"); return new Symbol(A3Symbol.RPAREN); }
<YYINITIAL>";" { System.out.println("[" + yytext() + "] -> SEMICOLON"); return new Symbol(A3Symbol.SEMICOLON); }
<YYINITIAL>":=" { System.out.println("[" + yytext() + "] -> EQUALS"); return new Symbol(A3Symbol.EQUALS); }

<YYINITIAL> {IDENTIFIER} { System.out.println("[" + yytext() + "] -> IDENTIFIER"); return new Symbol(A3Symbol.IDENTIFIER); }
<YYINITIAL> {NUMBER} { System.out.println("[" + yytext() + "] -> NUMBER"); return new Symbol(A3Symbol.NUMBER); }  
\r|\n|\t|" " {}
. { System.out.println("[" + yytext() + "] -> error"); return new Symbol(A3Symbol.error); }
