#' @name CANSAT_CODONS_DNA
#' @title Dataset: \code{CANSAT_CODONS}
#' @description Cannabis sativa codons and codon usage table
#' @format A list
#' \describe{
#'   \item{TABLE}{DNA/RNA triplets and their translations}
#'   \item{FREQS}{DNA/RNA codon usage as pecent frequency}
#' }
#' @source
#' \url{https://www.kazusa.or.jp/codon/cgi-bin/showcodon.cgi?species=3483}

CANSAT_CODONS_DNA <- list(
  'A' = c('GCT', 'GCC', 'GCA', 'GCG'),
  'R' = c('CGT', 'CGC', 'CGA', 'CGG', 'AGA', 'AGG'),
  'N' = c('AAT', 'AAC'),
  'D' = c('GAT', 'GAC'),
  'C' = c('TGT', 'TGC'),
  'Q' = c('CAA', 'CAG'),
  'E' = c('GAA', 'GAG'),
  'G' = c('GGT', 'GGC', 'GGA', 'GGG'),
  'H' = c('CAT', 'CAC'),
  'I' = c('ATT', 'ATC', 'ATA'),
  'L' = c('TTA', 'TTG', 'CTT', 'CTC', 'CTA', 'CTG'),
  'K' = c('AAA', 'AAG'),
  'M' = c('ATG'),
  'F' = c('TTT', 'TTC'),
  'P' = c('CCT', 'CCC', 'CCA', 'CCG'),
  'S' = c('TCT', 'TCC', 'TCA', 'TCG', 'AGT', 'AGC'),
  'T' = c('ACT', 'ACC', 'ACA', 'ACG'),
  'W' = c('TGG'),
  'Y' = c('TAT', 'TAC'),
  'V' = c('GTT', 'GTC', 'GTA', 'GTG'),
  'START' = c('ATG'),
  'STOP' = c('TAG', 'TGA', 'TAA')
)

CANSAT_CODONS_RNA <- lapply(CANSAT_CODONS, function(dna){
  stringr::str_replace_all(dna, 'T', 'U')
})

CANSAT_CODON_USAGE_RNA <- list(
  UUU = 33.5,  UCU = 15.0,  UAU = 30.7,  UGU =  5.9,
  UUC = 22.7,  UCC =  9.3,  UAC = 13.9,  UGC =  8.3,
  UUA = 20.6,  UCA = 18.8,  UAA =  1.5,  UGA =  0.3,
  UUG = 23.7,  UCG =  6.2,  UAG =  0.3,  UGG = 17.8,

  CUU = 20.9,  CCU = 17.8,  CAU = 19.6,  CGU =  6.5,
  CUC =  9.3,  CCC =  4.6,  CAC =  8.0,  CGC =  2.3,
  CUA =  7.2,  CCA = 16.0,  CAA = 27.1,  CGA =  7.2,
  CUG =  3.1,  CCG =  1.3,  CAG =  4.1,  CGG =  1.5,

  AUU = 37.7,  ACU = 22.7,  AAU = 46.7,  AGU = 15.5,
  AUC = 14.7,  ACC =  9.8,  AAC = 17.5,  AGC =  5.7,
  AUA = 24.3,  ACA = 18.1,  AAA = 43.1,  AGA = 16.5,
  AUG = 26.3,  ACG =  2.6,  AAG = 28.1,  AGG =  6.7,

  GUU = 28.6,  GCU = 24.5,  GAU = 37.7,  GGU = 21.2,
  GUC = 10.8,  GCC =  5.2,  GAC =  9.5,  GGC =  9.0,
  GUA = 11.6,  GCA = 14.2,  GAA = 37.9,  GGA = 24.0,
  GUG =  8.0,  GCG =  6.5,  GAG = 22.7,  GGG =  7.2
)

