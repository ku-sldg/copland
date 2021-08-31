---
layout: frontpage
title: {{ site.title}}
---

### Query file for Example 17

Runtime flags processed by Chase.  
The flag `bound` limits the size of the
universe of constants. The flag `input_order` changes Chase's default scheduling
of formulas. This is required for good performance of the Layered Attestation
theory.   
The flag `limit` limits the number of steps Chase takes in its search.  
Using `limit = 500000` ensures the analysis completes when no assumptions are
made in `bank17_supps` to constrain the search. Testing with `limit = 50000`
causes Chase to abort before completing its search in this case. 

```
[ bound = 500, limit = 500000, input_order ]
```
Simplly include various files with Chase formulas. The first file is generated
from `bank17.cop` before calling Chase. 
```
m4_include(`bank17.gli')m4_dnl

m4_include(`bank17_supps.gli')m4_dnl

m4_include(`thy.gli')m4_dnl
```
