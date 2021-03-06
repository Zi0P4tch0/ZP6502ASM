%{
    /////////////////////////////////////////////////////////////////////////////////////
    //                                                                                 //
    //  The MIT License (MIT)                                                          //
    //                                                                                 //
    //  Copyright (c) 2014 Matteo Pacini                                               //
    //                                                                                 //
    //  Permission is hereby granted, free of charge, to any person obtaining a copy   //
    //  of this software and associated documentation files (the "Software"), to deal  //
    //  in the Software without restriction, including without limitation the rights   //
    //  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell      //
    //  copies of the Software, and to permit persons to whom the Software is          //
    //  furnished to do so, subject to the following conditions:                       //
    //                                                                                 //
    //  The above copyright notice and this permission notice shall be included in     //
    //  all copies or substantial portions of the Software.                            //
    //                                                                                 //
    //  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR     //
    //  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,       //
    //  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE    //
    //  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER         //
    //  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,  //
    //  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN      //
    //  THE SOFTWARE.                                                                  //
    //                                                                                 //
    /////////////////////////////////////////////////////////////////////////////////////
    
    ////////////
    // MACROS //
    ////////////

    #define TOKEN(t) (yylval.token = t)
    
    ///////////
    // BISON //
    ///////////
    
    #import "parser.h"
    
%}

%option nounput noinput noyywrap
%option caseless

%x COMMENT

%%

[\n\r\t ]+                              /* Eat whitespaces */

";"                                     BEGIN(COMMENT);
<COMMENT>[\n\r]                         BEGIN(INITIAL);
<COMMENT>.*                             /* Eat the current comment */

","                                     return TOKEN(TCOMMA);
":"                                     return TOKEN(TCOLON);
"("                                     return TOKEN(TLPAR);
")"                                     return TOKEN(TRPAR);
"$"                                     return TOKEN(TDOLLAR);
"#"                                     return TOKEN(THASH);

[0-9A-F]{2}                             yylval.uint8 = (uint8_t)strtoul(yytext,NULL,16); return TUINT8;
[0-9A-F]{4}                             yylval.uint16 = (uint16_t)strtoul(yytext,NULL,16); return TUINT16;

"ADC"                                   return TOKEN(TADC);
"AND"                                   return TOKEN(TAND);
"ASL"                                   return TOKEN(TASL);
"BIT"                                   return TOKEN(TBIT);
"BRK"                                   return TOKEN(TBRK);
"CMP"                                   return TOKEN(TCMP);
"CPX"                                   return TOKEN(TCPX);
"CPY"                                   return TOKEN(TCPY);
"DEC"                                   return TOKEN(TDEC);
"EOR"                                   return TOKEN(TEOR);
"CLC"                                   return TOKEN(TCLC);
"SEC"                                   return TOKEN(TSEC);
"CLI"                                   return TOKEN(TCLI);
"SEI"                                   return TOKEN(TSEI);
"CLV"                                   return TOKEN(TCLV);
"CLD"                                   return TOKEN(TCLD);
"SED"                                   return TOKEN(TSED);
"INC"                                   return TOKEN(TINC);
"JMP"                                   return TOKEN(TJMP);
"JSR"                                   return TOKEN(TJSR);
"LDA"                                   return TOKEN(TLDA);
"LDX"                                   return TOKEN(TLDX);
"LDY"                                   return TOKEN(TLDY);
"LSR"                                   return TOKEN(TLSR);
"NOP"                                   return TOKEN(TNOP);
"ORA"                                   return TOKEN(TORA);
"TAX"                                   return TOKEN(TTAX);
"TXA"                                   return TOKEN(TTXA);
"DEX"                                   return TOKEN(TDEX);
"INX"                                   return TOKEN(TINX);
"TAY"                                   return TOKEN(TTAY);
"TYA"                                   return TOKEN(TTYA);
"DEY"                                   return TOKEN(TDEY);
"INY"                                   return TOKEN(TINY);
"ROL"                                   return TOKEN(TROL);
"ROR"                                   return TOKEN(TROR);
"RTI"                                   return TOKEN(TRTI);
"RTS"                                   return TOKEN(TRTS);
"SBC"                                   return TOKEN(TSBC);
"STA"                                   return TOKEN(TSTA);
"TXS"                                   return TOKEN(TTXS);
"TSX"                                   return TOKEN(TTSX);
"PHA"                                   return TOKEN(TPHA);
"PLA"                                   return TOKEN(TPLA);
"PHP"                                   return TOKEN(TPHP);
"PLP"                                   return TOKEN(TPLP);
"STX"                                   return TOKEN(TSTX);
"STY"                                   return TOKEN(TSTY);

"A"                                     return TOKEN(TREGA);
"X"                                     return TOKEN(TREGX);
"Y"                                     return TOKEN(TREGY);

%%
