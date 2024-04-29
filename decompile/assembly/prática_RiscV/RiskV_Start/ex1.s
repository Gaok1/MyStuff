.text

.globl _start

# Programa 1
#a = 2;
#b = 3;
#c = 4;
#d = 5;
#x = (a+b)-(c+d);
#y = a-b+x;
#b = x-y;


_start:
  li t1, 2
  li t2, 3
  li t3, 4
  li t4, 5

  # x = (a+b) - (c+d)
  add t5, t1,t2
  add t6, t3,t4
  sub s0, t5,t6
  mv a1,s0
  jal _print

  #y = a-b+x;
  sub t5, t1,t2
  add s1,t2,s0  # Use s0 (x) instead of x0 (zero register)
  mv a1,s1
  jal _print

  #b = x-y;
  sub t2, s0,s1
  mv a1,t2
  jal _print


  j end


_print:
  # Load the address of the newline string into a0
  nop

  ret

end:
  nop


