---
layout: frontpage
title: {{ site.title}}
---

\[[Top](../README.md)\]

# Mutual attestation

In this use case, we envision a scenario in which two parties produce
evidence resulting from a local measurement.  Each party wishes to
communicate its result to the other for appraisal, but one of the
parties will not do so until it has appraised the other's evidence and
found it acceptable.  The mutual attestation thus consists of two
unilateral attestations that occur in a particular order.

We use the example of a client who wishes to log into their bank's
website.  Before granting access, the bank requires the client to
authenticate with their username and password, i.e. present a proof of
identity.  However, the client does not wish to share their
credentials with the bank website until they are assured that the
bank's systems are uncompromised.  The bank must first present its
proof of system integrity for the client to appraise, and the results
of appraisal must indicate the bank's systems are pristine, before the
client will reply with its proof of identity to complete the login
request.

Each example below contains a Copland phrase written to address this
scenario.  Later examples are generally refinements of earlier ones.
It is recommended, especially for readers who are new to Copland, to
begin with the first example and proceed in order.

 * [Simple sequence](guide/bc_sq.md)
 * [Simple sequence, reversed](guide/cb_sq.md)
 * [Simple complete sequence](guide/bcb_sq.md)
 * [Simple complete sequence (ghost)](guide/gcb_sq.md)
 * [Appraised complete sequence](guide/bcb_sq_appraise.md)
 * [Appraised complete sequence with sink](guide/bcb_sq_appraise_sink.md)
 * [(Attest, appraise) and (prove) in parallel](guide/bcb_ps_appraise_sink.md)
