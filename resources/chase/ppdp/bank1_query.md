### Query file for Example 1

Runtime flags processed by Chase. The flag `bound` limits the size of the
universe of constants. The flag `input_order` changes Chase's default scheduling
of formulas. This is required for good performance of the Layered Attestation
theory. 
```
[ bound = 500, input_order ]
```
Simplly include various files with Chase formulas. The first file is generated
from `bank1.cop` before calling Chase. 
```
m4_include(`bank1.gli')m4_dnl

m4_include(`bank1_supps.gli')m4_dnl

m4_include(`thy.gli')m4_dnl
```