CANSAT_CODON_USAGE_DNA <- setNames(CANSAT_CODON_USAGE_RNA, lapply(names(CANSAT_CODON_USAGE_RNA), function(rna) {
  stringr::str_replace_all(rna, 'U', 'T')
}))

CANSAT_CODONS <- list(
  TABLE = list(
    DNA = CANSAT_CODONS_DNA,
    RNA = CANSAT_CODONS_RNA
  ),
  FREQS = list(
    DNA = CANSAT_CODON_USAGE_DNA,
    RNA = CANSAT_CODON_USAGE_RNA
  )
)

#' @name CANSAT_GENETIC_CODE
#' @title Dataset: \code{CANSAT_GENETIC_CODE}
#' @description Cannabis sativa genetic code formatted to match that of \code{Biostrings::GENETIC_CODE}
#' @format A list
#' @source
#'\code{fastalign::CANSAT_CODONS$TABLE$DNA}
CANSAT_GENETIC_CODE <- list()
CSGC <- CANSAT_CODONS$TABLE$DNA
for(i in 1:length(CSGC)) {
  CANSAT_GENETIC_CODE[CSGC[[i]]] <- rep_len(names(CSGC)[[i]], length(CSGC[[i]]))
}
CANSAT_GENETIC_CODE[CANSAT_GENETIC_CODE %in% c('START', 'STOP')] <- '*'
CSGC <- CANSAT_GENETIC_CODE
CANSAT_GENETIC_CODE <- c()
CANSAT_GENETIC_CODE_NAMES <- c()
for(i in 1:length(GENETIC_CODE)) {
  triplet <- names(GENETIC_CODE)[i]
  CANSAT_GENETIC_CODE[[i]] <- CSGC[[triplet]]
  CANSAT_GENETIC_CODE_NAMES[[i]] <- triplet
}
names(CANSAT_GENETIC_CODE) <- CANSAT_GENETIC_CODE_NAMES

