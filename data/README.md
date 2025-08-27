# data

1) `wordcount.csv`: word counts for each dictionary based on the lemmatized noun version of BILA

2) `bila_dictionaries_withenv.csv`: information about each dictionary that includes environmental variables

3) `stopwords.txt`: stopwords that were filtered out before compiling the counts in `wordcount.csv`.

4) `wiktionary_filtered_combinations.csv`: specifies which words were removed from which languages based on Wiktionary filtering.  For example, Wiktionary indicates that "ice" is an inflection of a Portuguese verb meaning "to raise", so we don't want to include "ice" in the counts for Portuguese dictionaries.


(1) and (2) were produced by running `preliminary_steps.Rmd` in `analysis/preliminary_steps.Rmd` from the main BILA repository. 

(3) and (4) were taken from `data/foranalyses/` in the main BILA repository.


