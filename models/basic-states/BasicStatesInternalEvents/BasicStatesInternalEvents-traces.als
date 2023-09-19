/*
   Automatically created via translation of a Dash model to Alloy
   on 2023-09-08 12:00:35
*/

open util/boolean
open util/traces[DshSnapshot] as DshSnapshot

// basic states with internal events

abstract sig DshStates {}
abstract sig Root extends DshStates {} 
one sig Root_S1 extends Root {} 
one sig Root_S2 extends Root {} 
one sig Root_S3 extends Root {} 

abstract sig Transitions {}
one sig NO_TRANS extends Transitions {} 
one sig Root_S1_t1 extends Transitions {} 
one sig Root_S1_t2 extends Transitions {} 
one sig Root_S2_t3 extends Transitions {} 
one sig Root_S3_t4 extends Transitions {} 
one sig Root_S2_t4 extends Transitions {} 

abstract sig DshEvents {}
abstract sig DshIntEvents extends DshEvents {} 
one sig Root_E1 extends DshIntEvents {} 
one sig Root_E2 extends DshIntEvents {} 

sig DshSnapshot {
  dsh_conf0: set DshStates,
  dsh_taken0: set Transitions,
  dsh_events0: set DshEvents
}

pred dsh_initial [
	s: one DshSnapshot] {
  ((s.dsh_conf0) = Root_S1) &&
  ((s.dsh_taken0) = NO_TRANS) &&
  (((s.dsh_events0) :> DshIntEvents) = none)
}

pred Root_S1_t1_pre [
	s: one DshSnapshot] {
  some (Root_S1 & (s.dsh_conf0))
}


pred Root_S1_t1_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) - ((Root_S1 + Root_S2) + Root_S3)) +
     Root_S2)
  (sn.dsh_taken0) = Root_S1_t1
}

pred Root_S1_t1 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_S1_t1_pre
  sn.(s.Root_S1_t1_post)
}

pred Root_S1_t2_pre [
	s: one DshSnapshot] {
  some (Root_S1 & (s.dsh_conf0))
  Root_E1 in (s.dsh_events0)
}


pred Root_S1_t2_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) - ((Root_S1 + Root_S2) + Root_S3)) +
     Root_S3)
  (sn.dsh_taken0) = Root_S1_t2
}

pred Root_S1_t2 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_S1_t2_pre
  sn.(s.Root_S1_t2_post)
}

pred Root_S2_t3_pre [
	s: one DshSnapshot] {
  some (Root_S2 & (s.dsh_conf0))
  Root_E2 in (s.dsh_events0)
}


pred Root_S2_t3_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) - ((Root_S1 + Root_S2) + Root_S3)) +
     Root_S3)
  (sn.dsh_taken0) = Root_S2_t3
}

pred Root_S2_t3 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_S2_t3_pre
  sn.(s.Root_S2_t3_post)
}

pred Root_S3_t4_pre [
	s: one DshSnapshot] {
  some (Root_S3 & (s.dsh_conf0))
  Root_E1 in (s.dsh_events0)
}


pred Root_S3_t4_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) - ((Root_S1 + Root_S2) + Root_S3)) +
     Root_S2)
  (sn.dsh_taken0) = Root_S3_t4
}

pred Root_S3_t4 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_S3_t4_pre
  sn.(s.Root_S3_t4_post)
}

pred Root_S2_t4_pre [
	s: one DshSnapshot] {
  some (Root_S2 & (s.dsh_conf0))
  Root_E1 in (s.dsh_events0)
}


pred Root_S2_t4_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) - ((Root_S1 + Root_S2) + Root_S3)) +
     Root_S1)
  (sn.dsh_taken0) = Root_S2_t4
}

pred Root_S2_t4 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_S2_t4_pre
  sn.(s.Root_S2_t4_post)
}

pred dsh_small_step [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  { (sn.(s.Root_S1_t1)) ||
    (sn.(s.Root_S1_t2)) ||
    (sn.(s.Root_S2_t3)) ||
    (sn.(s.Root_S3_t4)) ||
    (sn.(s.Root_S2_t4)) ||
    ((!({ (s.Root_S1_t1_pre) ||
            (s.Root_S1_t2_pre) ||
            (s.Root_S2_t3_pre) ||
            (s.Root_S3_t4_pre) ||
            (s.Root_S2_t4_pre) })) &&
       (sn.(s.dsh_stutter))) }
}

pred dsh_stutter [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) = (s.dsh_conf0)
  (sn.dsh_taken0) = NO_TRANS
  ((sn.dsh_events0) :> DshIntEvents) = none
}

fact allSnapshotsDifferent {
  (all s: one
  DshSnapshot,sn: one
  DshSnapshot | (((s.dsh_conf0) = (sn.dsh_conf0)) &&
                   ((s.dsh_taken0) = (sn.dsh_taken0)) &&
                   ((s.dsh_events0) = (sn.dsh_events0))) =>
                  (s = sn))
}

pred dsh_enough_operations {
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_S1_t1))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_S1_t2))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_S2_t3))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_S3_t4))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_S2_t4))
}

fact dsh_traces_fact {
  DshSnapshot/first.dsh_initial
  {(some
  DshSnapshot/back)=>
    ((all s: DshSnapshot | (s.DshSnapshot/next).(s.dsh_small_step)))
  else
    ((all s: one
    (DshSnapshot - DshSnapshot/last) | (s.DshSnapshot/next).(s.dsh_small_step)))}

}

pred dsh_strong_no_stutter {
  (all s: DshSnapshot | { (s = DshSnapshot/first) ||
                          (NO_TRANS !in (s.dsh_taken0)) })
}

