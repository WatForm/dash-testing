one sig s0, s1, s2, s3 extends __Snapshot {}

pred stepper[]{ 
	__initial[s0]

	__small_step[s0,s1]
	__small_step[s1,s2]
	__small_step[s2,s3]

	__trans_enabled[s0]
	__trans_enabled[s1]
	__trans_enabled[s2]
	__trans_enabled[s3]
	
}

run {stepper} for 4 __Snapshot, 3 PID