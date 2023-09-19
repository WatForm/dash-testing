/*
   Automatically created via translation of a Dash model to Alloy
   on 2023-09-08 21:02:02
*/

open util/boolean
open util/traces[DshSnapshot] as DshSnapshot

// basic states with env event

abstract sig DshStates {}
abstract sig Root extends DshStates {} 
one sig Root_S1 extends Root {} 
one sig Root_S2 extends Root {} 
one sig Root_S3 extends Root {} 
one sig Root_S4 extends Root {} 

abstract sig Transitions {}
one sig NO_TRANS extends Transitions {} 
one sig Root_S3_t6 extends Transitions {} 
one sig Root_S4_t8 extends Transitions {} 
one sig Root_S4_t7 extends Transitions {} 
one sig Root_S1_t1 extends Transitions {} 
one sig Root_S1_t2 extends Transitions {} 
one sig Root_S2_t3 extends Transitions {} 
one sig Root_S2_t4 extends Transitions {} 
one sig Root_S3_t5 extends Transitions {} 

abstract sig DshEvents {}
abstract sig DshEnvEvents extends DshEvents {} 
one sig Root_MoveBack extends DshEnvEvents {} 
one sig Root_MoveNext extends DshEnvEvents {} 

sig DshSnapshot {
  dsh_conf0: set DshStates,
  dsh_taken0: set Transitions,
  dsh_events0: set DshEvents
}

pred dsh_initial [
	s: one DshSnapshot] {
  ((s.dsh_conf0) = Root_S1) && ((s.dsh_taken0) = NO_TRANS)
}

pred Root_S3_t6_pre [
	s: one DshSnapshot] {
  some (Root_S3 & (s.dsh_conf0))
  Root_MoveNext in (s.dsh_events0)
}


pred Root_S3_t6_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((Root_S1 + Root_S2) + Root_S3) + Root_S4)) + Root_S4)
  (sn.dsh_taken0) = Root_S3_t6
}

pred Root_S3_t6 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_S3_t6_pre
  sn.(s.Root_S3_t6_post)
}

pred Root_S4_t8_pre [
	s: one DshSnapshot] {
  some (Root_S4 & (s.dsh_conf0))
  Root_MoveNext in (s.dsh_events0)
}


pred Root_S4_t8_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) = (((s.dsh_conf0) - Root_S4) + Root_S4)
  (sn.dsh_taken0) = Root_S4_t8
}

pred Root_S4_t8 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_S4_t8_pre
  sn.(s.Root_S4_t8_post)
}

pred Root_S4_t7_pre [
	s: one DshSnapshot] {
  some (Root_S4 & (s.dsh_conf0))
  Root_MoveBack in (s.dsh_events0)
}


pred Root_S4_t7_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((Root_S1 + Root_S2) + Root_S3) + Root_S4)) + Root_S3)
  (sn.dsh_taken0) = Root_S4_t7
}

pred Root_S4_t7 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_S4_t7_pre
  sn.(s.Root_S4_t7_post)
}

pred Root_S1_t1_pre [
	s: one DshSnapshot] {
  some (Root_S1 & (s.dsh_conf0))
  Root_MoveNext in (s.dsh_events0)
}


pred Root_S1_t1_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((Root_S1 + Root_S2) + Root_S3) + Root_S4)) + Root_S2)
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
  Root_MoveBack in (s.dsh_events0)
}


pred Root_S1_t2_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) = (((s.dsh_conf0) - Root_S1) + Root_S1)
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
  Root_MoveBack in (s.dsh_events0)
}


pred Root_S2_t3_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((Root_S1 + Root_S2) + Root_S3) + Root_S4)) + Root_S1)
  (sn.dsh_taken0) = Root_S2_t3
}

pred Root_S2_t3 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_S2_t3_pre
  sn.(s.Root_S2_t3_post)
}

pred Root_S2_t4_pre [
	s: one DshSnapshot] {
  some (Root_S2 & (s.dsh_conf0))
  Root_MoveNext in (s.dsh_events0)
}


pred Root_S2_t4_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((Root_S1 + Root_S2) + Root_S3) + Root_S4)) + Root_S3)
  (sn.dsh_taken0) = Root_S2_t4
}

pred Root_S2_t4 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_S2_t4_pre
  sn.(s.Root_S2_t4_post)
}

pred Root_S3_t5_pre [
	s: one DshSnapshot] {
  some (Root_S3 & (s.dsh_conf0))
  Root_MoveBack in (s.dsh_events0)
}


pred Root_S3_t5_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((Root_S1 + Root_S2) + Root_S3) + Root_S4)) + Root_S2)
  (sn.dsh_taken0) = Root_S3_t5
}

pred Root_S3_t5 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_S3_t5_pre
  sn.(s.Root_S3_t5_post)
}

pred dsh_small_step [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  { (sn.(s.Root_S3_t6)) ||
    (sn.(s.Root_S4_t8)) ||
    (sn.(s.Root_S4_t7)) ||
    (sn.(s.Root_S1_t1)) ||
    (sn.(s.Root_S1_t2)) ||
    (sn.(s.Root_S2_t3)) ||
    (sn.(s.Root_S2_t4)) ||
    (sn.(s.Root_S3_t5)) ||
    ((!({ (s.Root_S3_t6_pre) ||
            (s.Root_S4_t8_pre) ||
            (s.Root_S4_t7_pre) ||
            (s.Root_S1_t1_pre) ||
            (s.Root_S1_t2_pre) ||
            (s.Root_S2_t3_pre) ||
            (s.Root_S2_t4_pre) ||
            (s.Root_S3_t5_pre) })) &&
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
  DshSnapshot | sn.(s.Root_S3_t6))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_S4_t8))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_S4_t7))
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
  DshSnapshot | sn.(s.Root_S2_t4))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_S3_t5))
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
s4: one DshSnapshot,
s5: one DshSnapshot,
s6: one DshSnapshot,
s7: one DshSnapshot,
s8: one DshSnapshot] {
s1 = DshSnapshot/first &&
s2 = s1.DshSnapshot/next &&
s3 = s2.DshSnapshot/next &&
s4 = s3.DshSnapshot/next &&
s5 = s4.DshSnapshot/next &&
s6 = s5.DshSnapshot/next &&
s7 = s6.DshSnapshot/next &&
s8 = s7.DshSnapshot/next &&
s1.dsh_conf0 = Root_S1 &&
s2.dsh_conf0 = Root_S2 &&
s3.dsh_conf0 = Root_S3 &&
s4.dsh_conf0 = Root_S2 &&
s5.dsh_conf0 = Root_S3 &&
s6.dsh_conf0 = Root_S4 &&
s7.dsh_conf0 = Root_S3 &&
s8.dsh_conf0 = Root_S2}

run trace_pred for exactly 8 DshSnapshot
