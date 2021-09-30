(* APDT-specific event systems *)

(* LICENSE NOTICE

Copyright (c) 2018 The MITRE Corporation.
All Rights Reserved.

This proof script is free software: you can redistribute it and/or
modify it under the terms of the BSD License as published by the
University of California.  See license.txt for details. *)

(** APDT-specific event systems. *)

Require Import Omega Preamble More_lists Term Event_system.

(** Construct an event system from an annotated term, place, and
    evidence. *)

Fixpoint ev_sys (t: AnnoTerm) p e: EvSys Ev :=
  match t with
  | aasp (i, j) x => leaf (i, j) (asp_event i x p e)
  | aatt (i, j) q x =>
    before (i, j)
      (leaf (i, S i) (req i p q e))
      (before (S i, j)
              (ev_sys x q e)
              (leaf (pred j, j) (rpy (pred j) p q (aeval x q e))))
  | alseq r x y => before r (ev_sys x p e)
                          (ev_sys y p (aeval x p e))
  | abseq (i, j) s x y =>
    before (i, j)
           (leaf (i, S i)
                 (split i p e (sp (fst s) e)
                        (sp (snd s) e)))
           (before (S i, j)
                   (before (S i, (pred j))
                           (ev_sys x p (sp (fst s) e))
                           (ev_sys y p (sp (snd s) e)))
                   (leaf ((pred j), j)
                   (join (pred j) p
                         (aeval x p (sp (fst s) e))
                         (aeval y p (sp (snd s) e))
           (ss (aeval x p (sp (fst s) e))
               (aeval y p (sp (snd s) e))))))
  | abpar (i, j) s x y =>
    before (i, j)
           (leaf (i, S i)
                 (split i p e (sp (fst s) e)
                        (sp (snd s) e)))
           (before (S i, j)
                   (merge (S i, (pred j))
                          (ev_sys x p (sp (fst s) e))
                          (ev_sys y p (sp (snd s) e)))
                   (leaf ((pred j), j)
                   (join (pred j) p
                         (aeval x p (sp (fst s) e))
                         (aeval y p (sp (snd s) e))
           (pp (aeval x p (sp (fst s) e))
               (aeval y p (sp (snd s) e))))))
  end.

Lemma evsys_range:
  forall t p e,
    es_range (ev_sys t p e) = range t.
Proof.
  induction t; intros; simpl; auto;
    repeat expand_let_pairs; simpl; auto.
Qed.

Lemma well_structured_evsys:
  forall t p e,
    well_formed t ->
    well_structured ev (ev_sys t p e).
Proof.
  induction t; intros; inv H; simpl;
    repeat expand_let_pairs; destruct r as [i k];
      simpl in *; subst; auto.
  - apply ws_leaf_event; auto;
      destruct a; simpl; auto.
  - apply ws_before; simpl; auto.
    rewrite H4.
    apply ws_before; simpl; auto; rewrite evsys_range; auto.
  - apply ws_before; auto; repeat rewrite evsys_range; auto.
  - repeat (apply ws_before; simpl in *; auto; repeat rewrite evsys_range; auto).
  - repeat (apply ws_before; simpl in *; auto; repeat rewrite evsys_range; auto).
    repeat (apply ws_merge; simpl in *; auto; repeat rewrite evsys_range; auto).
Qed.

(** The events in the event system correspond to the events associated
    with a term, a place, and some evidence. *)

Lemma evsys_events:
  forall t p e ev,
    well_formed t ->
    ev_in ev (ev_sys t p e) <-> events t p e ev.
