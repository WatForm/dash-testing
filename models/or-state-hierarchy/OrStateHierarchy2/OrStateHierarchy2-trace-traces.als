/*
   Automatically created via translation of a Dash model to Alloy
   on 2023-09-11 18:31:30
*/

open util/boolean
open util/traces[DshSnapshot] as DshSnapshot

// or state hierarchy

abstract sig DshStates {}
abstract sig Root extends DshStates {} 
abstract sig Root_A extends Root {} 
abstract sig Root_A_A1 extends Root_A {} 
one sig Root_A_A1_A11 extends Root_A_A1 {} 
one sig Root_A_A1_A12 extends Root_A_A1 {} 
abstract sig Root_A_A2 extends Root_A {} 
one sig Root_A_A2_A21 extends Root_A_A2 {} 
one sig Root_A_A2_A22 extends Root_A_A2 {} 
abstract sig Root_B extends Root {} 
abstract sig Root_B_B1 extends Root_B {} 
one sig Root_B_B1_B11 extends Root_B_B1 {} 
one sig Root_B_B1_B12 extends Root_B_B1 {} 
abstract sig Root_B_B2 extends Root_B {} 
one sig Root_B_B2_B21 extends Root_B_B2 {} 
one sig Root_B_B2_B22 extends Root_B_B2 {} 

abstract sig Transitions {}
one sig NO_TRANS extends Transitions {} 
one sig Root_B_B1_B11_t10 extends Transitions {} 
one sig Root_A_A2_A21_t6 extends Transitions {} 
one sig Root_A_A2_A22_t7 extends Transitions {} 
one sig Root_A_A2_A22_t8 extends Transitions {} 
one sig Root_A_A1_A11_t1 extends Transitions {} 
one sig Root_B_B2_B22_t16 extends Transitions {} 
one sig Root_B_B2_B22_t15 extends Transitions {} 
one sig Root_B_B1_B12_t11 extends Transitions {} 
one sig Root_A_A1_A12_t5 extends Transitions {} 
one sig Root_B_B1_B12_t12 extends Transitions {} 
one sig Root_A_A1_A11_t3 extends Transitions {} 
one sig Root_A_A1_A12_t4 extends Transitions {} 
one sig Root_A_A1_A11_t2 extends Transitions {} 
one sig Root_B_t18 extends Transitions {} 
one sig Root_A_t17 extends Transitions {} 
one sig Root_B_B1_B11_t9 extends Transitions {} 
one sig Root_B_B2_B21_t14 extends Transitions {} 
one sig Root_B_B2_B21_t13 extends Transitions {} 

sig DshSnapshot {
  dsh_conf0: set DshStates,
  dsh_taken0: set Transitions
}

pred dsh_initial [
	s: one DshSnapshot] {
  ((s.dsh_conf0) = Root_A_A1_A11) &&
  ((s.dsh_taken0) = NO_TRANS)
}

pred Root_B_B1_B11_t10_pre [
	s: one DshSnapshot] {
  some (Root_B_B1_B11 & (s.dsh_conf0))
  !(s.Root_B_t18_pre)
}


pred Root_B_B1_B11_t10_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((((((Root_A_A1_A11 + Root_A_A1_A12) + Root_A_A2_A21)
             + Root_A_A2_A22) + Root_B_B1_B11) +
           Root_B_B1_B12) + Root_B_B2_B21) + Root_B_B2_B22))
     + Root_A_A2_A21)
  (sn.dsh_taken0) = Root_B_B1_B11_t10
}

pred Root_B_B1_B11_t10 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_B_B1_B11_t10_pre
  sn.(s.Root_B_B1_B11_t10_post)
}

pred Root_A_A2_A21_t6_pre [
	s: one DshSnapshot] {
  some (Root_A_A2_A21 & (s.dsh_conf0))
  !(s.Root_A_t17_pre)
}


pred Root_A_A2_A21_t6_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) - (Root_A_A2_A21 + Root_A_A2_A22)) +
     Root_A_A2_A22)
  (sn.dsh_taken0) = Root_A_A2_A21_t6
}

pred Root_A_A2_A21_t6 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_A_A2_A21_t6_pre
  sn.(s.Root_A_A2_A21_t6_post)
}

pred Root_A_A2_A22_t7_pre [
	s: one DshSnapshot] {
  some (Root_A_A2_A22 & (s.dsh_conf0))
  !(s.Root_A_t17_pre)
}


pred Root_A_A2_A22_t7_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((((((Root_A_A1_A11 + Root_A_A1_A12) + Root_A_A2_A21)
             + Root_A_A2_A22) + Root_B_B1_B11) +
           Root_B_B1_B12) + Root_B_B2_B21) + Root_B_B2_B22))
     + Root_B_B1_B11)
  (sn.dsh_taken0) = Root_A_A2_A22_t7
}

