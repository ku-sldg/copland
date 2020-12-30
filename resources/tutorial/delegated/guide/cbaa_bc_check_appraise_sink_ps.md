---
layout: frontpage
title: {{ site.title}}
---

\[[Prev](cbaa_bc_check_appraise_sink)\] \[[Top](../delegated)\]

## Double delegated appraisal with sink, distinct appraisers, parallel split

<a href="cbaa_bc_check_appraise_sink_ps.xhtml" target="_blank">[Output]</a>

The only difference between this Copland phrase and the previous one
lies in the type of splitting operator used to join the bank's
attestation and appraisal of its results with the client's.
Specifically, we have replaced the previous sequential split operator
`<` joining the two halves of the attestation with a parallel split
operator `~`.  This change means that we no longer specify the order
in which the two attestation-appraisal operations occur.

```
*client: @bank [attest bank sys] -> @appraiser1 [(appraise appraiser1 bank)
    -> {} +<+ !] -~- @bank @client [prove client id]
        -> @appraiser2 appraise appraiser2 client -> {} +<+ !
```

As we would expect, the final evidence type produced by this phrase is

   p(s(mt, g(m(msp(attest, bank, sys), bank, mt), appraiser1)), s(mt, g(m(msp(prove, client, id), client, mt), appraiser2)))

This differs from the previous format only in that the two appraisal
results are composed in parallel here.

In our substructure of interest, the bank's attestation ends with
evidence of type

    s(mt, g(m(msp(attest, bank, sys), bank, mt), appraiser1))

and the client's attestation ends with evidence of type

    s(mt, g(m(msp(prove, client, id), client, mt), appraiser2))

These formats are identical to the corresponding results of the
previous example.

It is interesting to note that relaxing the requirement that the
bank's attestation and appraisal strictly precede the client's, one of
the defining features of our original scenario, has virtually no
effect on evidence formats.  This is emphatically true of the two
appraisal results, which are unaffected by the change.
