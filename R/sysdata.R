#' #' @title Dataset `Z18_CBDAS`
#' #' @details Fig. 6B (Zirpel et al., 2018)
#' #' #' @format (Names: dact = "Percent change Kcat compared to WT", res1a = "WT residue", pos1 = "Homologous position in WT", res1b = "Mutant residue").
#' #' @source https://doi.org/10.1016/j.jbiotec.2018.07.031
#' Z18_CBDAS <- data.frame(
#'   actv =
#'         c(2.84,1.33,-0.99,-1.00,3.37,-0.75,-0.80,-0.84,-0.45,-0.35,4.14,3.63,2.17),
#'
#'   res1a = c(  'S', 'S', 'S', 'S', 'A', 'A', 'L', 'A', 'I', 'I', 'A', 'S', 'S'),
#'   pos1  = c(  116, 118, 116, 116, 414, 414, 414, 414, 445, 445, 414, 116, 116),
#'   res1b = c(  'A', 'G', 'V', 'L', 'V', 'T', 'L', 'I', 'T', 'T', 'V', 'A', 'A'),
#'
#'
#'   res2a = c(  NA , NA , NA , NA , NA , NA , NA , NA , NA , 'C', 'A', 'A', 'A'),
#'   pos2  = c(  NA , NA , NA , NA , NA , NA , NA , NA , NA , 446,  46,  46, 414),
#'   res2b = c(  NA , NA , NA , NA , NA , NA , NA , NA , NA , 'A', 'V', 'V', 'V'),
#'
#'   res3a = c(  NA , NA , NA , NA , NA , NA , NA , NA , NA , NA , 'T', 'T', NA ),
#'   pos3  = c(  NA , NA , NA , NA , NA , NA , NA , NA , NA , NA ,  47,  47, NA ),
#'   res3b = c(  NA , NA , NA , NA , NA , NA , NA , NA , NA , NA , 'A', 'A', NA )
#' )
#'
#' usethis::use_data(Z18_CBDAS, overwrite = TRUE)
#'
#' #' @title Dataset `Z18_THCAS`
#' #' @details Fig. 6C Zirpel et al., 2018
#' #' @format (Names: dact = "Percent change Kcat compared to WT", res1a = "WT residue", pos1 = "Homologous position in WT", res1b = "Mutant residue").
#' #' @source https://doi.org/10.1016/j.jbiotec.2018.07.031
#' Z18_THCAS <- data.frame(
#'   actv =
#'     c(-1.00,-0.12,0.17 ,-0.70,-0.90,-0.91,-0.96,-0.31,-0.46,-0.55,-1.00,-0.93,-0.69,-0.97,-1.00,-1.00,-0.15,-0.58,-1.00,-0.95,-0.90,-0.87),
#'
#'   res1a = c(  NA,  'K',  'Q',  'T',  'S',  'I',  'V',  'V',  'V',  'V',  'V', 'A',  'A', 'A',  'A',  'A',  'E',  'Y',  'Y',  'H',  'R',  'R'),
#'   pos1  = c(  12,  377,  69 ,  446,  382,  257,  415,  415,  415,  415,  415, 116,  116, 116,  116,  116,  442,  417,  484,  292,  110,  108),
#'   res1b = c(  NA,  'Q',  'H',  'I',  'K',  'M',  'A',  'I',  'L',  'T',  'N', 'S',  'G', 'V',  'T',  'Y',  'Q',  'F',  'F',  'A',  'A',  'A'),
#'
#'   res2a = c(  NA,  'K',  NA ,  'A',  NA ,  NA ,  NA ,  NA ,  NA ,  NA ,  NA , NA ,  NA , NA ,  NA ,  NA ,  NA ,  NA ,  NA ,  NA ,  NA ,  NA ),
#'   pos2  = c(  NA,  378,  NA ,  447,  NA ,  NA ,  NA ,  NA ,  NA ,  NA ,  NA , NA ,  NA , NA ,  NA ,  NA ,  NA ,  NA ,  NA ,  NA ,  NA ,  NA ),
#'   res2b = c(  NA,  'N',  NA ,  'C',  NA ,  NA ,  NA ,  NA ,  NA ,  NA ,  NA , NA ,  NA , NA ,  NA ,  NA ,  NA ,  NA ,  NA ,  NA ,  NA ,  NA ),
#'
#'   res3a = c(  NA,  'T',  NA ,  NA ,  NA ,  NA ,  NA ,  NA ,  NA ,  NA ,  NA , NA ,  NA , NA ,  NA ,  NA ,  NA ,  NA ,  NA ,  NA ,  NA ,  NA ),
#'   pos3  = c(  NA,  379,  NA ,  NA ,  NA ,  NA ,  NA ,  NA ,  NA ,  NA ,  NA , NA ,  NA , NA ,  NA ,  NA ,  NA ,  NA ,  NA ,  NA ,  NA ,  NA ),
#'   res3b = c(  NA,  'G',  NA ,  NA ,  NA ,  NA ,  NA ,  NA ,  NA ,  NA ,  NA , NA ,  NA , NA ,  NA ,  NA ,  NA ,  NA ,  NA ,  NA ,  NA ,  NA )
#' )
#'
#' usethis::use_data(Z18_THCAS, overwrite = TRUE)
#'
#' Z18 <- list(
#'   THCAS = Z18_THCAS,
#'   CBDAS = Z18_CBDAS
#' )
#'
#' usethis::use_data(Z18, internal = T, overwrite = TRUE)
#'
#' #' @name ANNOTATIONS_Q8GTB6
#' #' @title Dataset: \code{ANNOTATIONS_Q8GTB6}
#' #' @description
#' #' @format A list
#' #' @source
#' #'\url{https://pfam.xfam.org/structure/3vte#tabview=tab0}
#' ANNOTATIONS_Q8GTB6 <- list(
#'   'Sites' = list(
#'     'FAD-binding' = list(
#'       'H292' = list(
#'         type = 'Covalent',
#'         label = 'C-N linkage',
#'         description = 'FAD-binding site',
#'         ranges = IRanges::IRangesList(
#'           coordinates = IRanges(292)
#'         )
#'       ),
#'       'C417' = list(
#'         type = 'Covalent',
#'         label = 'C-S linkage',
#'         description = 'FAD-binding site',
#'         ranges = IRanges::IRangesList(
#'           coordinates = IRanges(417)
#'         )
#'       )
#'     ),
#'     'Active' = list(
#'       'Y484' = list(
#'         type = 'Catalytic',
#'         label = 'Active site',
#'         description = 'Catalytic base Tyr484',
#'         ranges = IRanges::IRangesList(
#'           'Y484' = IRanges::IRanges(484)
#'         )
#'       )
#'     ),
#'     'Glycosylation' = list(
#'       GlNAc	 = list(
#'         type = 'Covalent',
#'         label = 'GlcNAc',
#'         description = 'N-Acetyl Glucosamine',
#'         ranges = IRanges::IRangesList(
#'           IRanges::IRanges(65)
#'           IRanges::IRanges(89)
#'           IRanges::IRanges(168)
#'           IRanges::IRanges(297)
#'           IRanges::IRanges(305)
#'           IRanges::IRanges(329)
#'           IRanges::IRanges(467)
#'           IRanges::IRanges(499)
#'         )
#'       )
#'     )
#'   ),
#'   'Tertiary' = list(
#'     'Disulfide' = list(
#'       S99 = list(
#'         type = 'Covalent',
#'         description = 'Disulfide bond S37-S99',
#'         label = 'Disulfide bond',
#'         ranges = IRanges::IRanges(37, 99, 2)
#'       )
#'     ),
#'     'Crosslink' = list(
#'       H114 = list(
#'         type = 'Covalent',
#'         label = 'H114-[FAD]-C176',
#'         description = 'Crosslink H114-[FAD]-C176',
#'         ranges = IRanges::IRanges(114, 176, 2)
#'       )
#'     )
#'   ),
#'   'Domains' = list(
#'     'FAD-binding' = list(
#'       type = 'Covalent',
#'       label = 'FAD-binding 80-219',
#'       desciption = 'FAD-binding domain',
#'       ranges = IRanges::IRanges(81, 219)
#'     ),
#'     'BBE-domain' = list(
#'       type = 'Covalent',
#'       label = 'BBE-domain 480-438',
#'       description = 'Berberine bidge-like domain',
#'       ranges = IRanges::IRanges(480, 438)
#'     ),
#'     'Signal-peptide' = list(
#'       type = 'Covalent',
#'       label = 'Signal peptide 1-28',
#'       description = 'Signal peptide',
#'       ranges = IRanges::IRanges(1, 28)
#'     ),
#'   ),
#'   'Families' = list(
#'     'FAD-binding' = list(
#'       type = 'PCMH-type',
#'       label = 'FAD-binding',
#'       description = 'FAD-binding (PCMH family)',
#'       ranges = IRanges::IRanges(77, 251)
#'     )
#'   ),
#'   # 'Composition' = list(
#'   #   'Bias' = list(
#'   #     type = 'Bias',
#'   #     label = 'Compositional bias 77-251',
#'   #     description = 'Compositional bias 77-251',
#'   #     ranges = IRanges::IRanges(77, 251)
#'   #   )
#'   # ),
#'   # 'Chains' = list(
#'   #   'A' = list(
#'   #     type = 'Main',
#'   #     label = 'Chain-A',
#'   #     dscription = NULL,
#'   #     ranges = IRanges::IRanges(29, 545)
#'   #   )
#'   # ),
#'   'Mutations' = list(
#'     H92A = list(
#'       effect = FALSE,
#'       magnitude = '0',
#'       desciption = 'No effect',
#'       ranges = IRanges::IRanges(92)
#'     ),
#'     R108A = list(
#'       effect = 'Kcat',
#'       magnitude = '---',
#'       desciption = 'Strongly reduced catalytic activity',
#'       ranges = IRanges::IRanges(108)
#'     ),
#'     R110A = list(
#'       effect = 'Kcat',
#'       magnitude = '----',
#'       desciption = 'Strongly reduced catalytic activity',
#'       ranges = IRanges::IRanges(110)
#'     ),
#'     H114A = list(
#'       effect = 'FAD',
#'       magnitude = '-----',
#'       desciption = 'Loss of FAD binding and loss of catalytic activity. 2 Publications',
#'       ranges = IRanges::IRanges(114)
#'     ),
#'     H208A = list(
#'       effect = FALSE,
#'       magnitude = '0',
#'       desciption = 'No effect',
#'       ranges = IRanges::IRanges(208)
#'     ),
#'     H292A = list(
#'       effect = 'Kcat',
#'       magnitude = '----',
#'       desciption = 'Strongly reduced catalytic activity',
#'       ranges = IRanges::IRanges(292)
#'     ),
#'     Y417F = list(
#'       effect = 'Kcat',
#'       magnitude = '---',
#'       desciption = 'Reduced catalytic activity',
#'       ranges = IRanges::IRanges(417)
#'     ),
#'     E442Q = list(
#'       effect = 'Kcat',
#'       magnitude = '-',
#'       desciption = 'Slightly reduced catalytic activity',
#'       ranges = IRanges::IRanges(442)
#'     ),
#'     Y484F = list(
#'       effect = 'Kcat',
#'       magnitude = '-----',
#'       desciption = 'Loss of catalytic activity',
#'       ranges = IRanges::IRanges(484)
#'     )
#'   )
#' )
#' usethis::use_data(ANNOTATIONS_Q8GTB6, overwrite = TRUE)
#'
#' #' @name KINETICS
#' #' @title Dataset: \code{KINETICS_Q8GTB6}
#' #' @description
#' #' @format A list
#' #' @source
#' #'\url{https://pfam.xfam.org/structure/3vte#tabview=tab0}
#' KINETICS_Q8GTB6 <- list(
#'   Kcat = list(
#'     CBGA = list(
#'       value = '0.30',
#'       units = '1/sec',
#'       label = 'Kcat[CBGA] = 0.30 sec(-1)',
#'       description = 'Kcat value for CBGA substrate 0.30 sec(-1)',
#'       references = c(NULL)
#'     )
#'   ),
#'   Km = list(
#'     CBGA = list(
#'       value = c('134', '254'),
#'       units = 'µM',
#'       label = 'Km[CBGA] = (134 µM, 254 µM)',
#'       description = 'Km values for CBGA (134 µM, 254 µM)',
#'       references = c(
#'         'https://doi.org/10.1074/jbc.M403693200',
#'         'https://doi.org/10.1021/ja00143a024'
#'       )
#'     )
#'   ),
#'   Vmax = list(
#'     CBGA = list(
#'       value = c('0.36', '2.68'),
#'       units = 'nmol/sec/mg',
#'       label = 'Vmax[CBGA] = 2.68 nmol/sec/mg',
#'       desciption = 'Vmax values for CBGA substrate (0.36 nmol/sec/mg, 2.68 nmol/sec/mg)',
#'       references = c(
#'         'https://doi.org/10.1074/jbc.M403693200',
#'         'https://doi.org/10.1021/ja00143a024'
#'       )
#'     ),
#'   ),
#'   pH = list(
#'     CBGA = list(
#'       value = c('5.5', '6.0'),
#'       units = 'pH',
#'       label = 'Optimum pH 5.5-6.0',
#'       desciption = 'Optimum catalytic pH for CBGA substrate between 5.5-6.0',
#'       references = c(
#'         'https://doi.org/10.1074/jbc.M403693200',
#'         'https://doi.org/10.1021/ja00143a024'
#'       )
#'     )
#'   ),
#' )
#' usethis::use_data(KINETICS_Q8GTB6, overwrite = TRUE)
#'
#' #' @title Dataset AA86BTB6
#' #' @desciption Amino acid sequence of active THCAS
#' #' @source https://www.uniprot.org/uniprot/Q8GTB6
#' # usethis::use_data(AA_Q8GTB6)
#' # usethis::use_data(AA_Q8GTB6, internal = T, overwrite = T)
#'
#' #' @title Dataset AA_Q33DQ2
#' #' @desciption Amino acid sequence of inactive THCAS
#' #' @source https://www.uniprot.org/uniprot/Q33DQ2
#' # usethis::use_data(AA_Q33DQ2)
#' # usethis::use_data(AA_Q33DQ2, internal = T, overwrite = T)
#'
#'
#' #' @name CANSAT_CODONS_DNA
#' #' @title Dataset: \code{CANSAT_CODONS}
#' #' @description Cannabis sativa codons and codon usage table
#' #' @format A list
#' #' \describe{
#' #'   \item{TABLE}{DNA/RNA triplets and their translations}
#' #'   \item{FREQS}{DNA/RNA codon usage as pecent frequency}
#' #' }
#' #' @source
#' #' \url{https://www.kazusa.or.jp/codon/cgi-bin/showcodon.cgi?species=3483}
#' # CANSAT_CODONS_DNA <- list(
#' #   'A' = c('GCT', 'GCC', 'GCA', 'GCG'),
#' #   'R' = c('CGT', 'CGC', 'CGA', 'CGG', 'AGA', 'AGG'),
#' #   'N' = c('AAT', 'AAC'),
#' #   'D' = c('GAT', 'GAC'),
#' #   'C' = c('TGT', 'TGC'),
#' #   'Q' = c('CAA', 'CAG'),
#' #   'E' = c('GAA', 'GAG'),
#' #   'G' = c('GGT', 'GGC', 'GGA', 'GGG'),
#' #   'H' = c('CAT', 'CAC'),
#' #   'I' = c('ATT', 'ATC', 'ATA'),
#' #   'L' = c('TTA', 'TTG', 'CTT', 'CTC', 'CTA', 'CTG'),
#' #   'K' = c('AAA', 'AAG'),
#' #   'M' = c('ATG'),
#' #   'F' = c('TTT', 'TTC'),
#' #   'P' = c('CCT', 'CCC', 'CCA', 'CCG'),
#' #   'S' = c('TCT', 'TCC', 'TCA', 'TCG', 'AGT', 'AGC'),
#' #   'T' = c('ACT', 'ACC', 'ACA', 'ACG'),
#' #   'W' = c('TGG'),
#' #   'Y' = c('TAT', 'TAC'),
#' #   'V' = c('GTT', 'GTC', 'GTA', 'GTG'),
#' #   'START' = c('ATG'),
#' #   'STOP' = c('TAG', 'TGA', 'TAA')
#' # )
#' #
#' # CANSAT_CODON_USAGE_RNA <- list(
#' #   UUU = 33.5,  UCU = 15.0,  UAU = 30.7,  UGU =  5.9,
#' #   UUC = 22.7,  UCC =  9.3,  UAC = 13.9,  UGC =  8.3,
#' #   UUA = 20.6,  UCA = 18.8,  UAA =  1.5,  UGA =  0.3,
#' #   UUG = 23.7,  UCG =  6.2,  UAG =  0.3,  UGG = 17.8,
#' #
#' #   CUU = 20.9,  CCU = 17.8,  CAU = 19.6,  CGU =  6.5,
#' #   CUC =  9.3,  CCC =  4.6,  CAC =  8.0,  CGC =  2.3,
#' #   CUA =  7.2,  CCA = 16.0,  CAA = 27.1,  CGA =  7.2,
#' #   CUG =  3.1,  CCG =  1.3,  CAG =  4.1,  CGG =  1.5,
#' #
#' #   AUU = 37.7,  ACU = 22.7,  AAU = 46.7,  AGU = 15.5,
#' #   AUC = 14.7,  ACC =  9.8,  AAC = 17.5,  AGC =  5.7,
#' #   AUA = 24.3,  ACA = 18.1,  AAA = 43.1,  AGA = 16.5,
#' #   AUG = 26.3,  ACG =  2.6,  AAG = 28.1,  AGG =  6.7,
#' #
#' #   GUU = 28.6,  GCU = 24.5,  GAU = 37.7,  GGU = 21.2,
#' #   GUC = 10.8,  GCC =  5.2,  GAC =  9.5,  GGC =  9.0,
#' #   GUA = 11.6,  GCA = 14.2,  GAA = 37.9,  GGA = 24.0,
#' #   GUG =  8.0,  GCG =  6.5,  GAG = 22.7,  GGG =  7.2
#' # )
#' #
#' # CANSAT_CODON_USAGE_DNA <- setNames(CANSAT_CODON_USAGE_RNA, lapply(names(CANSAT_CODON_USAGE_RNA), function(rna) {
#' #   stringr::str_replace_all(rna, 'U', 'T')
#' # }))
#' #
#' # CANSAT_CODONS_RNA <- lapply(CANSAT_CODONS_DNA, function(dna){
#' #   stringr::str_replace_all(dna, 'T', 'U')
#' # })
#' #
#' # CANSAT_CODONS <- list(
#' #   TABLE = list(
#' #     DNA = CANSAT_CODONS_DNA,
#' #     RNA = CANSAT_CODONS_RNA
#' #   ),
#' #   FREQS = list(
#' #     DNA = CANSAT_CODON_USAGE_DNA,
#' #     RNA = CANSAT_CODON_USAGE_RNA
#' #   )
#' # )
#' # usethis::use_data(CANSAT_CODONS, overwrite = T)
#'
#'
#' #' @title Dataset `AA_PROPERTIES`
#' # AA_PROPERTIES <- read.csv(
#' #   'inst/extdata/CBDAS\ Product\ Specificity/constants/aa-properties.csv'
#' # )
#' # usethis::use_data(AA_PROPERTIES)
#'
#' #' @title Dataset `AA_CATEGORIES`
#' # AA_CATEGORIES <-read.csv(
#' #   'inst/extdata/CBDAS\ Product\ Specificity/constants/aa-categories.csv'
#' # )
#' # usethis::use_data(AA_CATEGORIES)
#'
#' #' @name CANSAT_GENETIC_CODE
#' #' @title Dataset: \code{CANSAT_GENETIC_CODE}
#' #' @description Cannabis sativa genetic code formatted to match that of \code{Biostrings::GENETIC_CODE}
#' #' @source \code{fastalign::CANSAT_CODONS$TABLE$DNA}
#' # CANSAT_GENETIC_CODE <- list()
#' # CSGC <- CANSAT_CODONS$TABLE$DNA
#' # for(i in 1:length(CSGC)) {
#' #   CANSAT_GENETIC_CODE[CSGC[[i]]] <- rep_len(names(CSGC)[[i]], length(CSGC[[i]]))
#' # }
#' # CANSAT_GENETIC_CODE[CANSAT_GENETIC_CODE %in% c('START', 'STOP')] <- '*'
#' # CSGC <- CANSAT_GENETIC_CODE
#' # CANSAT_GENETIC_CODE <- c()
#' # CANSAT_GENETIC_CODE_NAMES <- c()
#' # for(i in 1:length(GENETIC_CODE)) {
#' #   triplet <- names(GENETIC_CODE)[i]
#' #   CANSAT_GENETIC_CODE[[i]] <- CSGC[[triplet]]
#' #   CANSAT_GENETIC_CODE_NAMES[[i]] <- triplet
#' # }
#' # names(CANSAT_GENETIC_CODE) <- CANSAT_GENETIC_CODE_NAMES
#' # usethis::use_data(CANSAT_GENETIC_CODE, overwrite = T)
#'