#' @name ANNOTATIONS_Q8GTB6
#' @title Dataset: \code{ANNOTATIONS_Q8GTB6}
#' @description
#' @format A list
#' @source
#'\url{https://pfam.xfam.org/structure/3vte#tabview=tab0}
ANNOTATIONS_Q8GTB6 <- list(
  'Sites' = list(
    'FAD-binding' = list(
      'H292' = list(
        description = 'FAD C-N linkage',
        ranges = IRanges::IRangesList(
          coordinates = IRanges(292)
        )
      ),
      'C417' = list(
        description = 'FAD C-S linkage',
        ranges = IRanges::IRangesList(
          coordinates = IRanges(417)
        )
      ),
    ),
    'Active' = list(
      'Y484' = list(
        description = 'Catalytic base Tyr484',
        ranges = IRangesList(
          'Y484' = IRanges(484)
        )
      )
    ),
    'Glycosylation' = list(
      N65	 = list(
        type = 'GlNAc',
        description = 'Glycosyl linkage GlNAc-N65',
        label = 'GlcNAc-N65',
        ranges = IRanges::IRangesList(
          coordinates = IRanges::IRanges(N65)
        )
      ),
      N89	 = list(
        type = 'GlNAc',
        description = 'Glycosyl linkage GlNAc-N89',
        label = 'GlcNAc-N89',
        ranges = IRanges::IRangesList(
          coordinates = IRanges::IRanges(N89)
        )
      ),
      N168 = list(
        type = 'GlNAc',
        description = 'Glycosyl linkage GlNAc-N168',
        label = 'GlcNAc-N168',
        ranges = IRanges::IRangesList(
          coordinates = IRanges::IRanges(168)
        )
      ),
      N297 = list(
        type = 'GlNAc',
        description = 'Glycosyl linkage GlNAc-N297',
        label = 'GlcNAc-N297',
        ranges = IRanges::IRangesList(
          coordinates = IRanges::IRanges(297)
        )
      ),
      N305 = list(
        type = 'GlNAc',
        description = 'Glycosyl linkage GlNAc-N305',
        label = 'GlcNAc-N305',
        ranges = IRanges::IRangesList(
          coordinates = IRanges::IRanges(305)
        )
      ),
      N329 = list(
        type = 'GlNAc',
        description = 'Glycosyl linkage GlNAc-N329',
        label = 'GlcNAc-N329',
        ranges = IRanges::IRangesList(
          coordinates = IRanges::IRanges(329)
        )
      ),
      N467 = list(
        type = 'GlNAc',
        description = 'Glycosyl linkage GlNAc-N467',
        label = 'GlcNAc-N467',
        ranges = IRanges::IRangesList(
          coordinates = IRanges::IRanges(467)
        )
      ),
      N499 = list(
        type = 'GlNAc',
        description = 'Glycosyl linkage GlNAc-N499',
        label = 'GlcNAc-N499',
        ranges = IRanges::IRangesList(
          coordinates = IRanges::IRanges(499)
        )
      )
    )
  ),
  'Tertiary' = list(
    'Disulfide-bond' = list(
      S99 = list(
        description = 'Disulfide bond S37-S99',
        label = 'S37-S99',
        ranges = IRanges::IRanges(
          coodinates = IRanges::IRanges(37),
          linkcoords = IRanges::IRanges(99)
        )
      ),
      S99 = list(
        description = 'Disulfide bond S37-S99',
        label = 'S37-S99',
        ranges = IRanges::IRanges(
          coodinates = IRanges::IRanges(37),
          linkcoords = IRanges::IRanges(99)
        )
      )
    ),
    'Cross-link' = list(
      H114 = list(
        type = NULL,
        description = 'Crsslink H114-[FAD]-C176',
        label = 'H114-[FAD]-C176'
        ranges = IRanges::IRanges(
          coodinates = IRanges::IRanges(114),
          linkcoords = IRanges::IRanges(176)
        )
      ),
      C176 = list(
        type = NULL,
        description = 'Crosslink His-[FAD]-Cys',
        label = 'H114-[FAD]-C176'
        ranges = IRanges::IRanges(
          coodinates = IRanges::IRanges(176),
          coodinates = IRanges::IRanges(114)
        )
      )
    )
  ),
  'Domains' = list(
    'FAD-binding' = list(
      label = 'FAD-binding 80-219'
      desciption = 'FAD-binding domain',
      ranges = IRanges::IRangesList(
        coordinates = IRange(81, 219),
        aligncoords = IRange(81, 217),
      )
    ),
    'BBE-domain' = list(
      label = 'BBE-domain 480-438',
      description = 'Berberine bidge-like domain',
      ranges = IRanges::IRangesList(
        coordinates = IRange(480, 438),
        aligncoords = IRange(480, 538),
      )
    ),
    'Signal-peptide' = list(
      label = 'Signal-peptide 1-28',
      description = 'Signal peptide',
      ranges = IRanges::IRangesList(
        coordinates = IRange(1, 28)
      )
    ),
  ),
  'Families' = list(
    'FAD-binding' = list(
      type = 'PCMH-type',
      label = 'FAD-binding',
      description = 'FAD-binding PCMH-type',
      ranges = IRanges::IRangesList(
        coordinates = IRanges::IRange(77, 251)
      )
    )
  ),
  'Composition' = list(
    'Bias' = list(
      type = 'compositional-bias',
      label = 'Compositional bias 77-251',
      description = 'Compositional bias 77-251',
      ranges = IRanges::IRangesList(
        coordinates = IRanges::IRange(77, 251)
      )
    )
  ),
  'Chains' = list(
    'A' = list(
      label = 'Chain-A 29-545'
      dscription = 'Main chain'
      ranges = IRanges::IRangeList(
        coordinates = IRanges::IRange(29, 545)
      )
    )
  ),
  'Mutations' = list(
    H92A = list(
      effect = FALSE,
      magnitude = '0',
      desciption = 'No effect',
      ranges = IRanges::IRangesList(
        coodinates = IRanges::IRanges()
      )
    ),
    R108A = list(
      effect = 'Kcat',
      magnitude = '---',
      desciption = 'Strongly reduced catalytic activity',
      ranges = IRanges::IRangesList(
        coodinates = IRanges::IRanges()
      )
    ),
    R110A = list(
      effect = 'Kcat',
      magnitude = '----',
      desciption = 'Strongly reduced catalytic activity',
      ranges = IRanges::IRangesList(
        coodinates = IRanges::IRanges()
      )
    ),
    H114A = list(
      effect = 'FAD',
      magnitude = '-----',
      desciption = 'Loss of FAD binding and loss of catalytic activity. 2 Publications',
      ranges = IRanges::IRangesList(
        coodinates = IRanges::IRanges()
      )
    ),
    H208A = list(
      effect = FALSE,
      magnitude = '0',
      desciption = 'No effect',
      ranges = IRanges::IRangesList(
        coodinates = IRanges::IRanges()
      )
    ),
    H292A = list(
      effect = 'Kcat',
      magnitude = '----',
      desciption = 'Strongly reduced catalytic activity',
      ranges = IRanges::IRangesList(
        coodinates = IRanges::IRanges()
      )
    ),
    Y417F = list(
      effect = 'Kcat',
      magnitude = '---',
      desciption = 'Reduced catalytic activity',
      ranges = IRanges::IRangesList(
        coodinates = IRanges::IRanges()
      )
    ),
    E442Q = list(
      effect = 'Kcat',
      magnitude = '-',
      desciption = 'Slightly reduced catalytic activity',
      ranges = IRanges::IRangesList(
        coodinates = IRanges::IRanges()
      )
    ),
    Y484F = list(
      effect = 'Kcat',
      magnitude = '-----',
      desciption = 'Loss of catalytic activity',
      ranges = IRanges::IRangesList(
        coodinates = IRanges::IRanges()
      )
    )
  )
)

