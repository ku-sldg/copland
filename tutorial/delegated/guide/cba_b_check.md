---
layout: frontpage
title: {{ site.title}}
---

\[[Top](../delegated)\] \[[Next](./cba_b_check_appraise_sink)\]

## Single delegated implicit appraisal

The Copland phrase below describes the delegated appraisal scenario
very simply.

```
*client: @bank [attest bank sys] -> @appraiser ! 
```

The client initiates the attestation by requesting the bank perform
the `attest` measurement locally on `sys`. The bank does so and
replies to the client with the resultant evidence.  Next, the client
sends the bank's evidence to the appraiser for appraisal, which is
only implicit in this phrase.  In the event that the result of
appraisal is acceptable, the appraiser signs the bank's evidence,
indicated by the `!` operator, and returns this signed result to the
client, completing the attestation.

In this case, a valid signature from the appraiser on the bank's
evidence demonstrates to the client that the appraiser found the
bank's evidence to be acceptable.  A valid signature is thus
sufficient to permit the client to make a trust decision.  On the
basis of the appraiser's endorsement, the client is convinced of the
bank system's uncompromised state and agrees to proceed with the
intended login.  In practice, the client would seek to inject a nonce
into the appraiser's actions and therefore obtain additional assurance
that the appraiser endorsed the bank recently.

As a small object lesson in Copland, consider how this phrase and that
for the simplest certificate-style example are virtually identical:

    *client: @bank attest bank sys -> @appraiser !

We would expect to see such agreement, as both attestations require
the same two operations in the same sequence, with only the pattern of
requests and replies differing.

The final evidence produced by this phrase has type

    g(m(msp(attest, bank, sys), bank, mt), appraiser)

This is identical to the format of the certificate in the
corresponding certificate-style example.

This Copland phrase nicely captures the essential structure of the
delegated appraisal.  However, the appraisal action itself is only
implicit here, and we could improve the phrase significantly by making
it explicit.  We take this up in the next example.
