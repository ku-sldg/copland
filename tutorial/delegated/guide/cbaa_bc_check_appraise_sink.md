\[[Prev](cba_bc_check_appraise_sink.md)\] \[[Top](../delegated.md)\] \[[Next](cbaa_bc_check_appraise_sink_ps.md)\]

## Double delegated appraisal with sink, distinct appraisers

The Copland phrase below is a straightforward generalization of the
previous one that admits the possibility that the bank and client rely
on distinct appraisers.

```
*client: @bank [attest bank sys] -> @appraiser1 [(appraise appraiser1 bank)
    -> {} +<+ !] -<- @bank @client [prove client id]
        -> @appraiser2 appraise appraiser2 client -> {} +<+ !
```

In the previous phrase, a single appraiser appraised both the client
and bank attestations.  Here, we suppose each has a distinct
appraiser.  Specifically, `appraiser1` appraises the bank's
attestation on behalf of the client, while `appraiser2` appraises the
client's attestation on behalf of the bank.

The final evidence type for the overall attestation is

    s(s(mt, g(m(msp(attest, bank, sys), bank, mt), appraiser1)), s(mt, g(m(msp(prove, client, id), client, mt), appraiser2)))

The final evidence type for the bank's attestation is

    s(mt, g(m(msp(attest, bank, sys), bank, mt), appraiser1))

and the final evidence type for the client's is

    s(mt, g(m(msp(prove, client, id), client, mt), appraiser2))

These formats are identical to those of the previous example up to
differentiation of the appraisers.
