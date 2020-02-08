%{
#include <stdio.h>
#include "sample.tab.h"
%}
%%
"\"allele-1\""      return ALLELE_1;
"\"allele-2\""      return ALLELE_2;
"\"chrom\"" return CHROM;
"\"father-id\"" return FATHER_ID;
"\"mother-id\"" return MOTHER_ID;
"\"id\""    return ID;
"\"markers\""       return MARKERS;
"\"marker\""        return MARKER;
"\"illness\""       return ILLNESS;
"\"genotypes\"" return GENOTYPES;
"\"name\""  return NAME;
"\"position\""      return POSITION;
"\"samples\""       return SAMPLES;
"\"sample\""        return SAMPLE;
true            return BOOLEAN;
false           return BOOLEAN;
[0-9]+          return INTEGER;
\"[^\"]*\"       return STRING;
[ \n\t\r]       ;
.               return yytext[0];
%%
