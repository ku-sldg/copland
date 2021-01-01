---
layout: frontpage
title: {{site.title}} 
---

\[[Prev](gcb_sq)\] \[[Top](../mutual)\] \[[Next](./bcb_sq_appraise_sink)\]

## Appraised complete sequence

<a href="bcb_sq_appraise.xhtml" target="_blank">[Output]</a>

This Copland phrase represents an attempt to add an explicit appraisal
action to the client's set of behaviors during the attestation.

```
*bank: @client @bank [attest bank sys] -> (appraise client bank +<- prove client id)
```

Starting with the Copland phrase from the [Simple complete sequence](./bcb_sq) example, we have added a measurement called
`appraise`, which the client performs locally on `bank`.  After
receiving the result `attest`, the client first performs `appraise`
and then proceeds to perform `prove` as before.  This measurement
ordering is indicated by the use of the sequential split operator `<`.
The client combines these results sequentially and returns them to the
bank, producing the final evidence.

Of course, the client does not take a `prove` measurement if the
result of `attest` is unacceptable.  For this reason, `appraise` must
precede `prove`, as it does in this phrase.  A future version of
Copland could include support for conditional branching based on the
result of an intermediate appraisal such as we see here.  This would
allow one or another phrase to execute based on intermediate appraisal
results.

One important detail of this particular sequential composition is the
way in which the `appraise` and `prove` measurements receive the
incoming evidence, the result of `attest`.  The `+` to the left of the
sequential split operator `<` indicates that the measurement on the
left, `appraise`, receives the incoming evidence as input.  By
contrast, the `-` to the right of `<` indicates that `prove` does not
receive the incoming evidence.  We can use splitting operators with
different input evidence functions to represent dependencies
succinctly.

This operator best captures how `appraise` and `prove` depend
differently on the result of `attest`.  The `appraise` operation takes
the `attest` result as a direct input and outputs, in some sense,
either "acceptable" or "unacceptable".  The result of `appraise`
directly depends on the result of `attest`.  On the other hand,
`prove` depends on the `attest` result via its dependence on the
result of `appraise`, but the result of the `prove` operation is
independent of the value of `attest`.  Thus, `prove` need not receive
the result of `attest`.

The final evidence type produced by this Copland phrase is

    s(m(msp(appraise, client, bank), client, m(msp(attest, bank, sys), bank, mt)), m(msp(prove, client, id), client, mt))

This says that we sequentially join the result of `appraise`, which
takes the result of `attest` as input, with the result of `prove`,
which does not have any inputs.  In this case, `appraise` takes place
before `prove`, and since `appraise` depends on the result of attest
`attest`, this last must take place before either.

Our final outstanding concern deals with the format of the final
evidence.  This template suggests that the final evidence is a bundle
of three measurements that has a certain sequential structure.  In our
scenario, however, the bank only receives the client's `prove` result
at the end of the attestation.  We would thus like to "sink" the
intermediate `attest` result in such a way that `prove` still depends
on it (via `appraise`) but where it does not appear in the final
evidence.  We take up this improvement in the next example.
