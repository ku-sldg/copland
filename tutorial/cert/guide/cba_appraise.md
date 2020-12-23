---
layout: frontpage
title: {{ site.title}}
---

\[[Prev](./cba)\] \[[Top](../cert)\] \[[Next](./cba_appraise_sink)\]

## Explicit appraisal

The Copland phrase below represents an enhancement of the previous one
with an explicit `appraise` action taken by the appraiser on the
bank's `attest` result.

```
*client: @bank attest bank sys -> @appraiser appraise appraiser bank +<+ !
```

After the bank requests the certificate from the appraiser, sending
the result of its `attest` measurement, the appraiser will first
perform the `appraise` action on this input and subsequently generate
a signature on it.  We know this because the `appraise` and `!`
operations are joined with `+<+`, the sequential split operator where
both sides receive full input evidence.  The `appraise` action
produces evidence of type

    m(msp(appraise, appraiser, bank), appraiser, m(msp(attest, bank, sys), bank, mt))

In the event that the appraisal evidence indicates the bank's system
is uncompromised, the appraiser will perform the signature operation
on the result of `attest` and sequentially compose this signature with
the `appraise` evidence to form the final evidence of type:

    s(m(msp(appraise, appraiser, bank), appraiser, m(msp(attest, bank, sys), bank, mt)), g(m(msp(attest, bank, sys), bank, mt), appraiser))

We have managed to extend our first-effort Copland phrase with an
explicit appraisal step that has the correct precedence relationship
with the signature generation action that produces the certificate.
However, in adding this appraisal action, we have disrupted the form
of our final evidence.  Rather than a self-contained certificate, what
is provided to the client is the desired certificate along with the
`appraise` results.  In our scenario, these results are not of
interest (and might even be meaningless) to the client.  We would
therefore like to find a refinement of this phrase that keeps in the
explicit `appraise` action while ensuring the final evidence consists
only of the certificate.  We consider such a refinement in the next
example.
