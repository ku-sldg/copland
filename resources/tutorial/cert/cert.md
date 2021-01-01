---
layout: frontpage
title: {{site.title}} 
---

\[[Top](../README)\]

# Certificate-style attestation

This use case explores an attestation structure that turns on use of a
"certificate," an authoritative artifact that endorses the
acceptability of evidence.  An attester and relying party respectively
obtain and use a certificate issued by a mutually trusted appraiser to
complete an attestation.

We return to the framing scenario of the client and bank, in which the
client wishes to log into the bank's website but not before the bank
provides evidence that its site is uncompromised. We moreover admit
the possibility that the client is unable to appraise the bank's
attestation directly. In this case, the client can request the bank
obtain a certificate on its attestation from an appraiser whom it
trusts and instead present this as evidence of its lack of compromise.
The burden of appraising the bank's evidence is thus shifted onto the
appraiser, who will only issue a certificate on acceptable evidence.


      ┌────────────────┐
      │                │
      │   appraiser    │
      │                │ 
      │                │
      └────────────────┘
           │      ▲
           │      │
           │      │
      cert │      │ attest
           │      │
           │      │
           ▼      │
      ┌────────────────┐              ┌────────────────┐              
      │                │      req     │                │
      │      bank      │◄─────────────│     client     │
      │                │      cert    │                │
      │                │─────────────►│                │
      └────────────────┘              └────────────────┘


Each example below contains a Copland phrase addressing this
scenario. Later phrases are refinements of preceding ones: we
recommend proceeding through the examples in order. We strongly
encourage those new to Copland to work through the [mutual attestation](../mutual/mutual) series of examples before these.

 * [Simple certificate-style](guide/cba)
 * [Explicit appraisal](guide/cba_appraise)
 * [Explicit appraisal with sink](guide/cba_appraise_sink)
