
---
title: 'Analysis of Noisy Gradient-Descent Bit Flipping (NGDBF) Decoding Algorithm'
subtitle: 'Using MATLAB and the PRISM Model Checking Tool'
author: 'Eric Reiss'
title-bg: 'figures/OldMainTower.png'
fontsize: '10pt'
...

# LDPC Codes and Trapping Sets

* 

# Algorithm Overview

* NGDBF is part of a family of bit flipping decoding algorithms
* Improves upon the Gradient-Descent Bit Flipping (GDBF) Decoding Algorithm proposed by Wadayama et al. [1]
   - GDBF gets "stuck" in local minima while decoding
* NGDBF introduces psuedo-random noise to escape local minima
* Algorithm steps [2]:
   - Let $H$ be an $n\times m$ parity check matrix, $N_i$ be the adjacency for bit $i$, $M_j$ be the adjacency for parity check $j$ 
   - Given channel samples, $\vec{y}$, initialize $\vec{x}$ to be the $sign(\vec{y})$
   - Compute the syndrome, $s_j = \prod_{i\in M_j}x_i$
   - Calculate the energy for bit i, $E_i = y_ix_i+w\sum_{j\in N_i}s_j + z_i$, where w is i.i.d white noise and $z_i$ is a zero mean noise pertubation
   - Given a threshold $\theta$ flip bit $i$ if $E_i < \theta$

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


