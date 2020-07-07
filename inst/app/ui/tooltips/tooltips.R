
type <- 'The type of alignment, where "global" = align whole strings with end gap penalties, "local" = align string fragments, "overlap" = align whole strings without end gap penalties, "global-local" = align whole strings in pattern with consecutive subsequence of subject, "local-global" = align consecutive subsequence of pattern with whole strings in subject.'
scoreOnly <- 'Select to return just the scores of the optimal pairwise alignment.'
patternQuality <- 'A .txt file containing quality scores for the query sequence. Used to generate a substitution matrix.'
subjectQuality <- 'A .txt file containing quality scores for each reference sequence. Used to generate a substitution matrix.'
substitutionMatrix <- 'A .txt file containing a substitution matrix representing the fixed substitution scores for each alignment (with alignments separated by new line characters). It cannot be used in conjunction with patternQuality and subjectQuality arguments.'
fuzzyMatrix	<- 'A .txt file containing a fuzzy match matrix for quality-based alignments (with alignments separated by new line characters). It takes values between 0 and 1; where 0 is an unambiguous mismatch, 1 is an unambiguous match, and values in between represent a fraction of "matchiness". '
gapOpening <- 'The cost for opening a gap in the alignment.'
gapExtension <- 'The incremental cost incurred along the length of the gap in the alignment.'
