\[[Prev](bcb_sq_appraise_sink.md)\] \[[Top](../mutual.md)\]

## (Attest, appraise) and (prove) in parallel

<a href="bcb_ps_appraise_sink.xhtml" target="_blank">[Output]</a>

As an example of a slightly different way of structuring the two
unilateral attestations that make up the mutual attestation, consider
the Copland phrase below.  This phrase differs from the previous one
in two ways:

1. Chiefly, we have replaced the sequential split operator `+<-`
  connecting the `appraise` and `prove` subterms (in which `appraise`
  receives input evidence and `prove` does not) with the parallel
  split operator `-~-` in which neither operation receives input
  evidence

2. The parentheses surrounding the entire `appraise` and `prove`
  subterm (everything on the right of the sequence operator `->`) have
  been dropped

```
*bank: @client @bank [attest bank sys] -> appraise client bank -> {} -~- prove client id
```

As before, the bank requests the client request an attestation from
it.  As a result of the second change, upon receiving this request,
the client issues the request to the bank *and* performs the `prove`
measurement locally on `id` in parallel.  The result of `prove` is
"set aside" while the bank performs `attest` and the client performs
`appraise` on the result of `attest`, exactly as before.  After
sinking the result of `appraise` into the `{}` operator, the client
now composes `mt` with the result of `prove` in parallel to form the
final evidence of type

    p(mt, m(msp(prove, client, id), client, mt))

Note that, except for the outermost symbol being `p` (indicating
parallel rather than sequential composition), this format is identical
to that of the previous example.

This phrase maintains all of the best elements of the previous one,
including an explicit `appraise` action and the desired final evidence
format.  One might actually consider this phrase an improvement over
the previous one, as here the `prove` measurement is taken in parallel
with the appraisal of the bank's attestation.  This highlights the
independence of the `prove` result as an evidence value from any
evidence produced by these other activities.
