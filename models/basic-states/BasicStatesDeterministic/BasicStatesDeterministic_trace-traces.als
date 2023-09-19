/*
   Automatically created via translation of a Dash model to Alloy
   on 2023-09-07 13:40:01
*/

open util/boolean
open util/traces[DshSnapshot] as DshSnapshot
abstract sig DshStates {}
abstract sig SRoot extends DshStates {} 
one sig SRoot_S0 extends SRoot {} 
one sig SRoot_S1 extends SRoot {} 
one sig SRoot_S2 extends SRoot {} 

abstract sig Transitions {}
one sig NO_TRANS extends Transitions {} 
one sig SRoot_S0_t1 extends Transitions {} 
one sig SRoot_S1_t2 extends Transitions {} 
one sig SRoot_S2_t3 extends Transitions {} 

sig DshSnapshot {
  dsh_conf0: set DshStates,
  dsh_taken0: set Transitions
}

pred dsh_initial [
	s: one DshSnapshot] {
  ((s.dsh_conf0) = SRoot_S0) && ((s.dsh_taken0) = NO_TRANS)
}

pred SRoot_S0_t1_pre [
	s: one DshSnapshot] {
  some (SRoot_S0 & (s.dsh_conf0))
}


pred SRoot_S0_t1_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) - ((SRoot_S0 + SRoot_S1) + SRoot_S2)) +
     SRoot_S1)
  (sn.dsh_taken0) = SRoot_S0_t1
}

pred SRoot_S0_t1 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.SRoot_S0_t1_pre
  sn.(s.SRoot_S0_t1_post)
}

pred SRoot_S1_t2_pre [
	s: one DshSnapshot] {
  some (SRoot_S1 & (s.dsh_conf0))
}


pred SRoot_S1_t2_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) - ((SRoot_S0 + SRoot_S1) + SRoot_S2)) +
     SRoot_S2)
  (sn.dsh_taken0) = SRoot_S1_t2
}

pred SRoot_S1_t2 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.SRoot_S1_t2_pre
  sn.(s.SRoot_S1_t2_post)
}

pred SRoot_S2_t3_pre [
	s: one DshSnapshot] {
  some (SRoot_S2 & (s.dsh_conf0))
}


pred SRoot_S2_t3_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) - ((SRoot_S0 + SRoot_S1) + SRoot_S2)) +
     SRoot_S0)
  (sn.dsh_taken0) = SRoot_S2_t3
}

pred SRoot_S2_t3 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.SRoot_S2_t3_pre
  sn.(s.SRoot_S2_t3_post)
}

pred dsh_small_step [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  { (sn.(s.SRoot_S0_t1)) ||
    (sn.(s.SRoot_S1_t2)) ||
    (sn.(s.SRoot_S2_t3)) ||
    ((!({ (s.SRoot_S0_t1_pre) ||
            (s.SRoot_S1_t2_pre) ||
            (s.SRoot_S2_t3_pre) })) &&
       (sn.(s.dsh_stutter))) }
}

pred dsh_stutter [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) = (s.dsh_conf0)
  (sn.dsh_taken0) = NO_TRANS
}

fact allSnapshotsDifferent {
  (all s: one
  DshSnapshot,sn: one
  DshSnapshot | (((s.dsh_conf0) = (sn.dsh_conf0)) &&
                   ((s.dsh_taken0) = (sn.dsh_taken0))) =>
                  (s = sn))
}

pred dsh_enough_operations {
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.SRoot_S0_t1))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.SRoot_S1_t2))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.SRoot_S2_t3))
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

pred trace_pred [
s1: one DshSnapshot,
s2: one DshSnapshot,
s3: one DshSnapshot,
s4: one DshSnapshot] {
s1 = DshSnapshot/first &&
s2 = s1.DshSnapshot/next &&
s3 = s2.DshSnapshot/next &&
s4 = s3.DshSnapshot/next &&
s1.dsh_conf0 = SRoot_S0 &&
s2.dsh_conf0 = SRoot_S1 &&
s3.dsh_conf0 = SRoot_S2 &&
s4.dsh_conf0 = SRoot_S0}
run trace_pred for exactly 4 DshSnapshot
