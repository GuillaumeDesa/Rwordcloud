# Rwordcloud
A word-cloud generator with R.

Full description here: https://corpling.hypotheses.org/3941

Load the script as follows: `runApp("path/to/file/rwordcloud.r")`

The Shiny app opens in your default web browser. At first, you see an error message (‘Error: ‘con’ is not a connection’). This is because you have not loaded a text yet.


Let us load [Herman Melville’s Moby Dick](https://nakala.fr/download/10.34847/nkl.1e8f1n13.v1/c7e16c4dc7242823c6a4b17c3c81897535bdc359), which I downloaded from Project Gutenberg. It is a UTF-8 text file that I post-processed with R. To do so, click on ‘Browse’. This opens up an interactive window. Look for the text file and click ‘Open’.

The size of each word is indexed on its type frequency. By default, the number of words in the word cloud is 100. Using the ruler, we set the number of words to be included in the word cloud to 300.

The word cloud is pretty basic but does the trick. If you read the documentation of the wordcloud package, you will discover more features, such as coloring the words based on how often they occur in the text. You can also customize the stoplist (the list of words that are excluded from the word cloud, such as function words).
