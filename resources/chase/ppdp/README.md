---
layout: frontpage
title: {{ site.title}}
---

# Automated Trust Analysis of Copland Specifications for Layered Attestation
## Paul D. Rowe, John D. Ramsdell, and Ian D. Kretz
## The MITRE Corporation

This page provides access to the input files used in "Automated Trust Analysis
of Copland Specifications for Layered Attestation" as published in [Principles
and Practice of Declarative Programming (PPDP'21)](https://ppdp2021.github.io/).

The analysis requires you to install the Copland Collection tool suite which can
be downloaded from [here](https://ku-sldg.github.io/copland/software.html). The
README in the download contains instructions for compiling the code. 

To download a tarball of all input files, including a Makefile to run them,
click [here](https://ku-sldg.github.io/copland/resources/ppdp-inputs.tar.gz). Once you have downloaded the inputs and installed the Copland
Collection, simply type `make` on the command line to run the analyses. You can
vary the assumptions by editing the `*_supps.gli` files.

If you simply wish to browse the contents of the input files or the resulting
outputs, links are provided below to view them online in Markdown.

### Theory of minimal, adversary-ordered saturated queries:
 * [Fixed theory](thy)

### Example 1:
* [Copland phrase](bank1)   
* [Assumptions](bank1_supps)   
* [Query](bank1_query)   
* <a href="bank1.xhtml" target="_blank">[Output</a>  

### Example 2: 
 * [Copland phrase](bank2)   
 * [Assumptions](bank2_supps)   
 * [Query](bank2_query)  
 * [Output](bank2.xhtml)   

### Example 17:
 * [Copland phrase](bank17)   
 * [Assumptions](bank17_supps)   
 * [Query](bank17_query)  
 * [Output](bank17.xhtml)   

