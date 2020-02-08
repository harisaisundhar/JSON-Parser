%{
#include <stdio.h>
int yywrap() { return 1;}
void yyerror(const char* s) {fprintf(stderr,"Error:%s.\n",s);}
%}


%token ALLELE_1 ALLELE_2 CHROM FATHER_ID GENOTYPES ID ILLNESS MARKER MARKERS MOTHER_ID NAME POSITION SAMPLE SAMPLES
%token BOOLEAN INTEGER STRING
%start linkage
%%

linkage: '{' markers ','  samples ',' genotypes '}' ;

markers: MARKERS ':' '[' marker_list ']';
marker_list: marker | marker_list ',' marker ;
marker: '{'
         ID ':' INTEGER ','
         NAME ':' STRING ','
         CHROM ':' STRING ','
         POSITION ':' INTEGER
        '}';



samples: SAMPLES ':' '[' sample_list ']';
sample_list: sample | sample_list ',' sample ;
sample: '{'
         ID ':' INTEGER ','
         NAME ':' STRING ','
         FATHER_ID ':' INTEGER ','
         MOTHER_ID ':' INTEGER ','
         ILLNESS ':' BOOLEAN
        '}';


genotypes: GENOTYPES ':' '[' genotype_list ']';
genotype_list: genotype | genotype_list ',' genotype;
genotype: '{'
         SAMPLE ':' INTEGER ','
         MARKER ':' INTEGER ','
         ALLELE_1 ':' STRING ','
         ALLELE_2 ':' STRING
        '}';
%%

int main(int argc,char** argv)
{
yyparse();
}
