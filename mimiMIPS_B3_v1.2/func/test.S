.global __start
.set noreorder
.text
.org 0x0
#__start:
#   lw   $t0, 0x0($zero)     # mem->t0
#   sll  $t1, $t0, 2         # load hazard t0左移两位（*4）->t1
#   addi $t2, $t1, 3         # id-ex hazard t1+3->t2
#   nop
#   sw   $t2, 0xC($zero)     # id-men hazard t2->mem
#   ori  $t2, $zero, 0       # t2清零
#   and  $t1, $zero, $zero   # t1清零
#   lui  $t0, 0x0            # t0清零
#   nop
#   nop
#   j    __start
#   nop
   
__start:
   lw   $t0, 0x0($zero)     # mem->t0
   addi $t1, $t0, 2         # t0+2->t1
   addi $t2, $t1, 1         # t1+1->t2 t0+3->t2
   nop
   sw   $t2, 0xC($zero)     # t2->mem
   ori  $t2, $zero, 0
   ori  $t1, $zero, 0
   ori  $t0, $zero, 0
   nop
   nop
   j    __start