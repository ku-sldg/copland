\[[Prev](bcb_sq_appraise.md)\] \[[Top](../mutual.md)\] \[[Next](bcb_ps_appraise_sink.md)\]

## Appraised complete sequence with sink

<a href="bcb_sq_appraise_sink.xhtml" target="_blank">[Output]</a>

The Copland phrase below is an enhancement of the previous one that
includes a sink for the result of `appraise`.  This enables the event
that produces the `appraise` result to be sequenced relative to other
events while avoiding the consequence that the value appear in
subsequent evidence.

```
*bank: @client @bank [attest bank sys] -> (appraise client bank -> {} +<- prove client id)
```

Just as before, we send the result of the bank's `attest` measurement
to the client as input to `appraise`, the outcome of which determines
whether the client subsequently performs the `prove` measurement.
Here, however, we send the `appraise` result to the null operator
`{}`.  This operator takes input evidence and simply returns the empty
evidence `mt`.  In terms of evidence semantics, the entire subterm
`appraise client bank -> {}` is equivalent to `mt`.  We compose this
with the result of `prove client id` to form the final evidence, which
has type:

    s(mt, m(msp(prove, client, id), client, mt))

Using the null operator `{}` to consume the result of `appraise`
preserves the correct precedence between an explicit `appraise`
operation and the client's `prove` operation while eliminating the
evidence product of `appraise` (and its input, the result of `attest`)
from the final evidence.  Up to a composition with `mt`, only the
result of `prove`, the client's identity proof, is received by the
bank, as desired.

This attestation consists of two separate attestations that occur in
order.  In this case, evidence produced during the first attestation
should not appear in evidence produced during the second.
Nevertheless, a good outcome for the first attestation is necessary as
a prerequisite for execution of the second.  This sink technique shows
how compound attestations of this type might be constructed.
 
By starting with a very simple Copland phrase and incrementally
building upon it, we have arrived at a rich description of this
scenario that highlights some essential aspects of mutual attestation.

In the next example, we examine the effect of relaxing the requirement
that the bank's attestation precede the client's.
