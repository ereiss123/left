
---
title: 'Non-Binary LDPC Code Construction and Decoding'
subtitle: 'Based on "Low-Density Parity Checks over GF(q)" by M. Davey and D. Mackay '
author: 'Eric Reiss'
title-bg: 'figures/OldMainTower.png'
fontsize: '10pt'
...
# Overview

# Term Definition
* weight - number of non-zero elements in a vector or matrix
* density - expected fraction of non-zero symbols in a source of random symbols
* overlap - number of cooridinates in which two vectors have non-zero entries
* $H$ - sparse random parity check matrix
* $N$ - transmitted block length
* $K$ - source block length
* $M$ - number of parity checks, $M=N-K$
* $t$ - mean column weight
* symbol - element of $GF(2^b)$
* bit - binary representation of a symbol

# Code Construction
* Let $H$ be an $M\times N$ random parity check matrix
    - The weight per column will be greater than 2 with a mean of $t$
    - The weight per row will be uniform as possible
* Non-zero elements are selected from a **special distribution** to maximize entropy of syndrome
    - Each codeword should have roughly the same likelihood
    - Citation by **special distribution** is for a work in progress paper that I don't believe was published, at least not under that name
* Generator matrix is obtained through gaussian elimination on $H$
* If rows of $H$ are not independent, then $H$ defines a parity check for the same $N$ but a smaller $M$
    - $H$ defines a code of at least $K/N$

# Channel Model
* Used a memoryless, binary symmetric and binary gaussian channel with inputs $\pm s$ and variance $\sigma^2=1$
* For a code-rate $R$, $SNR=\frac{s^2}{2R\sigma^2}$ and if $\sigma^2=1$ then $SNR=\frac{s^2}{2R}$
* For $GF(2^b)$, $\textbf{x}$ is a sample from the assumed noise model consisting of noise symbols $x_n$, which in turn consist of $b$ bits
* The received bit is assigned to be the sign of the output
* The likelihood that the nth noise bit is 1 is given by $g_n^1=\frac{1}{1+e^{2s|y_n|/\sigma^2}}$ where $y_n$ is the channel output
    - The likelihood the bit is 0 is $1-g_n^1$
* The likelihood that $x_n=a$, $a\in GF(2^b)$ is defined $f^a_n:=\prod_{i=1}^b g^{a_i}_{n_i}$ where $a_i$ is the ith bit of the binary representation of $a$
    - Ex. Likelihood $x_1=1$ in $GF(4)$: 
     $f^1_1 = \prod_{i=1}^2 g^{a_i}_{1_i} = g^{0}_{1_1} * g^1_{1_2} =  (1-\frac{1}{e^{2s|y_{1_1}|/\sigma^2}}) * \frac{1}{e^{2s|y_{1_2}|/\sigma^2}}$

# Decoding Algorithm
* Objective: find most probable vector $\textbf{x}$ s.t. $\textbf{Hx}=z$
* Elements of $\textbf{x}$ are referred to as noise symbols
* Elements of $\textbf{z}$ are referred to as checks
* Define $\mathcal{N}(m) = \{n:H_{mn}\neq 0\}$ as the set of symbols nodes, $n$, adjacent to check node $m$
* Define $\mathcal{M}(n) = \{m:H_{mn}\neq 0\}$ as the set of check nodes, $m$, adjacent to symbol node $n$ 
* For each non-zero entry in $H$, define $q_{mn}^a$ and $r_{mn}^a$ for $a\in GF(2^b)$
    - $q_{mn}^a$ is the probability that symbol $n$ of $\textbf{x}$ is $a$
    - $r_{mn}^a$ is the probability that check $m$ is satisfied if symbol $n$ of $\textbf{x}$ is fixed at $a$

# Algorithm
* Initialize $q_{mn}^a$ to $f^a_n$
* Update $r_{mn}^a$ as  $r_{mn}^a = \sum\limits_{\textbf{x'}:x'_n=a}\text{Prob}[z_m|\textbf{x'}]\prod\limits_{j\in\mathcal{N}(m)/n}q^{x'_j}_{mj}$
    - $\text{Prob}[z_m|\textbf{x'}]\in [0,1]$ depending on if $\textbf{x'}$ satisfies check $m$
    - Davey and Mackay introduce some simplifications
    - Define $\sigma_{mk} := \sum_{j:j\le k} H_{mj}x'_j$
    - Define $\rho_{mk} := \sum_{j:j\ge k} H_{mj}x'_j$
    - Calculate Prob$[\sigma_{mk}=a]$ for each $a\in GF(2^b)$ and each $k\in \mathcal{N}(m)$ 
    - Prob$[\sigma_{mk}=a]$ = $\sum\limits_{s,t:H_{mj}t+s=a}\text{ Prob}[\sigma_{mi}=s]q^t_{mj}$ if $i,j$ are successive and $j>i$
    - $\rho_{mk}$ is calculated in a similiar way
    - Then $r^a_{mn} = \text{ Prob}[(\sigma_{m(n-1)}+\rho_{m(n-1)})=z_m-H_{mn}a]$ 
    - Expanded as $r^a_{mn} = \sum\limits_{s,t:s+t=z_m-H_{mn}a}\text{ Prob}[\sigma_{m(n-1)=s}] * \text{Prob}[\rho_{m(n+1)}=t]$

# Algorithm Cont.
* Update $q^a_{mn}$
    - Define $\alpha_{mn}$ as a weight
    - $q^a_{mn} = \alpha_{mn} f^a_n\prod\limits_{j\in\mathcal{M}(n)\\m}r^a_{jn}$
    - Select $\alpha_{mn}$ s.t. $\sum_{a=1}^q q^a_{mn} = 1$
* Make tentative decoding $\hat{x_n} = \text{argmax}(a)f^a_n\prod\limits_{j\in\mathcal{M}(n)}r^a_{jn}$
    - If $H\hat{x} = z$ then the algorithm is complete
    - Else it repeats until a valid decoding is obtained or maximum number of iterations is met

# GF(4)
* Explicitly defined below
||*
|$\oplus$|a|b|c|d|
|a|a|b|c|d|
|b|b|c|d|a|
|c|c|d|a|b|
|d|d|a|b|c|
||+
|*|a|b|c|d|
|a|a|a|a|a|
|b|a|b|c|d|
|c|a|c|d|c|
|d|a|d|c|d|
||*



# Sources
 * [1] M. C. Davey and D. MacKay, "Low-density parity check codes over GF(q)," in IEEE Communications Letters, vol. 2, no. 6, pp. 165-167, June 1998, doi: 10.1109/4234.681360.

  