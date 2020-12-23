---
layout: frontpage
title: {{ site.title}}
---

\[[Prev](bcb_sq)\] \[[Top](../mutual)\] \[[Next](./bcb_sq_appraise)\]

## Simple complete sequence (ghost)

This Copland phrase takes the second of the two approaches described
in the previous example to obtaining the desired topology.  Recall
that we are interested in devising a strategy for embedding within the
attestation our phrase describes a sub-structure in which the client
initiates the attestation but the bank collects the final evidence.
In order to do this, we can introduce a level of indirection, as we
have done in this and the previous example.

```
*ghost: @client @bank attest bank sys -> @client prove client id
```

Here, a principal called `ghost` requests the client request an
attestation from the bank, i.e. perform the `attest` measurement
locally on `sys`.  The bank requests the client perform the `prove`
measurement locally on `id`, passing the result of its `attest`
measurement to the client for use as input to `prove`.  The client
performs `prove` and replies to the bank with its result, producing
the final evidence.  The bank then replies to the client with the
final evidence, which the client in turn forwards to the ghost.

By ignoring the ghost's initial request to the client and the chain of
replies from bank to ghost that propagate the final evidence upward,
we obtain our desired attestation structure. The final evidence type is

    m(msp(prove, client, id), client, m(msp(attest, bank, sys), bank, mt))

This is identical to the final evidence type of the previous example,
as we would expect.

We now return to the phrase of the previous example and resume the
sequential elimination of issues leading us to a good Copland phrase
for our use case.