pred Root_A_A2_A22_t7 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_A_A2_A22_t7_pre
  sn.(s.Root_A_A2_A22_t7_post)
}

pred Root_A_A2_A22_t8_pre [
	s: one DshSnapshot] {
  some (Root_A_A2_A22 & (s.dsh_conf0))
  !(s.Root_A_t17_pre)
}


pred Root_A_A2_A22_t8_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((Root_A_A1_A11 + Root_A_A1_A12) + Root_A_A2_A21) +
         Root_A_A2_A22)) + Root_A_A1_A11)
  (sn.dsh_taken0) = Root_A_A2_A22_t8
}

pred Root_A_A2_A22_t8 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_A_A2_A22_t8_pre
  sn.(s.Root_A_A2_A22_t8_post)
}

pred Root_A_A1_A11_t1_pre [
	s: one DshSnapshot] {
  some (Root_A_A1_A11 & (s.dsh_conf0))
  !(s.Root_A_t17_pre)
}


pred Root_A_A1_A11_t1_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) - (Root_A_A1_A11 + Root_A_A1_A12)) +
     Root_A_A1_A12)
  (sn.dsh_taken0) = Root_A_A1_A11_t1
}

pred Root_A_A1_A11_t1 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_A_A1_A11_t1_pre
  sn.(s.Root_A_A1_A11_t1_post)
}

pred Root_B_B2_B22_t16_pre [
	s: one DshSnapshot] {
  some (Root_B_B2_B22 & (s.dsh_conf0))
  !(s.Root_B_t18_pre)
}


pred Root_B_B2_B22_t16_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((((((Root_A_A1_A11 + Root_A_A1_A12) + Root_A_A2_A21)
             + Root_A_A2_A22) + Root_B_B1_B11) +
           Root_B_B1_B12) + Root_B_B2_B21) + Root_B_B2_B22))
     + Root_A_A1_A12)
  (sn.dsh_taken0) = Root_B_B2_B22_t16
}

pred Root_B_B2_B22_t16 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_B_B2_B22_t16_pre
  sn.(s.Root_B_B2_B22_t16_post)
}

pred Root_B_B2_B22_t15_pre [
	s: one DshSnapshot] {
  some (Root_B_B2_B22 & (s.dsh_conf0))
  !(s.Root_B_t18_pre)
}


pred Root_B_B2_B22_t15_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) - (Root_B_B2_B21 + Root_B_B2_B22)) +
     Root_B_B2_B21)
  (sn.dsh_taken0) = Root_B_B2_B22_t15
}

pred Root_B_B2_B22_t15 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_B_B2_B22_t15_pre
  sn.(s.Root_B_B2_B22_t15_post)
}

pred Root_B_B1_B12_t11_pre [
	s: one DshSnapshot] {
  some (Root_B_B1_B12 & (s.dsh_conf0))
  !(s.Root_B_t18_pre)
}


pred Root_B_B1_B12_t11_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((Root_B_B1_B11 + Root_B_B1_B12) + Root_B_B2_B21) +
         Root_B_B2_B22)) + Root_B_B2_B21)
  (sn.dsh_taken0) = Root_B_B1_B12_t11
}

pred Root_B_B1_B12_t11 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_B_B1_B12_t11_pre
  sn.(s.Root_B_B1_B12_t11_post)
}

pred Root_A_A1_A12_t5_pre [
	s: one DshSnapshot] {
  some (Root_A_A1_A12 & (s.dsh_conf0))
  !(s.Root_A_t17_pre)
}


pred Root_A_A1_A12_t5_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((((((Root_A_A1_A11 + Root_A_A1_A12) + Root_A_A2_A21)
             + Root_A_A2_A22) + Root_B_B1_B11) +
           Root_B_B1_B12) + Root_B_B2_B21) + Root_B_B2_B22))
     + Root_B_B2_B22)
  (sn.dsh_taken0) = Root_A_A1_A12_t5
}

pred Root_A_A1_A12_t5 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_A_A1_A12_t5_pre
  sn.(s.Root_A_A1_A12_t5_post)
}

pred Root_B_B1_B12_t12_pre [
	s: one DshSnapshot] {
  some (Root_B_B1_B12 & (s.dsh_conf0))
  !(s.Root_B_t18_pre)
}


pred Root_B_B1_B12_t12_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) - (Root_B_B1_B11 + Root_B_B1_B12)) +
     Root_B_B1_B11)
  (sn.dsh_taken0) = Root_B_B1_B12_t12
}

