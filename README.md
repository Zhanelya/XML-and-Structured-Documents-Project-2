# XML and Structured Documents Project 2
###Qerying XML data with a use of XQuery and XPath

This project implements XQuery expressions to extract useful information from some real XML data. 

These are real datafiles from the British National Corpus, a collection of English language data widely used by linguists and computational linguists, together with
a schema:

• \<s> 
represents a sentence, containing possibly many children <w> representing words in linear order;

• \<w>YYY</w> represents word YYY.

#####Tasks accomplished for this project:

1.Produced a .xquery file containing a XQuery FLWOR expression which returns all the occurrences of the word ’has’ in the collection of files, together with the word which comes next in the sentence in each
case. The resulting list is formatted as a HTML table, with each row containing the two words in their own cells, e.g.:

Target Successor

has there

has n’t

has n’t

. . . . . .

2. The results from (1) contain many duplicates. Produced another version which returns only unique results, together with the number of times this combination of words occurred, sorted in descending
order of frequency:

Target Successor Frequency

has been 39

has n’t 15

has a 15

. . . . . . . . .

3. Corpus linguists are often interested in finding whether pairs of words occur together more often than would be expected by chance (these are called collocations). Produced a modified version of my query
from (2) which replaces the simple frequency count with the probability that the successor word occurs after the target. 

Target Successor Probability

has begun 1

. . . . . . . . .

has gained 0.67

. . . . . . . . .

4. You’ll notice that the results from (3) have a long tail – a large number of words with low probabilities of co-occurrence (mostly words which are just quite common, so they appear often after the target word
’has’, but only because they appear quite often anyway). Produced a final version which limits the number of results to the top 20 (i.e. the first 20 results returned in (3)).

For a complete guide please check the pdf report
