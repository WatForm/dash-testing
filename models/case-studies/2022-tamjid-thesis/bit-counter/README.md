# Model History

bit-counter-1.dsh was first written by Tamjid in 2022 as a version of the bit-counter that uses events but also a variable to keep track of which bit has the turn to take a step.

bit-counter-1.dsh was substantially revised by Nancy 2026-06-03 to avoid referencing anything in a sister bit except generating a sister's bit input event.  This means every bit flip is a single big step.

bit-counter-2.dsh is a version written by Nancy 2026-06-03 that uses only events and makes all changes to bits to flip to the next number all in one big step.