pred Root_B_B1_B12_t12 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_B_B1_B12_t12_pre
  sn.(s.Root_B_B1_B12_t12_post)
}

pred Root_A_A1_A11_t3_pre [
	s: one DshSnapshot] {
  some (Root_A_A1_A11 & (s.dsh_conf0))
  !(s.Root_A_t17_pre)
}


pred Root_A_A1_A11_t3_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((((((Root_A_A1_A11 + Root_A_A1_A12) + Root_A_A2_A21)
             + Root_A_A2_A22) + Root_B_B1_B11) +
           Root_B_B1_B12) + Root_B_B2_B21) + Root_B_B2_B22))
     + Root_B_B1_B12)
  (sn.dsh_taken0) = Root_A_A1_A11_t3
}

pred Root_A_A1_A11_t3 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_A_A1_A11_t3_pre
  sn.(s.Root_A_A1_A11_t3_post)
}

pred Root_A_A1_A12_t4_pre [
	s: one DshSnapshot] {
  some (Root_A_A1_A12 & (s.dsh_conf0))
  !(s.Root_A_t17_pre)
}


pred Root_A_A1_A12_t4_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((Root_A_A1_A11 + Root_A_A1_A12) + Root_A_A2_A21) +
         Root_A_A2_A22)) + Root_A_A2_A22)
  (sn.dsh_taken0) = Root_A_A1_A12_t4
}

pred Root_A_A1_A12_t4 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_A_A1_A12_t4_pre
  sn.(s.Root_A_A1_A12_t4_post)
}

pred Root_A_A1_A11_t2_pre [
	s: one DshSnapshot] {
  some (Root_A_A1_A11 & (s.dsh_conf0))
  !(s.Root_A_t17_pre)
}


pred Root_A_A1_A11_t2_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((Root_A_A1_A11 + Root_A_A1_A12) + Root_A_A2_A21) +
         Root_A_A2_A22)) + Root_A_A2_A21)
  (sn.dsh_taken0) = Root_A_A1_A11_t2
}

pred Root_A_A1_A11_t2 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_A_A1_A11_t2_pre
  sn.(s.Root_A_A1_A11_t2_post)
}

pred Root_B_t18_pre [
	s: one DshSnapshot] {
  some (Root_B & (s.dsh_conf0))
}


pred Root_B_t18_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((((((Root_A_A1_A11 + Root_A_A1_A12) + Root_A_A2_A21)
             + Root_A_A2_A22) + Root_B_B1_B11) +
           Root_B_B1_B12) + Root_B_B2_B21) + Root_B_B2_B22))
     + Root_A_A2_A22)
  (sn.dsh_taken0) = Root_B_t18
}

pred Root_B_t18 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_B_t18_pre
  sn.(s.Root_B_t18_post)
}

pred Root_A_t17_pre [
	s: one DshSnapshot] {
  some (Root_A & (s.dsh_conf0))
}


pred Root_A_t17_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((((((Root_A_A1_A11 + Root_A_A1_A12) + Root_A_A2_A21)
             + Root_A_A2_A22) + Root_B_B1_B11) +
           Root_B_B1_B12) + Root_B_B2_B21) + Root_B_B2_B22))
     + Root_B_B1_B11)
  (sn.dsh_taken0) = Root_A_t17
}

pred Root_A_t17 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_A_t17_pre
  sn.(s.Root_A_t17_post)
}

pred Root_B_B1_B11_t9_pre [
	s: one DshSnapshot] {
  some (Root_B_B1_B11 & (s.dsh_conf0))
  !(s.Root_B_t18_pre)
}


pred Root_B_B1_B11_t9_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((Root_B_B1_B11 + Root_B_B1_B12) + Root_B_B2_B21) +
         Root_B_B2_B22)) + Root_B_B2_B21)
  (sn.dsh_taken0) = Root_B_B1_B11_t9
}

pred Root_B_B1_B11_t9 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_B_B1_B11_t9_pre
  sn.(s.Root_B_B1_B11_t9_post)
}

pred Root_B_B2_B21_t14_pre [
	s: one DshSnapshot] {
  some (Root_B_B2_B21 & (s.dsh_conf0))
  !(s.Root_B_t18_pre)
}


pred Root_B_B2_B21_t14_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((((((Root_A_A1_A11 + Root_A_A1_A12) + Root_A_A2_A21)
             + Root_A_A2_A22) + Root_B_B1_B11) +
           Root_B_B1_B12) + Root_B_B2_B21) + Root_B_B2_B22))
     + Root_A_A2_A21)
  (sn.dsh_taken0) = Root_B_B2_B21_t14
}

pred Root_B_B2_B21_t14 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_B_B2_B21_t14_pre
  sn.(s.Root_B_B2_B21_t14_post)
}

