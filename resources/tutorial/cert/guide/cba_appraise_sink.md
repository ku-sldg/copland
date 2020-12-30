\[[Prev](./cba_appraise.md)\] \[[Top](../cert.md)\]

## Explicit appraisal with sink

<a href="cba_appraise_sink.xhtml" target="_blank">[Output]</a>

This Copland phrase enriches the previous one with a sink for the
evidence output by the `appraise` action.  This is the same technique
we also applied in the [mutual attestation](../../mutual/mutual.md)
use case to ensure a correct format for final evidence.

```
*client: @bank attest bank sys -> @appraiser appraise appraiser bank -> {} +<+ !
```

Adding this sink permits us to preserve the correct sequence of the
`appraise` and `!` operations (i.e. the signature is generated after
an `appraise` operation returns an acceptable result) without having
to include the former operation's output in evidence. Thus, the final
evidence produced by this phrase has type

    s(mt, g(m(msp(attest, bank, sys), bank, mt), appraiser))

This differs from the desired format by a sequential composition of
the certificate with the empty evidence `mt`. This composition with
`mt` can reasonably be interpreted as simply the certificate, our
desired final evidence.

This example has illustrated one way to coordinate an attestation
involving a third-party appraiser. In the next use case, we will
examine a second approach for doing this.
