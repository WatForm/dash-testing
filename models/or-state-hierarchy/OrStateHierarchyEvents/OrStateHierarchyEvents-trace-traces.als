/*
   Automatically created via translation of a Dash model to Alloy
   on 2023-09-16 12:33:09
*/

open util/boolean
open util/traces[DshSnapshot] as DshSnapshot

//Or state hierarchy with env and internal events

abstract sig DshStates {}
abstract sig Root extends DshStates {} 
abstract sig Root_S1 extends Root {} 
one sig Root_S1_S11 extends Root_S1 {} 
one sig Root_S1_S12 extends Root_S1 {} 
abstract sig Root_S2 extends Root {} 
abstract sig Root_S2_S21 extends Root_S2 {} 
one sig Root_S2_S21_S211 extends Root_S2_S21 {} 
one sig Root_S2_S21_S212 extends Root_S2_S21 {} 
abstract sig Root_S2_S22 extends Root_S2 {} 
one sig Root_S2_S22_S221 extends Root_S2_S22 {} 
one sig Root_S2_S22_S222 extends Root_S2_S22 {} 

abstract sig Transitions {}
one sig NO_TRANS extends Transitions {} 
one sig Root_S2_S21_t8 extends Transitions {} 
one sig Root_S1_S11_t1 extends Transitions {} 
one sig Root_S1_S12_t2 extends Transitions {} 
one sig Root_S1_S12_t3 extends Transitions {} 
one sig Root_S2_S22_t13 extends Transitions {} 
one sig Root_S2_S22_S222_t11 extends Transitions {} 
one sig Root_S2_S22_S221_t9 extends Transitions {} 
one sig Root_S2_S22_S222_t12 extends Transitions {} 
one sig Root_S2_S21_S211_t5 extends Transitions {} 
one sig Root_S2_S21_S212_t6 extends Transitions {} 
one sig Root_S2_S21_S211_t4 extends Transitions {} 
one sig Root_S2_S21_S212_t7 extends Transitions {} 
one sig Root_S2_S22_S221_t10 extends Transitions {} 

abstract sig DshEvents {}
abstract sig DshIntEvents extends DshEvents {} 
one sig Root_S2_S22_E2 extends DshIntEvents {} 
one sig Root_S2_E1 extends DshIntEvents {} 
abstract sig DshEnvEvents extends DshEvents {} 
one sig Root_E extends DshEnvEvents {} 

sig DshSnapshot {
  dsh_conf0: set DshStates,
  dsh_taken0: set Transitions,
  dsh_events0: set DshEvents
}

pred dsh_initial [
	s: one DshSnapshot] {
  ((s.dsh_conf0) = Root_S1_S11) &&
  ((s.dsh_taken0) = NO_TRANS) &&
  (((s.dsh_events0) :> DshIntEvents) = none)
}

pred Root_S2_S21_t8_pre [
	s: one DshSnapshot] {
  some (Root_S2_S21 & (s.dsh_conf0))
  Root_E in (s.dsh_events0)
}


pred Root_S2_S21_t8_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((((Root_S1_S11 + Root_S1_S12) + Root_S2_S21_S211) +
           Root_S2_S21_S212) + Root_S2_S22_S221) +
         Root_S2_S22_S222)) + Root_S1_S11)
  (sn.dsh_taken0) = Root_S2_S21_t8
}

pred Root_S2_S21_t8 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_S2_S21_t8_pre
  sn.(s.Root_S2_S21_t8_post)
}

pred Root_S1_S11_t1_pre [
	s: one DshSnapshot] {
  some (Root_S1_S11 & (s.dsh_conf0))
}


pred Root_S1_S11_t1_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) - (Root_S1_S11 + Root_S1_S12)) +
     Root_S1_S12)
  (sn.dsh_taken0) = Root_S1_S11_t1
}

pred Root_S1_S11_t1 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_S1_S11_t1_pre
  sn.(s.Root_S1_S11_t1_post)
}

pred Root_S1_S12_t2_pre [
	s: one DshSnapshot] {
  some (Root_S1_S12 & (s.dsh_conf0))
}


pred Root_S1_S12_t2_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) - (Root_S1_S11 + Root_S1_S12)) +
     Root_S1_S11)
  (sn.dsh_taken0) = Root_S1_S12_t2
}

pred Root_S1_S12_t2 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_S1_S12_t2_pre
  sn.(s.Root_S1_S12_t2_post)
}

pred Root_S1_S12_t3_pre [
	s: one DshSnapshot] {
  some (Root_S1_S12 & (s.dsh_conf0))
  Root_E in (s.dsh_events0)
}


