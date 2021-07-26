## Assumption file for Example 1

```
% Assume adversary avoids detection at our main measurement event. By
% using the label, in the antecedent, we do not need to know the event
% number in the compiled Copland phrase. 
l(E) = msp(us, E1, M, us, exts)
 => phi(us, exts, E).

% Assumptions about system dependencies.
% Comment these out to consider unaccounted-for dependencies.
% Lists components used by Example 17 but not by Example 1.
depends(P, C, ks, av) => false. 
depends(P, C, us, bmon) => false.
depends(P, C, us, bser) => false.
depends(P, C, us, extmgr) => C = bser.
depends(P, C, hv, kim) => false.
depends(P, C, hv, avm) => false. 

% Axiom defining "deep" components.
% Leave uncommented if you wish to exclude models with deep
% corruptions.
l(E) = cor(ks, M) => false.

% Axiom defining which components might be corrupted during
% attestation. Recent is defined here as after any measurement event.
% Leave uncommented if you wish to exclude models with recent
% corruptions.
prec(E, E2) & l(E2) = cor(P,C) & ms_evt(E)
 => false. 

% Injectivity of names. Lists all names used in all examples. 
kim = avm => false.
kim = ker => false.
kim = av => false.
kim = bmon => false.
kim = bser => false.
kim = extmgr => false.
kim = exts => false.
avm = ker => false.
avm = av => false.
avm = bmon => false.
avm = bser => false.
avm = extmgr => false.
avm = exts => false.
ker = av => false.
ker = bmon => false.
ker = bser => false.
ker = extmgr => false.
ker = exts => false.
av = bmon => false.
av = bser => false.
av = extmgr => false.
av = exts => false.
bmon = bser => false.
bmon = extmgr => false.
bmon = exts => false.
bser = extmgr => false.
bser = exts => false.
extmgr = exts => false.
```
