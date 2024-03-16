import java_cup.runtime.*;
%%

%{
    Symbol f(int num){
    System.out.println(yytext() + " " + num);
        return new Symbol(num);
    }
%}

%cup
%class A3Scanner
%eofval{ return null;
%eofval}
%state COMMENT

Id = [a-zA-Z][a-zA-Z0-9]*
NUMBER = [0-9]*[.]?[0-9]*
QString = \"[^\"]*\"
%%
<YYINITIAL>"/**" {yybegin (COMMENT);}
<COMMENT>"**/" {yybegin(YYINITIAL);}
<COMMENT>.|\r|\n {}
<YYINITIAL> {QString} { return f(A3Symbol.QString); }
<YYINITIAL>"IF" { return f(A3Symbol.IF); }
<YYINITIAL>"REAL" { return f(A3Symbol.REAL); }
<YYINITIAL>"INT" { return f(A3Symbol.INT); }
<YYINITIAL>"MAIN" { return f(A3Symbol.MAIN); }
<YYINITIAL>"END" { return f(A3Symbol.END); }
<YYINITIAL>"BEGIN" { return f(A3Symbol.BEGIN); }
<YYINITIAL>"RETURN" { return f(A3Symbol.RETURN); }
<YYINITIAL>"READ" { return f(A3Symbol.READ); }
<YYINITIAL>"WRITE" { return f(A3Symbol.WRITE); }
<YYINITIAL>"STRING" { return f(A3Symbol.STRING); }
<YYINITIAL>"ELSE" { return f(A3Symbol.ELSE); }
<YYINITIAL>"+" { return f(A3Symbol.PLUS); }
<YYINITIAL>"-" { return f(A3Symbol.MINUS); }
<YYINITIAL>"*" { return f(A3Symbol.TIMES); }
<YYINITIAL>"/" { return f(A3Symbol.DIVIDE); }
<YYINITIAL>"(" { return f(A3Symbol.LPAREN); }
<YYINITIAL>")" { return f(A3Symbol.RPAREN); }
<YYINITIAL>"," { return f(A3Symbol.COMMA); }
<YYINITIAL>";" { return f(A3Symbol.SEMI); }
<YYINITIAL>"==" { return f(A3Symbol.EQ); }
<YYINITIAL>"!=" { return f(A3Symbol.NOTEQ); }
<YYINITIAL> {Id} { return f(A3Symbol.Id); }
<YYINITIAL> {NUMBER} { return f(A3Symbol.number); }
\r|\n|\t|" " {}
. { return f(A3Symbol.error);}
