Require Import List.
Import List.ListNotations.
Require Import Omega.
Require Import Preamble More_lists Term.
Require Import Relations.
Require Import String.

(** Key type for asymmetric place keys.  [nat] is a placholder. *)
Definition Key : Type := nat.

(** Identifier for the specific ASP implementation associated with an abstract
    ASP term. [nat] is a placeholder *)
Definition ASPI : Type := nat.

(** A [Policy] is a relation among [ASP] and [ASPI] that defines what ASP
    implementation should be invoked to accompllsh a given USM or KIM task.
    The definition for [ASP] comes from the Copland [Term] definition *)
Definition Policy : Type := ASP -> ASPI -> Prop.

(** A [Place] is a [Key], [Policy] pair.  The name of a [Place] will be
    the hash of this pair, but there is no need to represent this here. *)
Definition Place : Type := Key*Policy.

(** [dispatch] maps an abstract [ASP] term to the [ASPI] instance that
    implements the [ASP]. *)
Definition dispatch:Type := ASP -> ASPI.

(** A dispatch function is compatible with a policy if it maps ASPs to ASPIs
    in a manner that satisifies the policy. *)
Definition compatible(p:Policy)(d:dispatch):Prop :=
  forall a:ASP, p a (d a).

(** A policy [q] greater than or equal to [p] if everything specified by
  [q] is allowed by [p].  The assumption is anything not specifically allowed
  by a policy is disallowed.  [policy_gte] is at least a preorder and may
  be a partial order.  Not sure yet. *)
Definition policy_gte(p q:Policy):Prop :=
  forall a:ASP, forall i:ASPI, (q a i) -> (p a i).

Lemma policy_gte_refl: forall p:Policy, policy_gte p p.
Proof.
  intros.
  unfold policy_gte.
  intros.
  assumption.
Qed.

Lemma policy_gte_trans: forall p q r:Policy,
    policy_gte p q -> policy_gte q r -> policy_gte p r.
Proof.
  intros p q r.
  unfold policy_gte in *.
  intros h0 h1.
  intros. apply h0. apply h1.
  assumption.
Qed.

Lemma policy_gte_antisym: forall p q:Policy,
    policy_gte p q -> policy_gte q p -> eq p q.
Proof.
  unfold policy_gte in *.
  intros.
Abort.

(** If a dispatch function is compatible with a policy and the policy is
    ordered with a second policy, the dispatch function is compatible with
    the second policy. *)
Lemma policy_gte_compatible: forall p q:Policy, forall d:dispatch,
      compatible p d -> policy_gte q p -> compatible q d.
Proof.
  intros p q. intros d.
  intros H0. intros H1.
  unfold compatible in *.
  unfold policy_gte in *.
  intros a. specialize H0 with a.
  specialize H1 with a (d a).
  auto.
Qed.
