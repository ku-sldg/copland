---
layout: frontpage
title: {{ site.title}}
---

\[[Top](../README)\]

# Delegated appraisal

In some sense, the delegated appraisal use case represents the
mirror-image of the certificate-style use case. In the
certificate-style structure, the attester is responsible for
submitting evidence to the appraiser and obtaining the appraiser's
endorsement of the acceptability of that evidence.  Here, the attester
simply prepares the requested evidence and hands it off to the relying
party.  It is the responsibility of the relying party to seek the
appraiser's endorsement.

The scenario we envision for this use case is identical to that of the
certificate-style use case.  A client wishes to log into their bank's
website but will not furnish a proof of identity (i.e. provide account
credentials) until it has obtained some assurance that the bank
website is uncompromised.  The client may moreover be unable to
appraise the bank's evidence, and so the bank and client agree to rely
on the endorsement of a mutually trusted third-party appraiser to
complete the attestation.  The client submits the bank's evidence to
the appraiser for appraisal, and the appraiser responds with the
results of appraisal in a format the client understands.  The client
can then use the appraisal results to make a trust decision about the
compromise state of the bank's system.


      ┌────────────────┐
      │                │
      │   appraiser    │
      │                │ 
      │                │
      └────────────────┘
           │      ▲
           │      │
           │      │
    result │      │ attest
           │      │
           │      │
           ▼      │
      ┌────────────────┐              ┌────────────────┐              
      │                │      req     │                │
      │     client     │─────────────►│      bank      │
      │                │     attest   │                │
      │                │◄─────────────│                │
      └────────────────┘              └────────────────┘


Each example contains a Copland phrase describing this attestation
structure.  The first two examples consider the case in which only the
bank attests.  The latter two elaborate on this and consider the case
in which both client and bank furnish attestations, both mediated by
the appraiser.  We recommend visiting these examples in order, and we
strongly recommend new Copland users begin with the [mutual attestation](../mutual/mutual) use case before proceeding to these
examples.

 * [Single delegated implicit appraisal](guide/cba_b_check)
 * [Single delegated appraisal with sink](guide/cba_b_check_appraise_sink)
 * [Double delegated implicit appraisal](guide/cba_bc_check)
 * [Double delegated appraisal with sink](guide/cba_bc_check_appraise_sink)
 * [Double delegated appraisal with sink, distinct appraisers](guide/cbaa_bc_check_appraise_sink)
 * [Double delegated appraisal with sink, distinct appraisers, parallel split](guide/cbaa_bc_check_appraise_sink_ps)
