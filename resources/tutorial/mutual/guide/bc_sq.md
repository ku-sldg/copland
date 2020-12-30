\[[Top](../mutual.md)\] \[[Next](./cb_sq.md)\]

## Simple sequence

<a href="bc_sq.xhtml" target="_blank">[Output]</a>

The Copland phrase below expresses the simplest example of a mutual
attestation for this scenario.

```
*bank: attest bank sys -> @client prove client id
```

The bank first attests to the integrity of its system.  We have
expressed this as the bank performing the `attest` measurement locally
on `sys`.  It could be that `attest` is composed of sub-measurements
that have been bundled together, as in a layered attestation.  The
client receives the result of this measurement and implicitly
appraises it.  If the measurement value is acceptable, the client
proceeds to prove its identity to the bank, which we have expressed as
the client performing the `prove` measurement on `id`.  It sends the
result of this identity proof to the bank for appraisal
(verification).

The final evidence produced by this Copland phrase has type

    m(msp(prove, client, id), client, m(msp(attest, bank, sys), bank, mt))

This says that the final evidence is the result of performing the
`prove` measurement from the place identified by `client` with target
`id` also on place `client`.  This measurement has as input evidence
the result of performing the `attest` measurement from the place
identified by `bank` with target `sys` also on place `bank` with empty
input evidence.

This Copland phrase is simple and captures the sequential nature of
mutual attestation in this scenario.  However, it lacks some detail
necessary to offer a satisfying characterization of this scenario:

* In this phrase, the bank offers up its `attest` result apparently
  voluntarily to the client for appraisal, when in fact the client
  specifically requests this attestation from the bank

* We would like to be able to represent the client's appraisal action
  explicitly

* The final evidence received by the bank contains the bank's own
  attestation as an input.  In our scenario, the bank should receive
  some form of credential from the client whose value is independent
  of the bank's earlier evidence
