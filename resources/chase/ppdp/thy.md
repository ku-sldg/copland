---
layout: frontpage
title: {{site.title}}
---

# Theory of minimal, adversary-ordered, saturated queries

Chase's scheduling is sensitive to the order in which phrases are
listed. Changing the order may drastically affect performance. 

```
%%%%%%%%%%%%%%%%%%%%%%%%%
% Minimality Conditions %
%%%%%%%%%%%%%%%%%%%%%%%%%

%Record measurement events
l(E) = msp(P2, E1, M, P1, T) => ms_evt(E).

%Any two alternating adversary events for the same component must have
%a measurement event in between. (This disallows models with pointless
%chains of cor-rep events.)
l(E1) = cor(P, C) & l(E2) = rep(P, C) & prec(E1, E2)
 => prec(E1, E3) & prec(E3, E2) & ms_evt(E3) & relevant(P, C, E3).
l(E1) = rep(P, C) & l(E2) = cor(P, C) & prec(E1, E2)
 => prec(E1, E3) & prec(E3, E2) & ms_evt(E3) & relevant(P, C, E3).

%Two adversary events of the same type for the same component must
%have an intervening adversary event of the opposite type for that
%component.
l(E1) = cor(P,C) & l(E2) = cor(P,C) & prec(E1, E2)
 => prec(E1, E3) & prec(E3, E2) & l(E3) = rep(P,C).
l(E1) = rep(P,C) & l(E2) = rep(P,C) & prec(E1, E2)
 => prec(E1, E3) & prec(E3, E2) & l(E3) = cor(P,C).

l(E) = msp(P2, E1, M, P1, T) & relevant(P, C, E)
 => P = P1 & C = T | P = P2 & C = M | P = P2 & depends(P2, C, P2, M).

%%%%%%%%%%%%%%%%%%%%%%%%
% Events are injective %
%%%%%%%%%%%%%%%%%%%%%%%%

cor(P1, C1) = cor(P2, C2) => P1 = P2 & C1 = C2.
rep(P1, C1) = rep(P2, C2) => P1 = P2 & C1 = C2.
cor(P1, C1) = rep(P2, C2) => false.
cor(P1, C1) = msp(P2, E, M, Q, T) => false.
rep(P1, C1) = msp(P2, E, M, Q, T) => false.
msp(P1, E1, M1, Q1, T1) = msp(P2, E2, M2, Q2, T2)
  => P1 = P2 & E1 = E2 & M1 = M2 & Q1 = Q2 & T1 = T2.


%%%%%%%%%%%%%%%%%%%%%%%%%
% Strict partial orders %
%%%%%%%%%%%%%%%%%%%%%%%%%

% Irreflexivity:
prec(E, E) => false.
depends(P, C, P, C) => false.

% Transitivity:
prec(E1, E2) & prec(E2, E3) => prec(E1, E3).
depends(P1, C1, P2, C2) & depends(P2, C2, P3, C3)
  => depends(P1, C1, P3, C3).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Adversary Ordered Event Systems %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Introduction of relevant:
l(E) = msp(P2, E1, M, P1, T) & depends(P2, C, P2, M)
	=> relevant(P2, M, E) & relevant(P1, T, E)
	   & relevant(P2, C, E).
l(E) = msp(P2, E1, M, P1, T)
	=> relevant(P2, M, E) & relevant(P1, T, E).
l(E) = cor(P, C) => relevant(P, C, E).
l(E) = rep(P, C) => relevant(P, C, E).

% Adversary ordered:
relevant(P, C, E1) & relevant(P, C, E2) & l(E1) = cor(P, C)
  => prec(E1, E2) | prec(E2, E1) | E1 = E2.
relevant(P, C, E1) & relevant(P, C, E2) & l(E1) = rep(P, C)
  => prec(E1, E2) | prec(E2, E1) | E1 = E2.

%%%%%%%%%%%%%%%%%%%%%
% Saturated Queries %
%%%%%%%%%%%%%%%%%%%%%

% Rule 1
l(E) = msp(P2, E1, M, P1, T) & phi(P1, T, E)
  => phi(P2, M, E) | depends(P2, C, P2, M) & phi(P2, C, E).

% Rule 2
phi(P, C, E1)
 => prec(E0, E1) & l(E0) = cor(P, C).

% Rule 3
prec(E1, E2) & phi(P, C, E2) & l(E1) = rep(P, C)
  => prec(E1, E3) & prec(E3, E2) & l(E3) = cor(P, C).

% Rule 4
l(E1) = cor(P2, C) & ms_evt(E2) & prec(E1, E2) & relevant(P2, C, E2)
  => phi(P2, C, E2)
   | prec(E1, E3) & prec(E3, E2) & l(E3) = rep(P2, C).
```
