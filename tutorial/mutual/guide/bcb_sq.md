\[[Prev](cb_sq.md)\] \[[Top](../mutual.md)\] \[[Next](./gcb_sq.md)\]

## Simple complete sequence

The Copland phrase below is an enrichment of the previous one in which
the bank receives the final evidence even as the client begins the
mutual attestation by requesting evidence from the bank.

```
*bank: @client @bank [attest bank sys] -> prove client id
```

The bank begins by requesting that the client request the bank perform
the `attest` measurement locally on `sys`.  After receiving this
measurement, the client performs the `prove` measurement locally on
`id` and returns this result to the bank.

Why do we need this indirection to obtain the attestation structure we
want?  The current Copland implementation adopts the convention that
the initiating place, in this case `bank`, always receives the final
evidence.  In this client-bank scenario, however, the place initially
requesting attestation and the place that receives the final evidence
are different.

In order to obtain the attestation structure we want, given this
convention, we might pursue two approaches:

1. The one chosen here, in which the bank in fact makes the first
request, which consists of a request to the client to begin the
attestation

2. Introducing a "ghost" principal that requests the client begin the
attestation and collects the final evidence.  Under this approach, one
ignores the series of replies that propagate the final evidence back
up to the ghost.  We consider this approach in the next example

The final evidence type produced by this phrase has the form

    m(msp(prove, client, id), client, m(msp(attest, bank, sys), bank, mt))
    
This is identical to the evidence produced by the previous two phrases.

Outstanding concerns:

* We would also like to be able to represent the client's appraisal
  explicitly

* Under this phrase, the final evidence received by the bank contains
  the bank's own attestation as an input. In our scenario, the bank
  should receive some form of credential from the client whose value
  is independent of the bank's earlier evidence

Before continuing to address these concerns, our next example will
consider the ghost principal approach to obtaining the desired
request-reply structure.
