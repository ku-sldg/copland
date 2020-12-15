\[[Top](../cert.md)\] \[[Next](./cba_appraise.md)\]

## Simple certificate-style

The Copland phrase below describes the certificate-style attestation
in a very simple form.

```
*client: @bank attest bank sys -> @appraiser !
```

In this phrase, the client requests the bank perform the `attest`
measurement locally on `sys`.  Note that `attest` might be a bundle of
several measurements taken on distinct local targets, as in a layered
attestation.  The bank then provides the result of `attest` to the
appraiser.  The appraiser performs the signature operation, denoted by
`!`, on the result of `attest`.  It then returns this signed value,
the "certificate," to the bank, which in turn forwards it to the
client as the final evidence.

In our scenario, the client would respond to a valid certificate with
a proof of identity.  This is a separate attestation with a different
structure, and we therefore do not represent the client's identity
proof.

Representing the certificate as the appraiser's signature on the
bank's attestation is minimal and sufficient to declare the
appraiser's endorsement of the evidence's acceptability.  The client
will in turn verify the appraiser's signature and accept the bank's
attestation on this basis.  In practice, the client might like a
guarantee of the certificate's freshness and thus might inject a nonce
into the attesation at the outset.

Note that in this simple scheme (indeed all examples we give for this
use case), the bank executes whatever Copland phrase is chosen by the
client.  In practice, the client, bank and appraiser might need to
negotiate the final phrase according to what the client wishes to
know, what the bank is willing to divulge and what the appraiser has
the capabilities to verify.

The final evidence type produced by this phrase is

    g(m(msp(attest, bank, sys), bank, mt), appraiser)

The certificate is the appraiser-signed (indicated by the `g` function
taken at the place `appraiser`) result of the bank's `attest`
measurement.

This simple phrase is already a good description of the scenario.
However, we would like to include an explicit appraisal action taken
by the appraiser on the bank's measurement, and this we consider in
the next example.
