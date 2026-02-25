// simple fields with atomic multiplicities

sig A {

}
sig B {
	w : one A
	x : lone A
	y : some A
	z : set A
}