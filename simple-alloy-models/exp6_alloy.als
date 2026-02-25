// complex expressions with fields

sig A {
	f : A
}

sig B {
	f : B
}

sig C {
	f : A+B
}

sig D {
	f : A-C
}

sig E {
	g : 
	f : A - g
}

sig F {
	f : F - this
}