pred Root_S1_S12_t3_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((((Root_S1_S11 + Root_S1_S12) + Root_S2_S21_S211) +
           Root_S2_S21_S212) + Root_S2_S22_S221) +
         Root_S2_S22_S222)) + Root_S2_S21_S211)
  (sn.dsh_taken0) = Root_S1_S12_t3
}

pred Root_S1_S12_t3 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_S1_S12_t3_pre
  sn.(s.Root_S1_S12_t3_post)
}

pred Root_S2_S22_t13_pre [
	s: one DshSnapshot] {
  some (Root_S2_S22 & (s.dsh_conf0))
  Root_E in (s.dsh_events0)
}


pred Root_S2_S22_t13_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((((Root_S1_S11 + Root_S1_S12) + Root_S2_S21_S211) +
           Root_S2_S21_S212) + Root_S2_S22_S221) +
         Root_S2_S22_S222)) + Root_S1_S11)
  (sn.dsh_taken0) = Root_S2_S22_t13
}

pred Root_S2_S22_t13 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_S2_S22_t13_pre
  sn.(s.Root_S2_S22_t13_post)
}

pred Root_S2_S22_S222_t11_pre [
	s: one DshSnapshot] {
  some (Root_S2_S22_S222 & (s.dsh_conf0))
  !(s.Root_S2_S22_t13_pre)
}


pred Root_S2_S22_S222_t11_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) - (Root_S2_S22_S221 + Root_S2_S22_S222)) +
     Root_S2_S22_S221)
  (sn.dsh_taken0) = Root_S2_S22_S222_t11
}

pred Root_S2_S22_S222_t11 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_S2_S22_S222_t11_pre
  sn.(s.Root_S2_S22_S222_t11_post)
}

pred Root_S2_S22_S221_t9_pre [
	s: one DshSnapshot] {
  some (Root_S2_S22_S221 & (s.dsh_conf0))
  Root_S2_S22_E2 in (s.dsh_events0)
  !(s.Root_S2_S22_t13_pre)
}


pred Root_S2_S22_S221_t9_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((Root_S2_S21_S211 + Root_S2_S21_S212) +
          Root_S2_S22_S221) + Root_S2_S22_S222)) +
     Root_S2_S21_S212)
  (sn.dsh_taken0) = Root_S2_S22_S221_t9
}

pred Root_S2_S22_S221_t9 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_S2_S22_S221_t9_pre
  sn.(s.Root_S2_S22_S221_t9_post)
}

pred Root_S2_S22_S222_t12_pre [
	s: one DshSnapshot] {
  some (Root_S2_S22_S222 & (s.dsh_conf0))
  Root_S2_S22_E2 in (s.dsh_events0)
  !(s.Root_S2_S22_t13_pre)
}


pred Root_S2_S22_S222_t12_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((Root_S2_S21_S211 + Root_S2_S21_S212) +
          Root_S2_S22_S221) + Root_S2_S22_S222)) +
     Root_S2_S21_S212)
  (sn.dsh_taken0) = Root_S2_S22_S222_t12
}

pred Root_S2_S22_S222_t12 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_S2_S22_S222_t12_pre
  sn.(s.Root_S2_S22_S222_t12_post)
}

pred Root_S2_S21_S211_t5_pre [
	s: one DshSnapshot] {
  some (Root_S2_S21_S211 & (s.dsh_conf0))
  Root_S2_E1 in (s.dsh_events0)
  !(s.Root_S2_S21_t8_pre)
}


pred Root_S2_S21_S211_t5_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((Root_S2_S21_S211 + Root_S2_S21_S212) +
          Root_S2_S22_S221) + Root_S2_S22_S222)) +
     Root_S2_S22_S221)
  (sn.dsh_taken0) = Root_S2_S21_S211_t5
}

pred Root_S2_S21_S211_t5 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_S2_S21_S211_t5_pre
  sn.(s.Root_S2_S21_S211_t5_post)
}

pred Root_S2_S21_S212_t6_pre [
	s: one DshSnapshot] {
  some (Root_S2_S21_S212 & (s.dsh_conf0))
  !(s.Root_S2_S21_t8_pre)
}


pred Root_S2_S21_S212_t6_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) - (Root_S2_S21_S211 + Root_S2_S21_S212)) +
     Root_S2_S21_S211)
  (sn.dsh_taken0) = Root_S2_S21_S212_t6
}

pred Root_S2_S21_S212_t6 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_S2_S21_S212_t6_pre
  sn.(s.Root_S2_S21_S212_t6_post)
}