#' @name KINETICS
#' @title Dataset: \code{KINETICS_Q8GTB6}
#' @description
#' @format A list
#' @source
#'\url{https://pfam.xfam.org/structure/3vte#tabview=tab0}
KINETICS_Q8GTB6 <- list(
  Kcat = list(
    CBGA = list(
      value = '0.30',
      units = '1/sec',
      label = 'Kcat[CBGA] = 0.30 sec(-1)',
      description = 'Kcat value for CBGA substrate 0.30 sec(-1)',
      references = c(NULL)
    )
  ),
  Km = list(
    CBGA = list(
      value = c('134', '254'),
      units = 'µM',
      label = 'Km[CBGA] = (134 µM, 254 µM)',
      description = 'Km values for CBGA (134 µM, 254 µM)',
      references = c(
        'https://doi.org/10.1074/jbc.M403693200',
        'https://doi.org/10.1021/ja00143a024'
      )
    )
  ),
  Vmax = list(
    CBGA = list(
      value = c('0.36', '2.68'),
      units = 'nmol/sec/mg',
      label = 'Vmax[CBGA] = 2.68 nmol/sec/mg',
      desciption = 'Vmax values for CBGA substrate (0.36 nmol/sec/mg, 2.68 nmol/sec/mg)',
      references = c(
        'https://doi.org/10.1074/jbc.M403693200',
        'https://doi.org/10.1021/ja00143a024'
      )
    ),
  ),
  pH = list(
    CBGA = list(
      value = c('5.5', '6.0'),
      units = 'pH',
      label = 'Optimum pH 5.5-6.0',
      desciption = 'Optimum catalytic pH for CBGA substrate between 5.5-6.0',
      references = c(
        'https://doi.org/10.1074/jbc.M403693200',
        'https://doi.org/10.1021/ja00143a024'
      )
    )
  ),
)



