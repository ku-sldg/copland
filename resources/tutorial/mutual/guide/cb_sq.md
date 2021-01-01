---
layout: frontpage
title: {{site.title}} 
---

\[[Prev](bc_sq)\] \[[Top](../mutual)\] \[[Next](./bcb_sq)\]

## Simple sequence, reversed

<a href="cb_sq.xhtml" target="_blank">[Output]</a>

The Copland phrase below is identical to the previous one, with one
difference: here, the client, rather than the bank, initiates the
attestation.

```
*client: @bank [attest bank sys] -> prove client id
```

As before, the bank first sends the result of its local `attest`
measurement to the client, and then the client responds with its local
`prove` measurement.  However, present in this phrase is an event
preceding `attest` wherein the client requests the bank perform an
attestation.  Such a topology better describes a client-server login
interaction.

This swapping of place unfortunately introduces a new issue: the
client, not the bank, now receives the final evidence.  The bank must
be able to see the final evidence in any accurate depiction of the
scenario.

The final evidence type produced by this phrase is

    m(msp(prove, client, id), client, m(msp(attest, bank, sys), bank, mt))

As one would expect, this is identical to the final evidence produced
by the previous phrase.

Thus, while this phrase fixes one issue with the previous phrase, it
introduces a new one and does nothing to address the other two. The
outstanding issues are

* The client, and not the bank, receives the final evidence  

* We would also like to be able to represent the client's appraisal
  explicitly

* The final evidence received by the bank still contains the bank's
  own attestation as an input.  In our scenario, the bank should
  receive some form of credential from the client whose value is
  independent of the bank's earlier evidence