pred Root_S2_S21_S211_t4_pre [
	s: one DshSnapshot] {
  some (Root_S2_S21_S211 & (s.dsh_conf0))
  !(s.Root_S2_S21_t8_pre)
}


pred Root_S2_S21_S211_t4_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) - (Root_S2_S21_S211 + Root_S2_S21_S212)) +
     Root_S2_S21_S212)
  (sn.dsh_taken0) = Root_S2_S21_S211_t4
}

pred Root_S2_S21_S211_t4 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_S2_S21_S211_t4_pre
  sn.(s.Root_S2_S21_S211_t4_post)
}

pred Root_S2_S21_S212_t7_pre [
	s: one DshSnapshot] {
  some (Root_S2_S21_S212 & (s.dsh_conf0))
  Root_S2_E1 in (s.dsh_events0)
  !(s.Root_S2_S21_t8_pre)
}


pred Root_S2_S21_S212_t7_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((Root_S2_S21_S211 + Root_S2_S21_S212) +
          Root_S2_S22_S221) + Root_S2_S22_S222)) +
     Root_S2_S22_S222)
  (sn.dsh_taken0) = Root_S2_S21_S212_t7
}

pred Root_S2_S21_S212_t7 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_S2_S21_S212_t7_pre
  sn.(s.Root_S2_S21_S212_t7_post)
}

pred Root_S2_S22_S221_t10_pre [
	s: one DshSnapshot] {
  some (Root_S2_S22_S221 & (s.dsh_conf0))
  !(s.Root_S2_S22_t13_pre)
}


pred Root_S2_S22_S221_t10_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) - (Root_S2_S22_S221 + Root_S2_S22_S222)) +
     Root_S2_S22_S222)
  (sn.dsh_taken0) = Root_S2_S22_S221_t10
}

pred Root_S2_S22_S221_t10 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_S2_S22_S221_t10_pre
  sn.(s.Root_S2_S22_S221_t10_post)
}

pred dsh_small_step [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  { (sn.(s.Root_S2_S21_t8)) ||
    (sn.(s.Root_S1_S11_t1)) ||
    (sn.(s.Root_S1_S12_t2)) ||
    (sn.(s.Root_S1_S12_t3)) ||
    (sn.(s.Root_S2_S22_t13)) ||
    (sn.(s.Root_S2_S22_S222_t11)) ||
    (sn.(s.Root_S2_S22_S221_t9)) ||
    (sn.(s.Root_S2_S22_S222_t12)) ||
    (sn.(s.Root_S2_S21_S211_t5)) ||
    (sn.(s.Root_S2_S21_S212_t6)) ||
    (sn.(s.Root_S2_S21_S211_t4)) ||
    (sn.(s.Root_S2_S21_S212_t7)) ||
    (sn.(s.Root_S2_S22_S221_t10)) ||
    ((!({ (s.Root_S2_S21_t8_pre) ||
            (s.Root_S1_S11_t1_pre) ||
            (s.Root_S1_S12_t2_pre) ||
            (s.Root_S1_S12_t3_pre) ||
            (s.Root_S2_S22_t13_pre) ||
            (s.Root_S2_S22_S222_t11_pre) ||
            (s.Root_S2_S22_S221_t9_pre) ||
            (s.Root_S2_S22_S222_t12_pre) ||
            (s.Root_S2_S21_S211_t5_pre) ||
            (s.Root_S2_S21_S212_t6_pre) ||
            (s.Root_S2_S21_S211_t4_pre) ||
            (s.Root_S2_S21_S212_t7_pre) ||
            (s.Root_S2_S22_S221_t10_pre) })) &&
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
  DshSnapshot | sn.(s.Root_S2_S21_t8))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_S1_S11_t1))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_S1_S12_t2))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_S1_S12_t3))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_S2_S22_t13))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_S2_S22_S222_t11))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_S2_S22_S221_t9))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_S2_S22_S222_t12))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_S2_S21_S211_t5))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_S2_S21_S212_t6))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_S2_S21_S211_t4))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_S2_S21_S212_t7))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_S2_S22_S221_t10))
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
s1.dsh_conf0 = Root_S1_S11 &&
s2.dsh_conf0 = Root_S1_S12 &&
s3.dsh_conf0 = Root_S2_S21_S211 &&
s4.dsh_conf0 = Root_S2_S21_S212 &&
s5.dsh_conf0 = Root_S2_S21_S211 &&
s6.dsh_conf0 = Root_S2_S22_S221 &&
s7.dsh_conf0 = Root_S2_S22_S222 &&
s8.dsh_conf0 = Root_S2_S21_S212
}

run trace_pred for exactly 8 DshSnapshot