pred Root_B_B2_B21_t13_pre [
	s: one DshSnapshot] {
  some (Root_B_B2_B21 & (s.dsh_conf0))
  !(s.Root_B_t18_pre)
}


pred Root_B_B2_B21_t13_post [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  (sn.dsh_conf0) =
  (((s.dsh_conf0) -
      (((Root_B_B1_B11 + Root_B_B1_B12) + Root_B_B2_B21) +
         Root_B_B2_B22)) + Root_B_B1_B11)
  (sn.dsh_taken0) = Root_B_B2_B21_t13
}

pred Root_B_B2_B21_t13 [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  s.Root_B_B2_B21_t13_pre
  sn.(s.Root_B_B2_B21_t13_post)
}

pred dsh_small_step [
	s: one DshSnapshot,
	sn: one DshSnapshot] {
  { (sn.(s.Root_B_B1_B11_t10)) ||
    (sn.(s.Root_A_A2_A21_t6)) ||
    (sn.(s.Root_A_A2_A22_t7)) ||
    (sn.(s.Root_A_A2_A22_t8)) ||
    (sn.(s.Root_A_A1_A11_t1)) ||
    (sn.(s.Root_B_B2_B22_t16)) ||
    (sn.(s.Root_B_B2_B22_t15)) ||
    (sn.(s.Root_B_B1_B12_t11)) ||
    (sn.(s.Root_A_A1_A12_t5)) ||
    (sn.(s.Root_B_B1_B12_t12)) ||
    (sn.(s.Root_A_A1_A11_t3)) ||
    (sn.(s.Root_A_A1_A12_t4)) ||
    (sn.(s.Root_A_A1_A11_t2)) ||
    (sn.(s.Root_B_t18)) ||
    (sn.(s.Root_A_t17)) ||
    (sn.(s.Root_B_B1_B11_t9)) ||
    (sn.(s.Root_B_B2_B21_t14)) ||
    (sn.(s.Root_B_B2_B21_t13)) ||
    ((!({ (s.Root_B_B1_B11_t10_pre) ||
            (s.Root_A_A2_A21_t6_pre) ||
            (s.Root_A_A2_A22_t7_pre) ||
            (s.Root_A_A2_A22_t8_pre) ||
            (s.Root_A_A1_A11_t1_pre) ||
            (s.Root_B_B2_B22_t16_pre) ||
            (s.Root_B_B2_B22_t15_pre) ||
            (s.Root_B_B1_B12_t11_pre) ||
            (s.Root_A_A1_A12_t5_pre) ||
            (s.Root_B_B1_B12_t12_pre) ||
            (s.Root_A_A1_A11_t3_pre) ||
            (s.Root_A_A1_A12_t4_pre) ||
            (s.Root_A_A1_A11_t2_pre) ||
            (s.Root_B_t18_pre) ||
            (s.Root_A_t17_pre) ||
            (s.Root_B_B1_B11_t9_pre) ||
            (s.Root_B_B2_B21_t14_pre) ||
            (s.Root_B_B2_B21_t13_pre) })) &&
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
  DshSnapshot | sn.(s.Root_B_B1_B11_t10))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_A_A2_A21_t6))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_A_A2_A22_t7))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_A_A2_A22_t8))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_A_A1_A11_t1))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_B_B2_B22_t16))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_B_B2_B22_t15))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_B_B1_B12_t11))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_A_A1_A12_t5))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_B_B1_B12_t12))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_A_A1_A11_t3))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_A_A1_A12_t4))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_A_A1_A11_t2))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_B_t18))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_A_t17))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_B_B1_B11_t9))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_B_B2_B21_t14))
  (some s: one
  DshSnapshot,sn: one
  DshSnapshot | sn.(s.Root_B_B2_B21_t13))
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
s7: one DshSnapshot] {
s1 = DshSnapshot/first &&
s2 = s1.DshSnapshot/next &&
s3 = s2.DshSnapshot/next &&
s4 = s3.DshSnapshot/next &&
s5 = s4.DshSnapshot/next &&
s6 = s5.DshSnapshot/next &&
s7 = s6.DshSnapshot/next &&
s1.dsh_conf0 = Root_A_A1_A11 &&
s2.dsh_conf0 = Root_B_B1_B12 &&
s3.dsh_conf0 = Root_B_B1_B11 &&
s4.dsh_conf0 = Root_A_A2_A21 &&
s5.dsh_conf0 = Root_A_A2_A22 &&
s6.dsh_conf0 = Root_B_B1_B11 &&
s7.dsh_conf0 = Root_B_B2_B21}

run trace_pred for exactly 7 DshSnapshot
