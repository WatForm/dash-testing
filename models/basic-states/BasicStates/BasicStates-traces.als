/*
   Automatically created via translation of a Dash model to Alloy
   on 2023-08-17 12:58:26
*/

open util/boolean
open util/traces[DshSnapshot] as DshSnapshot

// flat model 

abstract sig DshStates {}
abstract sig Root extends DshStates {} 
one sig Root_A extends Root {} 
one sig Root_B extends Root {} 
one sig Root_C extends Root {} 
one sig Root_D extends Root {} 
one sig Root_E extends Root {} 
one sig Root_F extends Root {} 

abstract sig Transitions {}
one sig NO_TRANS extends Transitions {} 
one sig Root_A_t1 extends Transitions {} 
one sig Root_A_t2 extends Transitions {} 
one sig Root_B_t3 extends Transitions {} 
one sig Root_E_t8 extends Transitions {} 
one sig Root_F_t9 extends Transitions {} 
one sig Root_B_t4 extends Transitions {} 
one sig Root_D_t7 extends Transitions {} 
one sig Root_C_t5 extends Transitions {} 
one sig Root_D_t6 extends Transitions {} 

sig DshSnapshot {
  dsh_conf0: set DshStates,
  dsh_taken0: set Transitions
}

pred dsh_initial [
	s: one DshSnapshot] {
  ((s.dsh_conf0) = Root_A) && ((s.dsh_taken0) = NO_TRANS)
}

pred Root_A_t1_pre [
	s: one DshSnapshot] {
  some (Root_A & (s.dsh_conf0))
}


pred Root_A_t1_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((((Root_A + Root_B) + Root_C) + Root_D) + Root_E) +
         Root_F)) + Root_B)
  (sn.dsh_taken0) = Root_A_t1
}

pred Root_A_t1 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_A_t1_pre
  sn.(s.Root_A_t1_post)
}

pred Root_A_t2_pre [
	s: one DshSnapshot] {
  some (Root_A & (s.dsh_conf0))
}


pred Root_A_t2_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((((Root_A + Root_B) + Root_C) + Root_D) + Root_E) +
         Root_F)) + Root_D)
  (sn.dsh_taken0) = Root_A_t2
}

pred Root_A_t2 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_A_t2_pre
  sn.(s.Root_A_t2_post)
}

pred Root_B_t3_pre [
	s: one DshSnapshot] {
  some (Root_B & (s.dsh_conf0))
}


pred Root_B_t3_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((((Root_A + Root_B) + Root_C) + Root_D) + Root_E) +
         Root_F)) + Root_C)
  (sn.dsh_taken0) = Root_B_t3
}

pred Root_B_t3 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_B_t3_pre
  sn.(s.Root_B_t3_post)
}

pred Root_E_t8_pre [
	s: one DshSnapshot] {
  some (Root_E & (s.dsh_conf0))
}


pred Root_E_t8_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((((Root_A + Root_B) + Root_C) + Root_D) + Root_E) +
         Root_F)) + Root_F)
  (sn.dsh_taken0) = Root_E_t8
}

pred Root_E_t8 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_E_t8_pre
  sn.(s.Root_E_t8_post)
}

pred Root_F_t9_pre [
	s: one DshSnapshot] {
  some (Root_F & (s.dsh_conf0))
}


pred Root_F_t9_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((((Root_A + Root_B) + Root_C) + Root_D) + Root_E) +
         Root_F)) + Root_A)
  (sn.dsh_taken0) = Root_F_t9
}

pred Root_F_t9 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_F_t9_pre
  sn.(s.Root_F_t9_post)
}

pred Root_B_t4_pre [
	s: one DshSnapshot] {
  some (Root_B & (s.dsh_conf0))
}


pred Root_B_t4_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((((Root_A + Root_B) + Root_C) + Root_D) + Root_E) +
         Root_F)) + Root_E)
  (sn.dsh_taken0) = Root_B_t4
}

pred Root_B_t4 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_B_t4_pre
  sn.(s.Root_B_t4_post)
}

