---
layout: frontpage
title: {{ site.title}}
---

\[[Prev](./cba_b_check_appraise_sink)\] \[[Top](../delegated)\] \[[Next](./cba_bc_check_appraise_sink)\]

## Double delegated implicit appraisal

<a href="cba_bc_check.xhtml" target="_blank">[Output]</a>

This Copland phrase elaborates on that of the [single delegated implicit appraisal](./cba_b_check) example by following it with the
client's identity proof.  We also suppose the bank uses an appraiser
to verify this proof.  In general, the bank and client appraisers are
distinct, but in this example we assume they share a common appraiser
for the sake of simplicity.

```
*client: @bank [attest bank sys] -> @appraiser [!] -<- @bank @client [prove client id] -> @appraiser !
```

This phrase consists of two subterms joined by a sequential split
operator `<` which sends no input evidence either left or right.  The
left subterm is the Copland phrase from [single delegated implicit appraisal](./cba_b_check) with only a set of braces added around
the `!` to enforce the correct precedence.  The right subterm
represents the client's attestation to the bank and its delegated
appraisal via the appraiser.  The bank requests the client perform the
`prove` measurement locally on `id`.  The client returns the result of
this measurement to the bank, which forwards it to the appraiser for
appraisal, (implicit here) and endorsing signature.  The interaction
ends with the bank receiving the signed client attestation from the
appraiser.

The accompanying visualization of this phrase's execution differs
slightly from what has been described.  Specifically, the client
appears to request the bank request the client perform an attestation.
Moreover, after the appraiser replies to the bank with the client's
validated attestation, the bank forwards this result to the client,
who joins it sequentially with the bank's signed attestation to
produce the final evidence, which has type:

    s(g(m(msp(attest, bank, sys), bank, mt), appraiser), g(m(msp(prove, client, id), client, mt), appraiser))

As discussed in the [mutual attestation](../../mutual/mutual) use
case, this is a consequence of the current Copland convention that the
place initiating the attestation always collects the final evidence.
The client, which begins the attestation in our scenario, must collect
the final evidence as a consequence of this convention.  However, the
attestation of interest is contained as a substructure of the larger
one described by this phrase. As we argued in [mutual attestation](../../mutual/mutual), we can ignore extraneous
requests and replies and concentrate only on the substructure of
interest.

Along these lines, note that the final evidence is the sequential
composition of the separate appraisal results of the bank's and
client's attestations.  However, in the substructure of interest, we
really have two smaller attestations, each with its own "final"
evidence.  From the client's perspective, the final evidence is the
appraisal result on the bank's evidence and vice versa from the bank's
perspective.  We can check, using the visualization, that the client
and bank each receive the evidence they expect at the appropriate
point.

We would again like to make the appraisal actions explicit without
affecting the format of final evidence.  The next example applies the
appraise-sink technique to do exactly this.
