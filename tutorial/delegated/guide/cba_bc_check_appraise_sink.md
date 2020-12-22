---
layout: frontpage
title: {{ site.title}}
---

\[[Prev](./cba_bc_check.md)\] \[[Top](../delegated.md)\] \[[Next](cbaa_bc_check_appraise_sink.md)\]

## Double delegated appraisal with sink

The Copland phrase below simply applies the appraise-sink technique to
make the appraisals of the previous phrase explicit without affecting
key evidence.  We continue to ignore extraneous requests and replies
and concentrate only on the attestation substructure of interest.

```
*client: @bank [attest bank sys] -> @appraiser [(appraise appraiser bank)
    -> {} +<+ !] -<- @bank @client [prove client id]
        -> @appraiser appraise appraiser client -> {} +<+ !
```

The final evidence type produced by this phrase is

    s(s(mt, g(m(msp(attest, bank, sys), bank, mt), appraiser)), s(mt, g(m(msp(prove, client, id), client, mt), appraiser)))

In our substructure of interest, the bank's attestation ends with
evidence of type

    s(mt, g(m(msp(attest, bank, sys), bank, mt), appraiser))

and the client's attestation ends with evidence of type

    s(mt, g(m(msp(prove, client, id), client, mt), appraiser)),

as desired.

This brief series of "delegated mutual attestation" examples hints at
the diversity of possible composite attestation structures one might
obtain by combining simpler ones.  A top-down conception of a
"complex" attestation as a coordination of "simple" attestations
(possibly plus some overhead) pairs well with our bottom-up approach
to writing complex Copland phrases.
