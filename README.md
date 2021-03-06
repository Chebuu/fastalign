
# fastalign

<!-- badges: start -->
<!-- badges: end -->

A (slow) sequence alignment-themed R package + shiny GUI.

# Installation
``` r
devtools::install_github("chebuu/fastalign")

library(fastalign)

help("fastalign")
```

# Shiny app
```r
fastalign::launchApp()
```

# Manuscript
```r
vignette("Manuscript", "fastalign")
```
## Annotations
### Q8GTB6 
#### Features
Binding site 292 (Substrate)

Binding site 417 (Substrate)

Active site	 484 (Proton acceptor)

#### Mutagenesis
92  H → A: "No effect"          
108 R → A: "Strongly reduced catalytic activity"            
110 R → A: "Strongly reduced catalytic activity"            
114 H → A: "Loss of FAD binding and loss of catalytic activity. 2 Publications"         
208 H → A: "No effect"          
292 H → A: "Strongly reduced catalytic activity"            
417 Y → F: "Reduced catalytic activity"         
442 E → Q: "Slightly reduced catalytic activity"            
484 Y → F: "Loss of catalytic activity"         

#### Molecule processing
Signal peptide  1 – 28          
Chain (THCAS)	29 – 545            

#### Amino acid modifications
Disulfide bond	37 ↔ 99	1             
Cross-link	    114 ↔ 176	6-(S-cysteinyl)-8alpha-(pros-histidyl)-FAD (His-Cys)            

#### Glycosylation sites
65	N-linked asparagine (GlcNAc...)          
89	N-linked asparagine (GlcNAc...)          
168	N-linked asparagine (GlcNAc...)          
297	N-linked asparagine (GlcNAc...)          
305	N-linked asparagine (GlcNAc...)          
329	N-linked asparagine (GlcNAc...)          
467	N-linked asparagine (GlcNAc...)          
499	N-linked asparagine (GlcNAc...)          

#### Domains and Repeats
Domain	77 – 251	FAD-binding             

#### Compositional bias
Compositional bias	232 – 235	Poly-Gly   

### Genetic Code
#### Triplet Translations
Ala/A GCT, GCC, GCA, GCG          
Arg/R CGT, CGC, CGA, CGG, AGA, AGG          
Asn/N AAT, AAC          
Asp/D GAT, GAC          
Cys/C TGT, TGC          
Gln/Q CAA, CAG          
Glu/E GAA, GAG          
Gly/G GGT, GGC, GGA, GGG          
His/H CAT, CAC          
Ile/I ATT, ATC, ATA           
Leu/L TTA, TTG, CTT, CTC, CTA, CTG          
Lys/K AAA, AAG          
Met/M ATG           
Phe/F TTT, TTC          
Pro/P CCT, CCC, CCA, CCG          
Ser/S TCT, TCC, TCA, TCG, AGT, AGC          
Thr/T ACT, ACC, ACA, ACG          
Trp/W TGG           
Tyr/Y TAT, TAC          
Val/V GTT, GTC, GTA, GTG          
START ATG           
STOP TAG, TGA, TAA          

#### Codon Usage
[triplet] [frequency: per thousand] ([number])      
UUU 33.5(   130)  UCU 15.0(    58)  UAU 30.7(   119)  UGU  5.9(    23)      
UUC 22.7(    88)  UCC  9.3(    36)  UAC 13.9(    54)  UGC  8.3(    32)      
UUA 20.6(    80)  UCA 18.8(    73)  UAA  1.5(     6)  UGA  0.3(     1)      
UUG 23.7(    92)  UCG  6.2(    24)  UAG  0.3(     1)  UGG 17.8(    69)      

CUU 20.9(    81)  CCU 17.8(    69)  CAU 19.6(    76)  CGU  6.5(    25)      
CUC  9.3(    36)  CCC  4.6(    18)  CAC  8.0(    31)  CGC  2.3(     9)      
CUA  7.2(    28)  CCA 16.0(    62)  CAA 27.1(   105)  CGA  7.2(    28)      
CUG  3.1(    12)  CCG  1.3(     5)  CAG  4.1(    16)  CGG  1.5(     6)      

AUU 37.7(   146)  ACU 22.7(    88)  AAU 46.7(   181)  AGU 15.5(    60)      
AUC 14.7(    57)  ACC  9.8(    38)  AAC 17.5(    68)  AGC  5.7(    22)      
AUA 24.3(    94)  ACA 18.1(    70)  AAA 43.1(   167)  AGA 16.5(    64)      
AUG 26.3(   102)  ACG  2.6(    10)  AAG 28.1(   109)  AGG  6.7(    26)      

GUU 28.6(   111)  GCU 24.5(    95)  GAU 37.7(   146)  GGU 21.2(    82)      
GUC 10.8(    42)  GCC  5.2(    20)  GAC  9.5(    37)  GGC  9.0(    35)      
GUA 11.6(    45)  GCA 14.2(    55)  GAA 37.9(   147)  GGA 24.0(    93)      
GUG  8.0(    31)  GCG  6.5(    25)  GAG 22.7(    88)  GGG  7.2(    28)   
