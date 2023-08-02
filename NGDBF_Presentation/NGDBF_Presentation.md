
---
title: 'Analysis of Noisy Gradient-Descent Bit Flipping (NGDBF) Decoding Algorithm'
subtitle: 'Using MATLAB and the PRISM Model Checking Tool'
author: 'Eric Reiss'
title-bg: 'figures/OldMainTower.png'
fontsize: '10pt'
...

# Algorithm Overview

* NGDBF is part of a family of bit flipping decoding algorithms
* Trapping sets in the LDPC code limit the decoding performance of a given algorithm
* 

# 


# Making slides

* I like HTML presentations based on [Slidy](https://www.w3.org/Talks/Tools/Slidy2/Overview.html), but many 
prefer PDF slides produced by [\LaTeX/Beamer](https://www.ctan.org/pkg/beamer).  

* It can be a challenge to write code in either HTML or \LaTeX.  

* [Markdown and Pandoc]() provide an easy text-based syntax for writing papers and presentations.  
* This template is designed to work with Pandoc to simultaneously:

   - Produce html output based on slidy
   - Produce matching PDF output based on \LaTeX/Beamer


# Procedure

 1. Prepare slides in a text document using Markdown syntax.
 2. Place any images in the `figures/` subdirectory.
 3. Edit the included `Makefile` to specify the presentation name and other details.
 4. Build the presentation by running `make`


# Including Figures

To include a figure using Markdown, use this syntax:

```
![Optional figure caption.](figures/example.png){width=60%}
```

Result:

![Optional figure caption.](figures/example.png){width=60%}


# Two-Column Slides

Starting two-column mode:

||*

Here is a column.

* Text.
* More text.
* Description.
* Discussion.

||+

And another column.

![A tall figure.](figures/tall_figure.png){width=20%}

*||

Columns are now over.



# Two-Column Slides

Starting two-column mode:

::::::::::{.columns}

:::{.column width=40%}
Here is a column.

* Text.
* More text.
* Description.
* Discussion.

:::
:::{.column width=40%}

And another column.

![A tall figure.](figures/tall_figure.png){width=20%}

:::
:::::::::::

Columns are now over.