Proof.
  split; revert e; revert p; induction t; intros; inv H; simpl in *;
    repeat expand_let_pairs; simpl in *.
  - inv H0; auto; destruct a; simpl; auto.
  - rewrite H6 in H0; simpl in H0.
    inv H0; auto; inv H2; auto; inv H1; auto.
  - inv H0; auto.
  - rewrite H9 in H0; simpl in H0.
    inv H0; inv H2; auto; inv H1; auto.
  - rewrite H9 in H0; simpl in H0.
    inv H0; inv H2; auto; inv H1; auto.
  - inv H0; auto.
  - rewrite H6; simpl.
    inv H0; auto.
    rewrite H9 in H6.
    apply Nat.succ_inj in H6; subst; auto.
  - inv H0; auto.
  - rewrite H9; simpl.
    inv H0; auto.
    rewrite H12 in H9.
    apply Nat.succ_inj in H9; subst; auto.
  - rewrite H9; simpl.
    inv H0; auto.
    rewrite H12 in H9.
    apply Nat.succ_inj in H9; subst; auto.
Qed.

(** Maximal events are unique. *)

Lemma supreme_unique:
  forall t p e,
    well_formed t ->
    exists ! v, supreme (ev_sys t p e) v.
Proof.
  intros.
  assert (G: well_structured ev (ev_sys t p e)).
  apply well_structured_evsys; auto.
  rewrite <- unique_existence.
  split.
  - exists (max (ev_sys t p e)).
    apply supreme_max with (ev:=ev); auto.
  - unfold uniqueness.
    intros.
    rewrite <- sup_supreme with (ev:=ev) in H0; auto.
    rewrite <- sup_supreme with (ev:=ev) in H1; auto.
    revert H1.
    revert H0.
    revert G.
    revert e.
    revert p.
    induction H; intros.
    + destruct r as [i j]; simpl in *.
      inv H0; inv H1; auto.
    + destruct r as [i j]; simpl in *.
      repeat apply before_sup in H2.
      repeat apply before_sup in H3.
      inv H2; inv H3; auto.
    + destruct r as [i j]; simpl in *.
      repeat apply before_sup in H4.
      repeat apply before_sup in H5.
      eapply IHwell_formed2 in H4; eauto.
      inv G; auto.
    + destruct r as [i j]; simpl in *.
      repeat apply before_sup in H4.
      repeat apply before_sup in H5.
      inv H4; inv H5; auto.
    + destruct r as [i j]; simpl in *.
      repeat apply before_sup in H4.
      repeat apply before_sup in H5.
      inv H4; inv H5; auto.
Qed.

Lemma evsys_max_unique:
  forall t p e,
    well_formed t ->
    unique (supreme (ev_sys t p e)) (max (ev_sys t p e)).
Proof.
  intros.
  assert (G: well_structured ev (ev_sys t p e)).
  apply well_structured_evsys; auto.
  unfold unique.
  split.
  apply supreme_max with (ev:=ev); auto.
  intros.
  rewrite <- sup_supreme with (ev:=ev) in H0; auto.
  revert H0.
  revert G.
  revert x'.
  revert e.
  revert p.
  induction H; intros; destruct r as [i j]; inv G; simpl in *; auto.
  - inv H0; auto.
  - repeat apply before_sup in H2.
    inv H2; auto.
  - repeat apply before_sup in H4.
    apply IHwell_formed2 in H4; auto.
  - repeat apply before_sup in H4.
    inv H4; auto.
  - repeat apply before_sup in H4.
    inv H4; auto.
Qed.

(** Maximal event evidence output matches [aeval]. *)

Definition out_ev v :=
  match v with
  | copy _ _ e => e
  | kmeas _ _ _ _ e => e
  | umeas _ _ _ _ e => e
  | sign _ _ _ e => e
  | hash _ _ _ e => e
  | req _ _ _ e => e
  | rpy _ _ _ e => e
  | split _ _ _ _ e => e
  | join _ _ _ _ e => e
  end.

Lemma max_eval:
  forall t p e,
    well_formed t ->
    out_ev (max (ev_sys t p e)) = aeval t p e.
Proof.
  intros.
  revert e.
  revert p.
  induction H; intros; simpl; repeat expand_let_pairs; simpl; auto.
  destruct x; simpl; auto.
Qed.
