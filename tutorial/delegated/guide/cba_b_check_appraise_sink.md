---
layout: frontpage
title: {{ site.title}}
---

\[[Prev](./cba_b_check)\] \[[Top](../delegated)\] \[[Next](./cba_bc_check)\]

## Single delegated appraisal with sink

This Copland phrase represents a straightforward enrichment of the
previous one with the "appraise-sink" construction that we have
already used several times in the other use cases.  This permits us to
include an explicit appraiser `appraise` action preceding signature,
without affecting the format of final evidence.

```
*client: @bank [attest bank sys] -> @appraiser appraise appraiser bank -> {} +<+ !
```

The appraiser, after receiving the bank's `attest` result from the
client, first performs the `appraise` measurement on this input.
Assuming the `appraise` action taken on this input returns an
acceptable result, the appraiser will proceed to generate a signature
on the result of `attest`.  It sinks the result of the `appraise`
measurement into the null operator `{}`, which leaves this
intermediate result out of final evidence.

For reference, here is the phrase from the corresponding
certificate-style example:

    *client: @bank attest bank sys -> @appraiser appraise appraiser bank -> {} +<+ !

The final evidence type produced by this phrase is below.  It is
identical to that of the corresponding certificate-style phrase.

    s(mt, g(m(msp(attest, bank, sys), bank, mt), appraiser))

Note how this evidence format is, up to a composition with the empty
evidence `mt`, identical to the desired format from the previous
example.  This is the benefit of the appraise-sink technique.

We combine this notion of delegated appraisal and our previous mutual
attestation scenario in the next two examples, using this example's
phrase as a starting point for the first (bank's) half of a symmetric
"delegated mutual attestation."  In addition to furnishing us with
even more interesting examples, this will lead us to Copland phrases
of somewhat greater complexity, which will hopefully further
demonstrate the expressiveness and flexibility of the language.