pred Root_D_t7_pre [
	s: one DshSnapshot] {
  some (Root_D & (s.dsh_conf0))
}


pred Root_D_t7_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((((Root_A + Root_B) + Root_C) + Root_D) + Root_E) +
         Root_F)) + Root_B)
  (sn.dsh_taken0) = Root_D_t7
}

pred Root_D_t7 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_D_t7_pre
  sn.(s.Root_D_t7_post)
}

pred Root_C_t5_pre [
	s: one DshSnapshot] {
  some (Root_C & (s.dsh_conf0))
}


pred Root_C_t5_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((((Root_A + Root_B) + Root_C) + Root_D) + Root_E) +
         Root_F)) + Root_F)
  (sn.dsh_taken0) = Root_C_t5
}

pred Root_C_t5 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_C_t5_pre
  sn.(s.Root_C_t5_post)
}

pred Root_D_t6_pre [
	s: one DshSnapshot] {
  some (Root_D & (s.dsh_conf0))
}


pred Root_D_t6_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((((Root_A + Root_B) + Root_C) + Root_D) + Root_E) +
         Root_F)) + Root_E)
  (sn.dsh_taken0) = Root_D_t6
}

pred Root_D_t6 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_D_t6_pre
  sn.(s.Root_D_t6_post)
}

pred dsh_small_step [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  { (sn.(s.Root_A_t1)) ||
    (sn.(s.Root_A_t2)) ||
    (sn.(s.Root_B_t3)) ||
    (sn.(s.Root_E_t8)) ||
    (sn.(s.Root_F_t9)) ||
    (sn.(s.Root_B_t4)) ||
    (sn.(s.Root_D_t7)) ||
    (sn.(s.Root_C_t5)) ||
    (sn.(s.Root_D_t6)) ||
    ((!({ (s.Root_A_t1_pre) ||
            (s.Root_A_t2_pre) ||
            (s.Root_B_t3_pre) ||
            (s.Root_E_t8_pre) ||
            (s.Root_F_t9_pre) ||
            (s.Root_B_t4_pre) ||
            (s.Root_D_t7_pre) ||
            (s.Root_C_t5_pre) ||
            (s.Root_D_t6_pre) })) &&
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
  DshSnapshot | sn.(s.Root_A_t1))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_A_t2))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_B_t3))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_E_t8))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_F_t9))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_B_t4))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_D_t7))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_C_t5))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_D_t6))
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

// traces pred

pred trace_pred [
s1: one DshSnapshot, 
s2: one DshSnapshot, 
s3: one DshSnapshot, 
s4: one DshSnapshot, 
s5: one DshSnapshot, 
s6: one DshSnapshot, 
s7: one DshSnapshot, 
s8: one DshSnapshot] {
//	(DshSnapshot/first).dsh_conf0 = Root_A
//	(DshSnapshot/first).(DshSnapshot/next).dsh_conf0 = Root_D
//	(DshSnapshot/first).(DshSnapshot/next).(DshSnapshot/next).dsh_conf0 = Root_B
//	(DshSnapshot/first).(DshSnapshot/next).(DshSnapshot/next).(DshSnapshot/next).dsh_conf0 = Root_E
//}


s1 = DshSnapshot/first &&
s2 = s1.DshSnapshot/next &&
s3 = s2.DshSnapshot/next &&
s4 = s3.DshSnapshot/next &&
s5 = s4.DshSnapshot/next &&
s6 = s5.DshSnapshot/next &&
s7 = s6.DshSnapshot/next &&
s8 = s7.DshSnapshot/next &&
s1.dsh_conf0 = Root_A &&
s2.dsh_conf0 = Root_D &&
s3.dsh_conf0 = Root_B &&
s4.dsh_conf0 = Root_E &&
s5.dsh_conf0 = Root_F &&
s6.dsh_conf0 = Root_A &&
s7.dsh_conf0 = Root_B &&
s8.dsh_conf0 = Root_C
}

run trace_pred for exactly 8 DshSnapshot

